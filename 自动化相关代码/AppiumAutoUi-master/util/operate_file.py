#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-17 16:25
# @Author  : Weiss
# @File    : operate_file.py
# @Software: PyCharm
import os
from util.operate_yaml import OperateYaml
from util.operate_excel import OperateExcel


PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)

class OperateFile:

    def __init__(self, file_path = None):
        # file_path 此处使用绝对路径
        if file_path:
            self.file_path = file_path
        else:
            self.file_path = "../case/yamls/test_login1.yaml"

    def get_files_path(self):
        file_list = []
        if os.path.isdir(self.file_path):
            for dirpath, dirnames, filenames in os.walk(self.file_path):
                for filename in filenames:
                    file_path = os.path.join(dirpath, filename)
                    file_list.append(file_path)
        else:
            file_list.append(self.file_path)
        return file_list

    def operate_case_file(self):
        app_case_list = []
        file_list = self.get_files_path()
        for i in file_list:
            file_suffix = os.path.splitext(i)[1]
            if file_suffix in ['.yaml', '.yml']:
                app_case_list.append(OperateYaml(i).read_yaml())
            elif file_suffix in ['.xlsx', '.xls']:
                app_case_list.append(OperateExcel(i).get_data_format())
        return app_case_list



# if __name__ == '__main__':
#     filepath = "../case/excels/test_login.xlsx"
#     #data = "{\"head\":{\"tran_cdde\":\"500015\",\"version_id\":\"1.0.1\",\"channel\":\"1\"},\"body\":{\"prdNo\":\"\"}}"
#     #data1 = json.loads(data)
#     dt = OperateFile(filepath)
#     rt = dt.operate_case_file()
#     print(rt)