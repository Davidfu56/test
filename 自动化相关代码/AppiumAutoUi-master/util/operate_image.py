#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-05-14 14:17
# @Author  : Weiss
# @File    : operate_image.py
# @Software: PyCharm
import base64
from io import BytesIO

import pytesseract
from PIL import Image

from util.baidu_ocr import client


class OperateImage:

    def __init__(self, base64_binary):
        self.base64_binary = base64_binary

    def get_image_coordinate(self):
        """
        对比图片获取目标图片中心坐标
        :return: (x,y)
        """
        return 0


    def get_image_coordinate_by_ocr(self):
        """
        使用腾讯或百度免费ocr服务获取目标坐标
        :return: (x,y)
        """

    def get_image_text(self, text):
        """
        目标图片中查找目标文字
        :param text: str
        :return: true or false
        """
        #imagesrc = Image.open(BytesIO(base64.b64decode(self.base64_str)))
        imagesrc = Image.open(BytesIO(self.base64_binary))
        image = imagesrc.convert("L")
        #image = self.base64_str.convert("L")
        threshold = 130
        table = []
        for i in range(256):
            if i < threshold:
                table.append(0)
            else:
                table.append(1)
        image = image.point(table, '1')
        #image.show()
        image_string = pytesseract.image_to_string(image,lang='chi_sim').replace('\n','').replace(' ','')
        #print(image_string)
        if text in image_string:
            return True, image_string
        return False, image_string

    def get_image_text_by_ocr(self, text):
        """
        使用腾讯或百度免费ocr服务获取目标文字
        :param text: str
        :return: true or false
        """
        """ 调用通用文字识别（高精度版） """
        image_ocr_json = client.basicAccurate(self.base64_binary)
        print(image_ocr_json)
        words_result = image_ocr_json['words_result']
        for words in words_result:
            value = words['words']
            if text in value:
                return True, value
        return False, words_result

    def get_image_text_coordinate_by_ocr(self, text):
        """
        使用腾讯或百度免费ocr服务获取目标文字并返回位置
        :param text: str
        :return: true or false
        """
        """ 调用通用文字识别（含位置高精度版） """
        image_ocr_json = client.accurate(self.base64_binary)
        print(image_ocr_json)
        words_result = image_ocr_json['words_result']
        for words in words_result:
            words = words['words']
            if text in words:
                location = words['location']
                location_center = (location['left'] + location['width']/2, location['top'] + location['height']/2)
                return True, location_center
        return False, words_result


    def get_image_Similarity(self):
        """
        对比图片获取相似度
        :return: p
        """
        return


    def get_image_Similarity_by_ocr(self):
        """
        使用腾讯或百度免费ocr服务对比图片获取相似度
        :return: p
        """
        return


if __name__ == '__main__':
    file = "/Users/charles/developer/PycharmProjects/AppiumAutoUi/screenShots/1.png"
    with open(file, 'rb') as fp:
        image = fp.read()
    image_ocr_json = client.basicAccurate(image)
    print(image_ocr_json)

    #16259965_1054780

    # request_id = '16259965_1055633'
    # table = client.getTableRecognitionResult(request_id)
    # print(table)