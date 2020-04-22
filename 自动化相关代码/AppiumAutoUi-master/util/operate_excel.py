#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-10 16:30
# @Author  : Weiss
# @File    : operate_excel.py
# @Software: PyCharm
import os

from util.operate_json import OperateJson

import xlrd as xlrd
import xlsxwriter as xlsxwriter

PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)


class OperateExcel:

    def __init__(self, filepath):
        self.filepath = filepath

    def write_excel(self, data, sheet=None):
        """
        处理KFT对账文件用
        :param data:
        :param sheet:
        :return:
        """
        workbook = xlsxwriter.Workbook(self.filepath)
        worksheet = workbook.add_worksheet(sheet)
        for i in range(len(data)):
            j = 0
            data_line = data[i]
            for key in data_line:
                if i == 0:
                    worksheet.write(i, j, key)
                    worksheet.write(i + 1, j, data_line[key])
                else:
                    worksheet.write(i + 1, j, data_line[key])
                j += 1
        workbook.close()

    def read_excel(self):
        """
        读取excel，返回sheets列表
        :return: 返回list
        """
        with xlrd.open_workbook(self.filepath) as stream:
            return stream.sheets()

    def get_data_format(self):
        """
        根据excl内容将数据构造成约定格式，感觉写复杂了，目前还没有想到好的解决方案，后续有思路在进行修改
        :return:
        """
        tables = self.read_excel()
        lines_list = []
        for i in tables:
            for j in range(2, i.nrows):
                line = {}
                line["testinfo"] = {}
                line["step"] = {}
                line["check"] = {}
                line["remarks"] = {}
                for c in range(i.ncols):
                    colum_name = i.cell(1, c).value
                    colum_value = i.cell(j, c).value.strip(' \t\n\r')
                    if c in range(3):
                        line["testinfo"][colum_name] = colum_value
                    elif c in range(3, 9):
                        line["step"][colum_name] = colum_value
                    elif c in range(9, 15):
                        line["check"][colum_name] = colum_value
                    else:
                        line["remarks"][colum_name] = colum_value
                lines_list.append(line)
        return lines_list


# if __name__ == '__main__':
#     dos = OperateExcel("../case/excels/test_login.xlsx")
#     dt = dos.get_data_format()
#     print(dt)
