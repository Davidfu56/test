#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-10 14:34
# @Author  : Weiss
# @File    : operate_json.py
# @Software: PyCharm
import json


class OperateJson:

    def __init__(self, filepath):
        self.filepath = filepath

    def operate_json_lins(self):
        """
        读取多行json文件
        :param filepath:
        :return: load_dict_lins []
        """
        load_dict_lins = []
        with open(self.filepath, mode='r') as lf:
            for line in lf.readlines():
                load_dict = json.loads(line)
                load_dict_lins.append(load_dict)
        return load_dict_lins

    def operate_json(self):
        """
        读取单一json内容文件
        :return: load_dict dit
        """
        with open(self.filepath, mode='r') as lf:
            load_dict = json.load(lf)
        return load_dict


if __name__ == '__main__':
    filepath = "/Users/charles/Desktop/KPPS2018081502135734_20190417.json"
    dos = OperateJson(filepath)
    dt = dos.operate_json_lins()
