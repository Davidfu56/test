import os
import time

from util.operate_image import OperateImage

from util.base_logging import logger as log

class ScreenShot:
    def __init__(self, driver):
        self.driver = driver
        # #操作类型
        # self.type = type
        # #文件名称
        # self.name = name

    # def get_screenshot_file_path(self, type, name):
    #     """
    #     生成截图文件路径
    #     :return:
    #     """
    #     day = time.strftime("%Y-%m-%d", time.localtime(time.time()))
    #     fq = "../screenShots/" + day + "/" + type
    #     tm = time.strftime("%Y-%m-%d_%H_%M_%S", time.localtime(time.time()))
    #     file_type = '.png'
    #     if os.path.exists(fq):
    #         file_path = fq + "/" + tm + "_" + name + file_type
    #     else:
    #         os.makedirs(fq)
    #         file_path = fq + "/" + tm + "_" + name + file_type
    #     return file_path

    def get_image_by_type(self, type, name=None):
        """
        根据type对图片做不同操作
        :param type:
            save:保存
            base64:返回base64编码
        :param name:
        :return:返回文件路径/图片base64
        """
        if type == 'save':
            # 生成截图文件路径
            day = time.strftime("%Y-%m-%d", time.localtime(time.time()))
            fq = "../screenShots/" + day + "/" + type
            tm = time.strftime("%Y-%m-%d_%H_%M_%S", time.localtime(time.time()))
            file_type = '.png'
            if os.path.exists(fq):
                file_path = fq + "/" + tm + "_" + name + file_type
            else:
                os.makedirs(fq)
                file_path = fq + "/" + tm + "_" + name + file_type
            # 获取截图文件并保存
            try:
                self.driver.save_screenshot(file_path)
                log.info('操作截图，文件路径:' + file_path)
                return True, file_path
            except Exception as e:
                log.warning('操作截图异常')
                log.warning(e)
                return False, e
        else:
            # 获取图片二进制
            try:
                image_base64 = self.driver.get_screenshot_as_png()
                return True, image_base64
            except Exception as e:
                return False, e

    def operate_image_by_type(self, type, name=None, imagesrc2=None, text=None):
        """
        :param type:
            error:失败截图
            toast:查找toast截图
            image_locate:查找目标图片定位获取坐标，用例处理密码键盘
        :param name:
        :param imagesrc2:
        :param text:
        :return:
        """
        if type == 'error':
            return self.get_image_by_type('save', name)
        else:
            for i in range(5):
                image_base64 = self.get_image_by_type('base64')
                if image_base64[0]:
                    oi = OperateImage(image_base64[1])
                    i_t = oi.get_image_text(text)
                    #i_t = oi.get_image_text_by_ocr(text)
                    if i_t[0]:
                        log.info('查找toast元素|' + text + '|成功')
                        return i_t
                    time.sleep(0.2)
            log.warning('查找toast元素|' + text + '|失败')
            log.warning('toast text is not find')
            return False, 'toast text is not find'



