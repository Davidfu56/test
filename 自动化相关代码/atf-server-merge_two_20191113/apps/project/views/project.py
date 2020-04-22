# @Time    : 2019/2/27 14:39
# @Author  : charles
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet
from rest_framework.generics import ListAPIView
from ..models import Project
from ..serializers.project_serializer import ProjectSerializer, ProjectListSerializer
from common.custom import CommonPagination, RbacPermission, TreeAPIView
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Q
from rest_xops.code import *
from rest_xops.basic import WResponse
import copy


class ProjectViewSet(ModelViewSet):
    '''
    项目管理：增删改查
    '''
    perms_map = (
        {'*': 'admin'}, {'*': 'project_all'}, {'get': 'project_list'}, {'post': 'project_create'},
        {'put': 'project_edit'},
        {'delete': 'project_delete'})
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer
    pagination_class = CommonPagination
    filter_backends = (DjangoFilterBackend, SearchFilter, OrderingFilter)
    filter_fields = ('project_type',)
    search_fields = ('name',)
    ordering_fields = ('id',)
    authentication_classes = (JSONWebTokenAuthentication,)
    permission_classes = (RbacPermission,)

    def get_serializer_class(self):
        # 根据请求类型动态变更serializer
        if self.action == 'list' or self.action == 'all':
            return ProjectListSerializer
        return ProjectSerializer

    def get_queryset(self):
        '''
        只有项目组成员才能看到项目
        '''
        perms = RbacPermission.get_permission_from_role(self.request)
        if 'admin' in perms:
            return self.queryset.all()
        else:
            uid = str(self.request.user.id)
            result = self.queryset.filter(
                Q(user_id__icontains=uid + ',') | Q(user_id__in=uid) | Q(user_id__endswith=',' + uid) | Q(owner=uid))
        return result

    @action(methods=['get'], detail=False)
    def getlist(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        request.data['owner'] = self.request.user.id
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    @action(methods=['post'],detail=False)
    def copy(self,request):
        if request.data['id']:
            old_project = Project.objects.get(id=request.data['id'])
            new_project = copy.deepcopy(old_project)
            new_project.pk = None
            new_project.name = '复制___' + new_project.name
            new_project.status = 'Failed'
            new_project.save()
            http_status = OK
            msg = '复制成功!'
        else:
            http_status = BAD
            msg = '复制失败!项目ID为空!'
        return WResponse(msg, status=http_status)




