#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-17 16:11
# @Author  : Weiss
# @File    : app_case.py
# @Software: PyCharm
from base.operate_element import OperateElement
from util.operate_file import OperateFile

from util.base_logging import logger as log

from base.screen_shots import ScreenShot


class AppCase:
    """

    """

    def __init__(self, file_path = None, **kwargs):
        self.file_path = file_path
        self.driver = kwargs["driver"]


    def run_case_line(self):
        oe = OperateElement(self.driver)
        case_list = OperateFile(self.file_path).operate_case_file()
        run_list = []
        for list in case_list:
            for line in list:
                flag = line["remarks"]["flag"]
                if flag == 'Y':
                    step = line["step"]
                    check = line["check"]
                    line['result'] = self.execute_case(oe, step, check)
                    run_list.append(line)
        return run_list

    def execute_case(self, oe, step, check):
        """
        执行测试
        :return:
        """
        # 执行步骤
        o_e_r = oe.operate_element(step)
        log.info('步骤执行结果|' + str(o_e_r))
        # 步骤执行完成后，执行检查点
        log.info('开始执行检查点|'+ str(check))
        check_result = self.execute_check(oe, check, o_e_r)
        # 用例失败截图
        if not check_result['check_result']:
            log.info('用例失败截图|' + str(check))
            s_r = ScreenShot(self.driver).operate_image_by_type('error')
            check_result['error_image'] = s_r[1]
        return check_result

    def execute_check(self, oe, check, step_result):
        """
        比对检查点
        :return:
        """
        #print('execute_check'+'......1')
        result = {}
        if step_result:
            c_r = oe.check_element(check)
            c_r_code = c_r[0]
            result['msg'] = c_r[1]
            if c_r_code == 'C0000':
                result['check_result'] = 'Pass'
            elif c_r_code == 'C0001':
                result['check_result'] = 'Pass'
            elif c_r_code == 'C0002':
                if result['msg'] == check['text']:
                    result['check_result'] = 'Pass'
                else:
                    result['check_result'] = 'Fail'
            elif c_r_code == 'C0006':
                result['check_result'] = 'Pass'
            else:
                result['check_result'] = 'Fail'
            return result
        else:
            log.warning('步骤执行失败,用例标记为失败，不再执行检查点操作')
            result['check_result'] = 'Fail'
            result['msg'] = 'step runing error'








