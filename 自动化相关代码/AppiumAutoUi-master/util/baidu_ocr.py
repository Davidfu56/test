#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-05-15 17:40
# @Author  : Weiss
# @File    : baidu_ocr.py
# @Software: PyCharm

from aip import AipOcr

""" 你的 APPID AK SK """
APP_ID = '16259965'
API_KEY = '7DyOkgMHP7kfl8lyiH1ldFbm'
SECRET_KEY = 'mdGm3HNiS40MDmrBieFtbe0RdoZBAwfp'

client = AipOcr(APP_ID, API_KEY, SECRET_KEY)