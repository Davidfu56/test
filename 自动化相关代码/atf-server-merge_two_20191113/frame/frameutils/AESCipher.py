#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-11-19 10:25
# @Author  : Weiss
# @File    : AESCipher.py
# @Software: PyCharm

import base64

from Crypto.Cipher import AES


class AESCipher():
    """
    AES加密、解密、签名、验签工具类
    """

    def pkcs7padding(self, b):
        """
        明文使用PKCS7填充
        最终调用AES加密方法时，传入的是一个byte数组，要求是16的整数倍，因此需要对明文进行处理
        :param text: 待加密内容(明文)
        :return:
        """
        bs = AES.block_size  # 16
        # print(bs)
        # length = len(text)
        # bytes_length = len(bytes(text, encoding='utf-8'))
        # # tips：utf-8编码时，英文占1个byte，而中文占3个byte
        # padding_size = length if (bytes_length == length) else bytes_length
        # padding = bs - padding_size % bs
        # # tips：chr(padding)看与其它语言的约定，有的会使用'\0'
        # padding_text = chr(padding) * padding
        # return text + padding_text
        bytes_num_to_pad = bs - (len(b) % bs)
        byte_to_pad = bytes([bytes_num_to_pad])
        padding = byte_to_pad * bytes_num_to_pad
        padded = b + padding
        return padded


    def pkcs7unpadding(self, text):
        """
        处理使用PKCS7填充过的数据
        :param text: 解密后的字符串
        :return:
        """
        length = len(text)
        unpadding = ord(text[length - 1])
        return text[0:length - unpadding]

    def encrypt(self, key, content):
        """
        AES加密
        key,iv使用同一个
        模式cbc
        填充pkcs7
        :param key: 密钥
        :param content: 加密内容
        :return:
        """
        key_bytes = bytes(key, encoding='utf-8')
        content_bytes = bytes(content, encoding='utf-8')
        # content_bytes = bytes(content, encoding='utf-8')
        cipher = AES.new(key_bytes, AES.MODE_ECB)
        # 处理明文
        content_padding = self.pkcs7padding(content_bytes)
        # 加密
        # encrypt_bytes = cipher.encrypt(bytes(content_padding, encoding='utf-8'))
        encrypt_bytes = cipher.encrypt(content_padding)
        # 重新编码
        result = str(base64.b64encode(encrypt_bytes), encoding='utf-8')
        return result

    def decrypt(self, key, content):
        """
        AES解密
         key,iv使用同一个
        模式cbc
        去填充pkcs7
        :param key:
        :param content:
        :return:
        """
        key_bytes = bytes(key, encoding='utf-8')
        iv = key_bytes
        cipher = AES.new(key_bytes, AES.MODE_CBC, iv)
        # base64解码
        encrypt_bytes = base64.b64decode(content)
        # 解密
        decrypt_bytes = cipher.decrypt(encrypt_bytes)
        # 重新编码
        result = str(decrypt_bytes, encoding='utf-8')
        # 去除填充内容
        result = self.pkcs7unpadding(result)
        return result
