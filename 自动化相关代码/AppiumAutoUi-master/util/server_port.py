#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-04-11 11:14
# @Author  : Weiss
# @File    : server_port.py
# @Software: PyCharm
from util.shell_command import ShellCommand


class ServerPort:
    def port_is_used(self, port_num):
        """
        判断端口是否被占用
        :param port_num:
        :return:
        """
        command_str = "lsof -i :" + str(port_num)
        result = ShellCommand().call_shell(command_str)
        if result:
            flag = False
        else:
            flag = True
        return flag

    def create_port(self, stport, devices_list):
        """
        传入一个开始端口，根据设备数量生成对应端口
        :param stport:
        :param devices_list:
        :return:
        """
        server_port_list = []
        if devices_list:
            while len(server_port_list) != len(devices_list):
                if self.port_is_used(stport):
                    server_port_list.append(stport)
                stport = stport + 1
            return server_port_list
        else:
            return None


# if __name__ == '__main__':
#     dos = ServerPort()
#     devices_list = ["127.0.0.1:62001", "127.0.0.2:62001", "127.0.0.3:62001"]
#     print(dos.create_port(8888, devices_list))
