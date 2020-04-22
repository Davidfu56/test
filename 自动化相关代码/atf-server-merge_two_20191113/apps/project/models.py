from django.db import models
from rbac.models import UserProfile


class TimeAbstract(models.Model):
    add_time = models.DateTimeField(auto_now_add=True, verbose_name="添加时间")
    modify_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        abstract = True

class Product(TimeAbstract):
    name = models.CharField(null=True, blank=True, max_length=30, verbose_name='产品名称')
    alias = models.CharField(null=True, blank=True, max_length=100, verbose_name='描叙')
    type = models.IntegerField(null=True, blank=True, max_length=1, verbose_name='产品类型')
    owner = models.ForeignKey("UserProfile", blank=True, null=True, on_delete=models.SET_NULL, verbose_name='所有者')

    class Meta:
        verbose_name = '产品配置'
        verbose_name_plural = verbose_name

class Project(TimeAbstract):
    name = models.CharField(null=True, blank=True, max_length=30, verbose_name='项目名称')
    alias = models.CharField(null=True, blank=True, max_length=100, verbose_name='描叙')
    type = models.IntegerField(null=True, blank=True, max_length=1, verbose_name='项目类型')
    product_id = models.ForeignKey("Product", blank=True, null=True, on_delete=models.SET_NULL, verbose_name='产品ID')
    user_id = models.ManyToManyField("UserProfile", blank=True, verbose_name='项目成员')
    owner = models.ForeignKey("UserProfile", blank=True, null=True, on_delete=models.SET_NULL, verbose_name='所有者')

    class Meta:
        verbose_name = '项目配置'
        verbose_name_plural = verbose_name

class ApiInfo(TimeAbstract):
    name = models.CharField(null=True, blank=True, max_length=30, verbose_name='接口名称')
    base_url = models.CharField(null=True, blank=True, max_length=100, verbose_name='base_url')
    api = models.CharField(null=True, blank=True, max_length=100, verbose_name='api')
    protocol = models.IntegerField(null=True, blank=True, max_length=1, verbose_name='接口协议类型')
    method = models.IntegerField(null=True, blank=True, max_length=1, verbose_name='接口方法')
    alias = models.CharField(null=True, blank=True, max_length=100, verbose_name='接口描叙')
    coder = models.ManyToManyField("UserProfile", blank=True, verbose_name='开发成员')
    owner = models.ForeignKey("UserProfile", blank=True, null=True, on_delete=models.SET_NULL, verbose_name='所有者')
    project_id = models.ForeignKey("Project", blank=True, null=True, on_delete=models.SET_NULL, verbose_name='归属项目ID')
    status = models.BooleanField(default=True, verbose_name="状态")

    class Meta:
        verbose_name = 'API配置'
        verbose_name_plural = verbose_name

class Headers(TimeAbstract):
    type = models.IntegerField(null=True, blank=True, max_length=1, verbose_name='归属类型')
    use_id = models.IntegerField(null=True, blank=True, max_length=20, verbose_name='归属Id')
    headers_key = models.CharField(null=True, blank=True, max_length=50, verbose_name='文件头名称')
    headers_value = models.CharField(null=True, blank=True, max_length=100, verbose_name='文件头数据值')

    class Meta:
        verbose_name = '报文头配置'
        verbose_name_plural = verbose_name

class RequestParam(TimeAbstract):
    type = models.IntegerField(null=True, blank=True, max_length=1, verbose_name='归属类型')
    use_id = models.IntegerField(null=True, blank=True, max_length=20, verbose_name='归属Id')
    param_key = models.CharField(null=True, blank=True, max_length=50, verbose_name='参数key')
    param_value = models.CharField(null=True, blank=True, max_length=100, verbose_name='参数value')
    param_description = models.CharField(null=True, blank=True, max_length=100, verbose_name='参数描叙内容')
    param_raw = models.CharField(null=True, blank=True, max_length=1000, verbose_name='参数体文本')

    class Meta:
        verbose_name = '报文参数'
        verbose_name_plural = verbose_name


class Variables(TimeAbstract):
    type = models.IntegerField(null=True, blank=True, max_length=1, verbose_name='归属类型')
    use_id = models.IntegerField(null=True, blank=True, max_length=100, verbose_name='归属Id')
    name = models.CharField(null=True, blank=True, max_length=50, verbose_name='参数名称')
    variables = models.CharField(null=True, blank=True, max_length=100, verbose_name='参数值')
    owner = models.ForeignKey("UserProfile", blank=True, null=True, on_delete=models.SET_NULL, verbose_name='所有者')

    class Meta:
        verbose_name = '参数化配置'
        verbose_name_plural = verbose_name

#validate:
#    {"check": check_item, "comparator": comparator_name, "expect": expect_value}
class Validate(TimeAbstract):
    type = models.IntegerField(null=True, blank=True, max_length=1, verbose_name='归属类型')
    use_id = models.IntegerField(null=True, blank=True, max_length=20, verbose_name='归属Id')
