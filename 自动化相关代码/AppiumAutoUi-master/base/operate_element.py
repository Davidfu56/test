#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-22 15:58
# @Author  : Weiss
# @File    : operate_element.py
# @Software: PyCharm

from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support.ui import Select
from base.screen_shots import ScreenShot
from util.base_logging import logger as log


class OperateElement:

    def __init__(self, driver):
        self.driver = driver
        # self.ss = ScreenShot(self.driver)
        # self.ele_info = ele_info

    # def get_element(self, ele_info):
    #     """
    #     封装查找元素方法,
    #     :return:
    #     """
    #     pass

    def has_element(self, ele_info):
        """
        返回元素是否存在
        :return:
        """
        try:
            WebDriverWait(self.driver, 30, 0.5).until(lambda x: elements_by(ele_info, self.driver))
            log.info('查找元素|' + str(ele_info) + '|成功')
            return True
        except Exception as e:
            log.warning('查找元素|' + str(ele_info) + '|失败|')
            log.warning(e)
            return False

    def operate_element(self, ele_info):
        """
        执行元素操作
        click
        swipe
        send_keys
        :return:
        """
        if ele_info['operate_type'] == "switch_webview":
                try:
                    switch_webview(ele_info, self.driver)
                    log.info('切换webview|' + str(ele_info) + '|成功')
                    return True
                except Exception as e:
                    log.warning('切换webview|' + str(ele_info) + '|异常')
                    log.warning(e)
                    return False
        else:
            if self.has_element(ele_info):
                o_e = {
                    'click': lambda: element_click(ele_info, self.driver),
                    'select': lambda: element_select(ele_info, self.driver),
                    'swipe': lambda: element_swipe(ele_info, self.driver),
                    'send_keys': lambda: element_send_keys(ele_info, self.driver),
                    # 'switch_webview': lambda: switch_webview(ele_info, self.driver)
                }
                try:
                    log.info('操作元素|' + str(ele_info) + '|开始')
                    o_e[ele_info['operate_type']]()
                    return True
                except Exception as e:
                    log.warning('操作元素|' + str(ele_info) + '|异常')
                    log.warning(e)
                    return False
            log.warning('操作元素|' + str(ele_info) + '|失败,元素未找到!')
            return False

    def check_element(self, ele_info):
        """
        检查点操作
        :param ele_info:
        :return:
        """
        if ele_info['check_type']:
            if ele_info['check_type'] == 'toast':
                log.info('检查点类型:toast|' + str(ele_info))
                toast_info = get_toast(ele_info, self.driver)
                if toast_info[0]:
                    log.info('检查点类型:toast,获取成功,返回码:C0006')
                    return 'C0006', 'toast text has find'
                else:
                    log.info('检查点类型:toast,获取失败,返回码:C0007')
                    return 'C0007', toast_info[1]
            else:
                if self.has_element(ele_info):
                    # default只查找检查点是否存在
                    if ele_info['check_type'] == 'default':
                        return 'C0001', 'check element has find'
                    elif ele_info['check_type'] == 'text' or ele_info['check_type'] == 'content-desc':
                        try:
                            return 'C0002', element_getattribute(ele_info, self.driver)
                        except Exception as e:
                            return 'C0003', e
                    else:
                        return 'C0004', 'check_type input error'
                return 'C0005', 'check element not find'
        else:
            return 'C0000', 'check element set null'


def elements_by(ele_info, d):
    """
    封装常用的find_elements方法
    :return:
    """
    elements_object = {
        'id': lambda: d.find_element_by_id(ele_info["element_info"]),
        'xpath': lambda: d.find_element_by_xpath(ele_info["element_info"]),

        'ids': lambda: d.find_elements_by_xpath(ele_info["element_info"]),
        'xpaths': lambda: d.find_elements_by_xpath(ele_info["element_info"]),
        # 最新方法，按照图片查找元素
        'image': lambda: d.find_element_by_image(ele_info["element_info"]),
        'images': lambda: d.find_elements_by_image(ele_info["element_info"])
    }
    return elements_object[ele_info['find_type']]()


def element_click(ele_info, d):
    """
    操作点击
    :return:
    """
    log.info('开始点击元素|' + str(ele_info))
    if ele_info['find_type'] == 'ids' or ele_info['find_type'] == 'xpaths' or ele_info['find_type'] == 'images':
        elements_by(ele_info, d)[ele_info['index']].click()
    else:
        elements_by(ele_info, d).click()


def element_select(ele_info, d):
    """
    下拉列表选择元素
    :return:
    """
    log.info('开始选择元素|' + str(ele_info))
    if ele_info['find_type'] == 'ids' or ele_info['find_type'] == 'xpaths' or ele_info['find_type'] == 'images':
        Select(elements_by(ele_info, d)[ele_info['index']]).select_by_index(ele_info['index1'])
    else:
        Select(elements_by(ele_info, d)).select_by_index(ele_info['index'])


def element_swipe(ele_info, d):
    """
    操作滑动,目前有bug，不可用
    :return:
    """
    log.info('开始操作滑动|' + str(ele_info))
    width = d.get_window_size()["width"]
    height = d.get_window_size()["height"]
    for i in range(ele_info["times"]):
        d.swipe(width / 4 * 3, height / 2, width / 4 * 1, height / 2, 500)


def element_send_keys(ele_info, d):
    """
    填充内容
    :return:
    """
    log.info('开始输入内容|' + str(ele_info))
    if ele_info['find_type'] == 'ids' or ele_info['find_type'] == 'xpaths' or ele_info['find_type'] == 'images':
        elements_by(ele_info, d)[ele_info['index']].clear()
        elements_by(ele_info, d)[ele_info['index']].send_keys()
    else:
        elements_by(ele_info, d).clear()
        elements_by(ele_info, d).send_keys(ele_info['text'])


def element_getattribute(ele_info, d):
    """
    获得属性值内容
    :return:
    """
    log.info('开始获取元素属性值|' + str(ele_info))
    if ele_info['find_type'] == 'ids' or ele_info['find_type'] == 'xpaths' or ele_info['find_type'] == 'images':
        return elements_by(ele_info, d)[ele_info['index']].getAttribute(ele_info['check_type'])
    else:
        return elements_by(ele_info, d).get_attribute(ele_info['check_type'])


def get_toast(ele_info, d):
    """
    查找toast元素，使用图片识别技术
    :param ele_info:
    :param d:
    :return:
    """
    log.info('开始查找toast元素|' + str(ele_info))
    if ele_info["element_info"]:
        return ScreenShot(d).operate_image_by_type('toast', '', '', ele_info["element_info"])
    else:
        log.warning('查找toast元素|' + str(ele_info) + '|失败')
        log.warning('element_info is null')
        return False, "element_info is null"

def switch_webview(ele_info, d):
    """
    切换webview
    :param ele_info:
    :param d:
    :return:
    """
    log.info('开始切换webview|' + str(ele_info))
    d.switch_to.context(ele_info["element_info"])