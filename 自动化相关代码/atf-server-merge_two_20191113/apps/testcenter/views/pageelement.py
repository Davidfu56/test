#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-08-28 16:51
# @Author  : Weiss
# @File    : pageelement.py
# @Software: PyCharm
from rest_framework.decorators import action
from rest_framework.viewsets import ModelViewSet
from rest_framework.views import APIView
from ..models import PageElement
from ..serializers.pageelement_serializers import PageElementSerializer, PageElementListSerializer
from common.custom import CommonPagination, RbacPermission
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Q
from rest_xops.code import *
from rest_xops.basic import WResponse
import copy


class PageElementViewSet(ModelViewSet):
    '''
    元素管理：增删改查
    '''
    perms_map = (
        {'*': 'admin'}, {'*': 'pageelement_all'}, {'get': 'pageelement_list'}, {'post': 'pageelement_create'},
        {'put': 'pageelement_edit'},
        {'delete': 'pageelement_delete'})
    queryset = PageElement.objects.all()
    serializer_class = PageElementSerializer
    pagination_class = CommonPagination
    filter_backends = (DjangoFilterBackend, SearchFilter, OrderingFilter)
    filter_fields = ('project', )
    search_fields = ('element_name', 'page_name')
    ordering_fields = ('id',)
    authentication_classes = (JSONWebTokenAuthentication,)
    permission_classes = (RbacPermission,)

    def get_serializer_class(self):
        # 根据请求类型动态变更serializer
        if self.action == 'list':
            return PageElementListSerializer
        return PageElementSerializer

    def create(self, request, *args, **kwargs):
        request.data['element_name'] = '$' + request.data['element_name']
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return WResponse(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def update(self, request, *args, **kwargs):
        request.data['element_name'] = '$' + request.data['element_name']
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            instance._prefetched_objects_cache = {}

        return WResponse(serializer.data)

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:

            serializer = self.get_serializer(page, many=True)
            for item in serializer.data:
                item['element_name'] =  item['element_name'].replace("$","")
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return WResponse(serializer.data)

    # def get_queryset(self):
    #     '''
    #     只有项目组成员才能看到项目
    #     '''
    #     perms = RbacPermission.get_permission_from_role(self.request)
    #     if 'admin' in perms or 'project_all' in perms:
    #         return self.queryset.all()
    #     else:
    #         uid = str(self.request.user.id)
    #         result = self.queryset.filter(
    #             Q(user_id__icontains=uid + ',') | Q(user_id__in=uid) | Q(user_id__endswith=',' + uid))
    #     return result

    @action(methods=['post'],detail=False)
    def copy(self,request):
        if request.data['id']:
            old_pageelement = PageElement.objects.get(id=request.data['id'])
            new_pageelement = copy.deepcopy(old_pageelement)
            new_pageelement.pk = None
            new_pageelement.element_name = '复制___' + new_pageelement.element_name
            new_pageelement.save()
            http_status = OK
            msg = '复制成功!'
        else:
            http_status = BAD
            msg = '复制失败!元素ID为空!'
        return WResponse(msg, status=http_status)

