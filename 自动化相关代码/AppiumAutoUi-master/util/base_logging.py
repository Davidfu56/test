#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-09 10:45
# @Author  : Weiss
# @File    : base_logging.py
# @Software: PyCharm

import os

PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)

import logging

#创建一个logger
logger = logging.getLogger('Automation')
logger.setLevel(logging.DEBUG)  # Log等级总开关

#创建一个handler，用于写入日志文件
#logfile = PATH + "/output/ApiTest.log"
logfile = PATH("../report/ApiTest.log")
print(logfile)
fh = logging.FileHandler(logfile, mode='w', encoding='UTF-8')
fh.setLevel(logging.DEBUG)  # 输出到file的log   等级的开关

#再创建一个handler，用于输出到控制台
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)  # 输出到console的log等级的开关
#ch.setLevel(logging.WARNING)  # 输出到console的log等级的开关

#定义handler的输出格式
formatter = logging.Formatter("%(asctime)s - %(filename)s - %(levelname)s: %(message)s")
fh.setFormatter(formatter)
ch.setFormatter(formatter)

#将logger添加到handler里面
logger.addHandler(fh)
logger.addHandler(ch)