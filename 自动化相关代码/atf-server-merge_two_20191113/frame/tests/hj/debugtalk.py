# 导入RSA和AES包，加密依赖包，日志包
import datetime
import hashlib
import json
import random
import re
from httprunner import logger
from frame.frameutils.RSACipher import RSACipher
from frame.frameutils.AESCipher import AESCipher
import requests


def setup_hook_encrypt(request, rPublicKey, privateKey, publicKey, appAccessToken=None):
    """
    报文加密，并替换原有报文data
    :param request:
    :return:
    """
    encrypt_data = {
        "version": "1.1.9",
        "appID": "f2d72258-2e11-476f-abf2-1480c2fe2b6b",
        "SDKType": "mobile",
        "reqTime": time_millisecond(),
        "mac": "0.0.0.0",
        "signType": "MD5",
        "appAccessToken": appAccessToken or "",
        "data": request["data"] or {},
        "genId": rPublicKey,
        "randomKey": get_randomstr(16),
        "publicKey": publicKey,
        "privateKey": privateKey
    }
    url = "http://localhost:8080/lite/encrypt"
    rsp = request_send(url, encrypt_data)
    d = json.dumps(rsp.json()['data'])
    info_msg = u"报文加密完成，加密后报文内容: {}".format(d)
    logger.log_info(info_msg)
    request["data"] = d


def teardown_hook_decrypt(response, privateKey):
    """
    报文解密，并为response新增属性decrypt_data
    :param request:
    :return:
    """
    data = json.loads(response.text)
    if "data" in data:
        data['privateKey'] = privateKey
        url = "http://localhost:8080/lite/decrypt"
        rsp = request_send(url, data)
        d = rsp.json()['data']
        info_msg = u"报文解密完成，解密后报文内容: {}".format(d)
        logger.log_info(info_msg)
        response.decrypt_data = d
    else:
        response.decrypt_data = {}


# def setup_hook_encrypt(request, rPublicKey, privateKey, publicKey, appAccessToken=None):
#     """
#     报文加密，并替换原有报文data
#     :param request:
#     :return:
#     """
#     request_data = json.dumps(request["data"], separators=(',', ':'))
#     print(request_data)
#     encrypt_data = {
#         "version": "1.1.9",
#         "appID": "f2d72258-2e11-476f-abf2-1480c2fe2b6b",
#         "SDKType": "mobile",
#         "reqTime": time_millisecond(),
#         "mac": "0.0.0.0",
#         "signType": "MD5",
#         "appAccessToken": appAccessToken or "",
#         "data": {},
#         "genId": rPublicKey,
#         "randomKey": get_randomstr(16)
#     }
#
#     # 业务数据AES加密
#     print('request_data加密开始：' + request_data)
#     encrypt_data['data'] = AESCipher().encrypt(encrypt_data['randomKey'], request_data)
#     # 使用前面报文获取的公钥加密randomkey
#     encrypt_data['randomKey'] = RSACipher().encrypt(publicKey, encrypt_data['randomKey'])
#
#     # 排序并加密获取sign值
#     new_text = sorted(encrypt_data)
#     str_data = ''
#     for i in range(len(new_text)):
#         key = new_text[i]
#         value = encrypt_data[key]
#         if value is not None:
#             if i == (len(new_text) - 1):
#                 str_data = str_data + key + '=' + str(value)
#             else:
#                 str_data = str_data + key + '=' + str(value) + '&'
#     m = hashlib.md5(str_data.encode())
#     encrypt_data['sign'] = m.hexdigest()
#     data_str = json.dumps(encrypt_data, separators=(',', ':'))
#     request["data"] = data_str


def request_send(url, data):
    client = requests.Session()
    method = "POST"
    resp = client.request(method, url, json=data)
    return resp


def teardown_hooks_decrypt(response):
    pass


def get_param(key):
    return param[key]


# 生成订单号
def get_orderId():
    tm = time_generate('%Y%m%d%H%M%S')
    seeds = 'abcdefghijklmnopqrstuvwxyz0123456789'
    return tm + ''.join(random.choice(seeds) for i in range(7))


# def add_requestKey(response):
#     url = response.url
#     requestKey = re.search('requestKey=(.*)', url).group(1)
#     param['requestKey'] = requestKey

def alter_requestKey(response):
    url = response.url
    requestKey = re.search('requestKey=(.*)', url).group(1)
    response.text = requestKey


########################################################################################################################
"""
    这是一个分割线
    分割线下边是基础方法内容，一般情况请勿修改
    添加自己的方法，请在分割线上自行添加
    import导入的包请勿修改删除
"""
# 定义参数存储字典
param = {}


# 从parm字典中取出数据
def get_param(key):
    if key in param:
        info_msg = u"The value for the key in param,it will update: {}".format(param[key])
        logger.log_info(info_msg)
        return param[key]
    else:
        err_msg = u"The key is not in param: {}".format(key)
        logger.log_error(err_msg)


# 生成当前时间
def time_generate(format):
    tm = datetime.datetime.now().strftime(format)
    return tm


# 生成当前时间，精确到毫秒
def time_millisecond():
    now = datetime.datetime.now()
    return str(now)[:-3].replace('.', ' ')


# 生成随机数字符串
def get_randomnumber(b):
    return ''.join(random.choice('0123456789') for i in range(b)) * 1


# 生成随机字符串
def get_randomstr(b):
    seeds = '0123456789abcdefghijklmnopqrstuvwxyz'
    return ''.join(random.choice(seeds) for i in range(b))


# 生成手机号
def phone_generate():
    prelist = ['130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '147', '150', '151', '152', '153',
               '155', '156', '157', '158', '159', '186', '187', '188']
    return random.choice(prelist) + ''.join(random.choice('0123456789') for i in range(8))


# 生成中文名字
def chinese_name(num):
    xing_names = ['赵', '钱', '孙', '李', '周', '吴', '郑', '王', '冯', '陈', '褚', '卫', '蒋', '沈', '韩', '杨', '朱', '秦', '尤', '许',
                  '何', '吕', '施', '张', '孔', '曹', '严', '华', '金', '魏', '陶', '姜', '戚', '谢', '邹', '喻', '柏', '水', '窦', '章',
                  '云', '苏', '潘', '葛', '奚', '范', '彭', '郎', '鲁', '韦', '昌', '马', '苗', '凤', '花', '方', '俞', '任', '袁', '柳',
                  '酆', '鲍', '史', '唐', '费', '廉', '岑', '薛', '雷', '贺', '倪', '汤', '滕', '殷', '罗', '毕', '郝', '邬', '安', '常',
                  '乐', '于', '时', '傅', '皮', '卞', '齐', '康', '伍', '余', '元', '卜', '顾', '孟', '平', '黄', '和', '穆', '萧', '尹',
                  '姚', '邵', '堪', '汪', '祁', '毛', '禹', '狄', '米', '贝', '明', '臧', '计', '伏', '成', '戴', '谈', '宋', '茅', '庞',
                  '熊', '纪', '舒', '屈', '项', '祝', '董', '梁']

    ming_names = ['的', '一', '是', '了', '我', '不', '人', '在', '他', '有', '这', '个', '上', '们', '来', '到', '时', '大', '地', '为',
                  '子', '中', '你', '说', '生', '国', '年', '着', '就', '那', '和', '要', '她', '出', '也', '得', '里', '后', '自', '以',
                  '会', '家', '可', '下', '而', '过', '天', '去', '能', '对', '小', '多', '然', '于', '心', '学', '么', '之', '都', '好',
                  '看', '起', '发', '当', '没', '成', '只', '如', '事', '把', '还', '用', '第', '样', '道', '想', '作', '种', '开', '美',
                  '总', '从', '无', '情', '己', '面', '最', '女', '但', '现', '前', '些', '所', '同', '日', '手', '又', '行', '意', '动',
                  '方', '期', '它', '头', '经', '长', '儿', '回', '位', '分', '爱', '老', '因', '很', '给', '名', '法', '间', '斯', '知',
                  '世', '什', '两', '次', '使', '身', '者', '被', '高', '已', '亲', '其', '进', '此', '话', '常', '与', '活', '正', '感',
                  '见', '明', '问', '力', '理', '尔', '点', '文', '几', '定', '本', '公', '特', '做', '外', '孩', '相', '西', '果', '走',
                  '将', '月', '十', '实', '向', '声', '车', '全', '信', '重', '三', '机', '工', '物', '气', '每', '并', '别', '真', '打',
                  '太', '新', '比', '才', '便', '夫', '再', '书', '部', '水', '像', '眼', '等', '体', '却', '加', '电', '主', '界', '门',
                  '利', '海', '受', '听', '表', '德', '少', '克', '代', '员', '许', '稜', '先', '口', '由', '死', '安', '写', '性', '马',
                  '光', '白', '或', '住', '难', '望', '教', '命', '花', '结', '乐', '色', '更', '拉', '东', '神', '记', '处', '让', '母',
                  '父', '应', '直', '字', '场', '平', '报', '友', '关', '放', '至', '张', '认', '接', '告', '入', '笑', '内', '英', '军',
                  '候', '民', '岁', '往', '何', '度', '山', '觉', '路', '带', '万', '男', '边', '风', '解', '叫', '任', '金', '快', '原']

    # 根据传入参数生成名字
    i = 1
    fn = ''
    while i < num:
        i = i + 1
        strf = random.choice(ming_names)
        fn = fn + strf
    chinesename = random.choice(xing_names) + fn
    return chinesename

# # 生成身份证
# def identity_card(areacode=None):
#     discode_path = '../TestCase/Config/DistrictCode.xls'
#     sheetdata = stream.sheet_by_index(0)
#     discode = {}
#     for r in range(1, sheetdata.nrows):
#         key = sheetdata.cell(r, 0).value
#         value = ''
#         for c in range(1, sheetdata.ncols):
#             cell_data = sheetdata.cell(r, c).value
#             value = value + cell_data
#         discode[key] = value
#     if areacode in discode:
#         iid = areacode  # 地区码
#     else:
#         iid = discode.popitem()[0]  # popitem删除并返回一个key-value格式的元组，地区码
#
#     iid = iid + str(random.randint(1930, 2013))  # 年份项
#     dt = date.today() + timedelta(days=random.randint(1, 366))  # 月份和日期项
#     iid = iid + dt.strftime('%m%d')
#     iid = iid + str(random.randint(100, 300))  # 顺序号
#
#     count = 0
#     weight = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]  # 权重项
#     checkcode = {'0': '1', '1': '0', '2': 'X', '3': '9', '4': '8', '5': '7', '6': '6', '7': '5', '8': '5', '9': '3',
#                  '10': '2'}  # 校验码映射
#     for i in range(0, len(iid)):
#         count = count + int(iid[i]) * weight[i]
#     iid = iid + checkcode[str(count % 11)]  # 算出校验码
#     return iid

# 生成地址


# if __name__ == '__main__':
#     # print(type(get_randomKey()))
#     # print(get_randomKey().decode())
#     # print(get_randomKey())
#
#     print(get_randomstr(16))
