# @Time    : 2019/1/14 15:11
# @Author  : charles

from rest_framework import serializers
from ..models import Role

class RoleListSerializer(serializers.ModelSerializer):
    '''
    角色序列化
    '''
    class Meta:
        model = Role
        fields = '__all__'
        #depth = 1

class RoleModifySerializer(serializers.ModelSerializer):
    class Meta:
        model = Role
        fields = '__all__'