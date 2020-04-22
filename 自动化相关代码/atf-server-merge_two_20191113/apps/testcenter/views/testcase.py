#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-09-02 14:47
# @Author  : Weiss
# @File    : testcase.py
# @Software: PyCharm
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet
from rest_framework.generics import ListAPIView
from testcenter.models import TestCase
from testcenter.serializers.testcase_serializer import TestCaseSerializer, TestCaseListSerializer
from common.custom import CommonPagination, RbacPermission
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Q
from rest_xops.code import *
from rest_xops.basic import WResponse
import copy


class TestCaseViewSet(ModelViewSet):
    '''
    元素管理：增删改查
    '''
    perms_map = (
        {'*': 'admin'}, {'*': 'testcase_all'}, {'get': 'testcase_list'}, {'post': 'testcase_create'},
        {'put': 'testcase_edit'},
        {'delete': 'testcase_delete'})
    queryset = TestCase.objects.all()
    serializer_class = TestCaseSerializer
    pagination_class = CommonPagination
    filter_backends = (DjangoFilterBackend, SearchFilter, OrderingFilter)
    filter_fields = ('project', 'case_type', 'flag')
    search_fields = ('case_title')
    ordering_fields = ('id',)
    authentication_classes = (JSONWebTokenAuthentication,)
    permission_classes = (RbacPermission,)

    def get_serializer_class(self):
        # 根据请求类型动态变更serializer
        if self.action == 'list':
            return TestCaseListSerializer
        return TestCaseSerializer

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
            old_testcase = TestCase.objects.get(id=request.data['id'])
            new_testcase = copy.deepcopy(old_testcase)
            new_testcase.pk = None
            new_testcase.case_title = '复制___' + new_testcase.case_title
            new_testcase.save()
            http_status = OK
            msg = '复制成功!'
        else:
            http_status = BAD
            msg = '复制失败！'
        return WResponse(msg, status=http_status)
