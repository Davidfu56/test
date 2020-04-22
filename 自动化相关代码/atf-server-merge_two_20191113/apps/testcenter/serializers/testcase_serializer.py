#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-08-28 16:36
# @Author  : Weiss
# @File    : pageelement_serializers.py
# @Software: PyCharm
from testcenter.models import TestCase, UiStep, UiCheck
from rest_framework import serializers


class TestCaseSerializer(serializers.ModelSerializer):
    '''
    序列化
    '''
    class Meta:
        model = TestCase
        fields = '__all__'

class TestCaseListSerializer(serializers.ModelSerializer):
    '''
    列表序列化
    '''
    project = serializers.CharField(source='project.name')
    owner = serializers.CharField(source='owner.name')
    class Meta:
        model = TestCase
        fields = ('id', 'project', 'case_model', 'case_title', 'case_type', 'flag', 'owner')