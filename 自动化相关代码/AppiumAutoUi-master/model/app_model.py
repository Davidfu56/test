# #!/usr/bin/env python
# # -*- coding: utf-8 -*-
# # @Time    : 2019-04-17 22:55
# # @Author  : Weiss
# # @File    : app_model.py
# # @Software: PyCharm
# from schematics.models import Model
# from schematics.types import StringType, IntType
#
#
# class GetAppCase(Model):
#     element_info = StringType(required=True) # 元素定位信息
#     find_type = StringType(required=True)    # 元素查找方式
#     operate_type = StringType(required=True) # 元素操作类型
#     text = StringType()         # 输入的内容,配合文本框使用
#     time = IntType()            # 配合与滑动操作
#     index = IntType()           # 使用elements查找元素时，索引
#     info= StringType(required=True)          # 元素信息描叙
#
# class GetAppCaseInfo(Model):
#     test_id = StringType(required=True)          # 用例的id
#     test_module = StringType(required=True)      # 用例所属模块
#     test_title = StringType(required=True)       # 用例的介绍
#
#     test_result =StringType(required=True)       # 用例的结果
#     test_result_info = StringType() # 用例失败的原因
#     # test_men_max = StringType()     # 内存最大使用情况
#     # test_men_avg = StringType()     # 内存平均使用情况
#     # test_cpu_max = StringType()     # cpu最大使用峰值
#     # test_cpu_avg = StringType()     # cpu 平均使用值
#     # test_fps_max = StringType()     # fps最大峰值
#     # test_fps_avg = StringType()     # fps平均值
#     # test_devices = StringType()
#     test_phone_name = StringType(required=True)  #设备_手机_型号
#     test_phone_resolution = StringType(required=True)    # 手机屏幕分辨率
#     test_screenshot = StringType() # 屏幕截图
#     test_log = StringType() #闪退的日志
#
# class GetAppCheckInfo(Model):
#     check_element_info = StringType(required=True)   # 元素定位信息
#     check_find_type = StringType(required=True)      # 元素查找方式
#     check_check = StringType(required=True)          # 元素检查方式
#     check_info= StringType(required=True)            # 检查点信息描叙
#
# class GetAppCaseFlag(Model):
#     case_flag = StringType(required=True)  # 用例是否可用
#
#
#
# if __name__ == '__main__':
#     bc = GetAppCheckInfo()
#     bc.check_element_info = 1
#     print(bc)