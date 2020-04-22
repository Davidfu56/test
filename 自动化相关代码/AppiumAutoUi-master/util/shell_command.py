#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-08 11:58
# @Author  : Weiss
# @File    : shell_command.py
# @Software: PyCharm
import subprocess


class ShellCommand:

    def call_shell(self, command):
        p = subprocess.Popen(command, shell=True, stdout=None, universal_newlines=True)
        p.wait()


    def call_adb(self, command):
        """
        通用类adb命令调用
        :param command:
        :return: result_lines[]
        """
        command_text = 'adb %s' % command
        p = subprocess.Popen(command_text, shell=True, stdout=subprocess.PIPE, universal_newlines=True)
        p.wait()
        result_lines = p.stdout.readlines()
        return result_lines

    def get_devices(self):
        """
        获取连接的设备列表
        :return: devices_list[]
        """
        result_lines = self.call_adb("devices")
        devices_list = []
        for line in result_lines:
            t = line.split("\tdevice")
            #print(t)
            if len(t) >= 2:
                devices_list.append(t[0])
        return devices_list

    def get_state(self):
        """
        获取当前设备状态
        :return: result[]/None
        """
        result = self.call_adb("get-state")
        result = result.strip(' \t\n\r')
        return result or None

    def reboot(self, option):
        """
        操作设备重启
        :param option:
        :return:
        """
        command = "reboot"
        if len(option) > 7 and option in ("bootloader", "recovery",):
            command = "%s %s" % (command, option.strip())
        self.call_adb(command)


if __name__ == '__main__':
    dos = ShellCommand()
    devices = dos.get_devices()
    #cmd = "-s " + devices + " shell cat /system/build.prop "
    print(devices)
