# Generated by Django 2.2.1 on 2019-09-02 14:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0003_auto_20190830_1617'),
        ('testcenter', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='TestCase',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('add_time', models.DateTimeField(auto_now_add=True, verbose_name='添加时间')),
                ('modify_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('test_id', models.CharField(max_length=30, unique=True, verbose_name='用例编号')),
                ('test_model', models.CharField(max_length=50, verbose_name='模块')),
                ('test_title', models.CharField(max_length=100, verbose_name='测试标题')),
                ('test_setUp', models.CharField(blank=True, max_length=10, null=True, verbose_name='前置条件')),
                ('test_tearDown', models.CharField(blank=True, max_length=10, null=True, verbose_name='后置条件')),
                ('flag', models.BooleanField(default=False, verbose_name='状态')),
                ('project', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='project.Project', verbose_name='关联项目')),
            ],
            options={
                'verbose_name': '测试用例',
                'verbose_name_plural': '测试用例',
            },
        ),
        migrations.AlterField(
            model_name='pageelement',
            name='element_index',
            field=models.IntegerField(blank=True, null=True, verbose_name='元素下标'),
        ),
        migrations.CreateModel(
            name='UiStep',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('add_time', models.DateTimeField(auto_now_add=True, verbose_name='添加时间')),
                ('modify_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('step_name', models.CharField(max_length=50, verbose_name='步骤名称')),
                ('step_type', models.CharField(max_length=30, verbose_name='操作类型')),
                ('step_input', models.CharField(blank=True, max_length=100, null=True, verbose_name='输入内容')),
                ('index', models.IntegerField(verbose_name='步骤顺序')),
                ('case', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='testcenter.TestCase', verbose_name='关联用例')),
                ('step_element', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='testcenter.PageElement', verbose_name='关联元素')),
            ],
            options={
                'verbose_name': '测试步骤',
                'verbose_name_plural': '测试步骤',
            },
        ),
        migrations.CreateModel(
            name='UiCheck',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('add_time', models.DateTimeField(auto_now_add=True, verbose_name='添加时间')),
                ('modify_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('check_name', models.CharField(max_length=50, verbose_name='检查点名称')),
                ('check_type', models.CharField(max_length=30, verbose_name='检查点操作类型')),
                ('check_input', models.CharField(blank=True, max_length=100, null=True, verbose_name='检查点输入内容')),
                ('index', models.IntegerField(verbose_name='检查点顺序')),
                ('case', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='testcenter.UiStep', verbose_name='关联步骤')),
                ('check_element', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='testcenter.PageElement', verbose_name='关联元素')),
            ],
            options={
                'verbose_name': '测试检查点',
                'verbose_name_plural': '测试检查点',
            },
        ),
    ]
