# coding=utf-8
import time

from appium import webdriver
from selenium.webdriver.support.ui import Select

from base.app_case import AppCase

capabilities = {
    "platformName": "Android",
#    "platformVersion": "7.1.1",
    "deviceName": "8TE645R8459HBEUW",
    "appPackage": "com.tencent.mm",
    "appActivity": "com.tencent.mm.ui.LauncherUI",
    "noReset": "true",
    "fullReset": "false",
    "fastReset": "false",
    "chromeOptions": {'androidProcess': 'com.tencent.mm:tools'}
}

driver = webdriver.Remote('http://localhost:4723/wd/hub', capabilities)
# driver.implicitly_wait(30)
# driver.find_element_by_xpath("//*[@text='我']").click()
# driver.implicitly_wait(30)
# driver.find_element_by_xpath("//*[@text='收藏']").click()
# driver.implicitly_wait(30)
# driver.find_element_by_xpath("//*[contains(@text, '深农商电脑网站支付')]").click()
# # 切换至H5页面
# driver.switch_to.context("WEBVIEW_com.tencent.mm:tools")
# driver.implicitly_wait(30)

# # 支付方式
# PAY_TYPE = driver.find_element_by_id("PAY_TYPE")
# Select(PAY_TYPE).select_by_index(0)
# # 米多类型
# MD_TYPE = driver.find_element_by_id("MD_TYPE")
# Select(MD_TYPE).select_by_index(1)
# # 平台客户ID
# THIRD_OPEN_ID = driver.find_element_by_id("THIRD_OPEN_ID")
# THIRD_OPEN_ID.clear()
# THIRD_OPEN_ID.send_keys("yl")
# # 手机号
# PHONE_NO = driver.find_element_by_id("PHONE_NO")
# PHONE_NO.clear()
# PHONE_NO.send_keys("13540782043")
# # 商户号
# MER_ID = driver.find_element_by_id("MER_ID")
# MER_ID.clear()
# MER_ID.send_keys("99091605310000")
# # 商户名称
# MER_NAME = driver.find_element_by_id("MER_NAME")
# MER_NAME.clear()
# MER_NAME.send_keys("魏双双")
# # 商户订单号
# ORDER_ID = driver.find_element_by_id("ORDER_ID")
# ORDER_ID.clear()
# ORDER_ID.send_keys("201908010001")
# # 总金额
# TRAN_AMT = driver.find_element_by_id("TRAN_AMT")
# TRAN_AMT.clear()
# TRAN_AMT.send_keys("20.00")
# # 收款人账号
# PAYEE_ACCT = driver.find_element_by_id("PAYEE_ACCT")
# PAYEE_ACCT.clear()
# PAYEE_ACCT.send_keys("11111111")
# # 收款人名称
# PAYEE_NAME = driver.find_element_by_id("PAYEE_NAME")
# PAYEE_NAME.clear()
# PAYEE_NAME.send_keys("11111111")
# # 收款账户属性
# ACCT_NATURE = driver.find_element_by_id("ACCT_NATURE")
# Select(ACCT_NATURE).select_by_index(0)
# # 收款方证件类型
# DOCUMENT_TYPE = driver.find_element_by_id("DOCUMENT_TYPE")
# DOCUMENT_TYPE.clear()
# DOCUMENT_TYPE.send_keys("0")
# # 收款方证件号码
# DOCUMENT_ID = driver.find_element_by_id("DOCUMENT_ID")
# DOCUMENT_ID.clear()
# DOCUMENT_ID.send_keys("411521200102027645")
# # 实时标志
# REALTIME_FLAG = driver.find_element_by_id("REALTIME_FLAG")
# Select(REALTIME_FLAG).select_by_index(0)
# # 商品描叙
# BODY = driver.find_element_by_id("BODY")
# BODY.clear()
# BODY.send_keys("UI")
# # 用户openid
# SUB_OPENID = driver.find_element_by_id("SUB_OPENID")
# SUB_OPENID.clear()
# SUB_OPENID.send_keys("o75j41N4djniOMZ18IeBbUDAAIKg")
# # 公众号APPID
# SUB_APPID = driver.find_element_by_id("SUB_APPID")
# SUB_APPID.clear()
# SUB_APPID.send_keys("UI")
# # 支付
# driver.find_element_by_xpath("//*[@id='payment_tab']/form/section[14]/div/button").click()
#
# # 去结算
# # handles = driver.window_handles
# # for i in handles:
# #     try:
# #         driver.switch_to.window(i)
# #         driver.find_element_by_xpath("//*[@id='vux_view_box_body']/div/div[2]/button")
# #         print('ok')
# #         break
# #     except Exception as e:
# #         print(e)
# time.sleep(4)
# driver.find_element_by_xpath("//*[@id='app']/div/div[1]/div/div[2]/button").click()
# driver.find_element_by_xpath("//*[@text='确认付款']").click()
# driver.quit()
#
filepath = '../case/excels/test_login.xlsx'
dc  = AppCase(filepath, driver = driver)
l = dc.run_case_line()
for i in l:
  print(i)
