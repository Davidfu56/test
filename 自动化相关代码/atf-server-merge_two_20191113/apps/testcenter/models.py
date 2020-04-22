# Create your models here.

from django.db import models

from project.models import Project
from rbac.models import UserProfile


class TimeAbstract(models.Model):
    add_time = models.DateTimeField(auto_now_add=True, verbose_name="添加时间")
    modify_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        abstract = True

class PageElement(TimeAbstract):
    element_name = models.CharField(max_length=100, verbose_name='元素名称')
    element_alias = models.CharField(default='',max_length=100, verbose_name='描叙')
    page_name = models.CharField(default='',max_length=100, verbose_name='页面名称')
    element_by = models.CharField(default='',max_length=10, verbose_name='查找方式')
    element_locate = models.CharField(default='',max_length=300, verbose_name='定位内容')
    element_index = models.IntegerField(blank=True, null=True, verbose_name='元素下标')
    project = models.ForeignKey(Project, blank=True, null=True, on_delete=models.SET_NULL, verbose_name='关联项目')

    class Meta:
        unique_together = ('project', 'element_name')
        verbose_name = '页面元素'
        verbose_name_plural = verbose_name

class TestCase(TimeAbstract):
    project = models.ForeignKey(Project, blank=True, null=True, on_delete=models.SET_NULL, verbose_name='所属项目')
    case_model = models.CharField(max_length=50, verbose_name='模块')
    case_title = models.CharField(max_length=100, verbose_name='测试标题')
    case_type = models.CharField(max_length=50, verbose_name='用例类型')
    case_setUp = models.CharField(max_length=10, blank=True, null=True, verbose_name='前置条件')
    case_tearDown = models.CharField(max_length=10, blank=True, null=True, verbose_name='后置条件')
    flag = models.BooleanField(default=False, verbose_name="状态")
    owner = models.ForeignKey(UserProfile, blank=True, null=True, on_delete=models.SET_NULL, verbose_name='所有者')

    class Meta:
        verbose_name = '测试用例'
        verbose_name_plural = verbose_name

class UiStep(TimeAbstract):
    case = models.ForeignKey(TestCase, on_delete=models.CASCADE, verbose_name='关联用例')
    step_name =  models.CharField(max_length=50, verbose_name='步骤名称')
    step_element = models.ForeignKey(PageElement, blank=True, null=True, on_delete=models.SET_NULL, verbose_name='关联元素')
    step_type = models.CharField(max_length=30, verbose_name='操作类型')
    step_input = models.CharField(max_length=100, blank=True, null=True, verbose_name='输入内容')
    index = models.IntegerField(verbose_name='步骤顺序')

    class Meta:
        verbose_name = '测试步骤'
        verbose_name_plural = verbose_name

class UiCheck(TimeAbstract):
    case = models.ForeignKey(UiStep, on_delete=models.CASCADE, verbose_name='关联步骤')
    check_name =  models.CharField(max_length=50, verbose_name='检查点名称')
    check_element = models.ForeignKey(PageElement, blank=True, null=True, on_delete=models.SET_NULL, verbose_name='关联元素')
    check_type = models.CharField(max_length=30, verbose_name='检查点操作类型')
    check_input = models.CharField(max_length=100, blank=True, null=True, verbose_name='检查点输入内容')
    index = models.IntegerField(verbose_name='检查点顺序')

    class Meta:
        verbose_name = '测试检查点'
        verbose_name_plural = verbose_name

