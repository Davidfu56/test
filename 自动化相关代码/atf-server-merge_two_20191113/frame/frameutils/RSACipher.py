#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-11-19 10:24
# @Author  : Weiss
# @File    : RSACipher.py
# @Software: PyCharm

import base64

from Crypto.Cipher import PKCS1_OAEP
from Crypto.PublicKey import RSA


class RSACipher():
    """
    RSA加密、解密、签名、验签工具类
    """

    def encrypt(self, key, raw):
        """
        加密方法
        :param key: 公钥
        :param raw: 需要加密的明文 bytes
        :return: base64编码的密文 bytes
        """
        public_key = RSA.importKey(base64.b64decode(key))
        cipher = PKCS1_OAEP.new(public_key)
        return str(base64.b64encode(cipher.encrypt(bytes(raw, encoding='utf-8'))),encoding = "utf-8")

    def decrypt(self, key, enc):
        """
        解密方法
        :param key: 私钥
        :param enc: base64编码的密文 bytes
        :return: 解密后的明文 bytes
        """
        private_key = RSA.importKey(base64.b64decode(key))
        cipher = PKCS1_OAEP.new(private_key)
        return cipher.decrypt(base64.b64decode(enc))
