#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-11-18 19:26
# @Author  : Weiss
# @File    : test_har.py
# @Software: PyCharm
import unittest
import loader
from core import HarParser
import sys


class Tes_Har(unittest.TestCase):


    def test_filepath_to_api_json(self):

        filepath = "/Users/charles/developer/at-frame/atf-server/frame/tests/har/doDispatcher.har"
        j = HarParser(filepath).gen_testcase_tojson("API")
        print(j)


    def test(self):

        filepath = "/Users/charles/developer/at-frame/atf-server/frame/tests/hj/"
        sys.path.append(filepath)

        j = loader.load_debugtalk_functions()

        print(j)