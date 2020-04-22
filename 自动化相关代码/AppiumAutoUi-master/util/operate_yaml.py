#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-12 16:19
# @Author  : Weiss
# @File    : operate_yaml.py
# @Software: PyCharm
import json
import os

import yaml

PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)


class OperateYaml:

    def __init__(self, file_path):
        self.file_path = file_path

    def read_yaml(self):
        """
        读取yaml文件
        :return:
        """
        with open(self.file_path, mode='r', encoding='utf-8') as stream:
            # LogMsg.logger.info('读取yaml文件：' + yaml_file)
            return yaml.full_load(stream)
    #
    # # 创建yaml文件
    # def create_yaml_file(self):
    #     with open(self.file_path, mode='x', encoding='utf-8'):
    #         LogMsg.logger.info('创建yaml文件：' + yaml_file)

    # 写入yaml文件
    def write_yaml_file(self, data):
        """
        写入yaml文件，会先删除文件
        :param data:请传入json对象
        :return:
        """
        if isinstance(data,dict):
            with open(self.file_path, mode='w', encoding='utf-8') as stream:
                yaml.dump(data, stream, allow_unicode=True, encoding='utf-8', default_flow_style=False)
        else:
            print("data is error")




if __name__ == '__main__':
    filepath = "../config/project_base.yaml"
    #data = "{\"head\":{\"tran_cdde\":\"500015\",\"version_id\":\"1.0.1\",\"channel\":\"1\"},\"body\":{\"prdNo\":\"\"}}"
    #data1 = json.loads(data)
    dt = OperateYaml(filepath)
    rt = dt.read_yaml()
    print(rt)
