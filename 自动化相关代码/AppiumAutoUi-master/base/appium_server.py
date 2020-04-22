#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-11 15:11
# @Author  : Weiss
# @File    : appium_server.py
# @Software: PyCharm
import threading
import time

from util.shell_command import ShellCommand
from util.server_port import ServerPort


class AppiumServer:

    def __init__(self):
        self.shell = ShellCommand()
        self.device_list = self.get_devices()
        # self.port_list = self.get_ports()

    def get_devices(self):
        """
        获取设备列表
        :return:
        """
        devices_list = self.shell.get_devices()
        return devices_list

    def get_ports(self, stport):
        """
        获取端口列表
        :param stport:
        :return:
        """
        port_list = ServerPort().create_port(stport, self.device_list)
        return port_list

    def create_command_list(self, i):
        """
        构造appium命令
        appium -p 4723 -bp 4726 -U 127.0.0.1:62001 --no-reset --session-override --log E:/Teacher/Imooc/AppiumPython/log/test01.log
        :return:
        """
        # command_list = []
        appium_port_list = self.get_ports(4700)
        bootstrap_port_list = self.get_ports(4900)
        command = "appium -p " + str(appium_port_list[i]) + " -bp " + str(bootstrap_port_list[i]) + " -U " + \
                  self.device_list[i] + " --no-reset --session-override --log appium.log"
        # command_list.append(command)
        return command

    def start_server(self, i):
        """
        启动服务
        :return:
        """
        start_list = self.create_command_list(i)
        self.shell.call_shell(start_list)

    def server_threading(self):
        thread_list = []
        for i in range(len(self.device_list)):
            t = threading.Thread(target=self.start_server, args=(i,))
            thread_list.append(t)
        for t in thread_list:
            t.start()
        # time.sleep(25)


if __name__ == '__main__':
    dos = AppiumServer()
    dos.start_server(0)
