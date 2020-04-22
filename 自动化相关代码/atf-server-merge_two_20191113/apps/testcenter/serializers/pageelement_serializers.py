#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-08-28 16:36
# @Author  : Weiss
# @File    : pageelement_serializers.py
# @Software: PyCharm
from testcenter.models import PageElement
from rest_framework import serializers


class PageElementSerializer(serializers.ModelSerializer):
    '''
    序列化
    '''

    class Meta:
        model = PageElement
        fields = '__all__'


class PageElementListSerializer(serializers.ModelSerializer):
    '''
    列表序列化
    '''

    class Meta:
        model = PageElement
        fields = (
        'id', 'project', 'page_name', 'element_name', 'element_alias', 'element_by', 'element_locate', 'element_index')
        depth = 1
