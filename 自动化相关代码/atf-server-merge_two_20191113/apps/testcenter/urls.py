#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-08-28 22:09
# @Author  : Weiss
# @File    : urls.py
# @Software: PyCharm

from django.urls import path,include
from testcenter.views import pageelement, testcase
from rest_framework import routers

router = routers.SimpleRouter()
router.register(r'pageelements', pageelement.PageElementViewSet, base_name="pageelement")
router.register(r'testcases/testcase', testcase.TestCaseViewSet, base_name="testcase")

urlpatterns = [
    path(r'api/', include(router.urls)),
]