#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-18 03:37
# @Author  : Weiss
# @File    : phone_info.py
# @Software: PyCharm
from util.shell_command import ShellCommand

class PhoneInfo:
    def __init__(self, devices):
        self.devices = devices

    def get_phone_info(self):
        """
        获取手机信息，手机型号、品牌、设备名称、系统版本
        :return:
        """
        command = "-s " + self.devices + " shell cat /system/build.prop "
        phone_info = ShellCommand().call_adb(command)
        phone_info_list = {}
        release = "ro.build.version.release="  # 版本
        model = "ro.product.model="  # 型号
        brand = "ro.product.brand="  # 品牌
        device = "ro.product.device="  # 设备名
        for line in phone_info:
            for i in line.split():
                if i.find(release) >= 0:
                    phone_info_list["release"] = i[len(release):]
                    break
                if i.find(model) >= 0:
                    phone_info_list["model"] = i[len(model):]
                    break
                if i.find(brand) >= 0:
                    phone_info_list["brand"] = i[len(brand):]
                    break
                if i.find(device) >= 0:
                    phone_info_list["device"] = i[len(device):]
                    break
        return phone_info_list

    def get_phone_name(self):
        """
        组装拼接设备名称标识
        :return:
        """
        phone_info_list = self.get_phone_info()
        phone_name = phone_info_list["brand"] + "_" + phone_info_list["model"] + "_" + "android" + "_" + phone_info_list["release"] + "_" + phone_info_list["device"]
        return phone_name

    def get_phone_resolution(self):
        """
        获取屏幕分辨率
        :return:
        """
        command = "-s " + self.devices + " shell wm size"
        phone_resolution = ShellCommand().call_adb(command)[0].split()[2]
        return phone_resolution


# if __name__ == '__main__':
#     dos = PhoneInfo("emulator-5554")
#     devices = dos.get_phone_info()
#     print(devices)