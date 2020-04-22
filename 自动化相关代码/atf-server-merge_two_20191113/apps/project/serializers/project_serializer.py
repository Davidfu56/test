# @Time    : 2019/2/27 14:39
# @Author  : Weiss
from rest_framework import serializers
from ..models import Project

class ProjectSerializer(serializers.ModelSerializer):
    '''
    项目序列化
    '''
    owner = serializers.CharField(source='owner.name')
    class Meta:
        model = Project
        fields = '__all__'

class ProjectListSerializer(serializers.ModelSerializer):
    '''
    项目列表序列化
    '''
    class Meta:
        model = Project
        fields = ('id', 'name', 'project_type', 'repo_mode', 'user_id')
