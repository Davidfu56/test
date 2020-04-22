# Generated by Django 2.2.1 on 2019-09-01 21:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('project', '0003_auto_20190830_1617'),
    ]

    operations = [
        migrations.CreateModel(
            name='PageElement',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('add_time', models.DateTimeField(auto_now_add=True, verbose_name='添加时间')),
                ('modify_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('element_name', models.CharField(max_length=100, verbose_name='元素名称')),
                ('element_alias', models.CharField(default='', max_length=100, verbose_name='描叙')),
                ('page_name', models.CharField(default='', max_length=100, verbose_name='页面名称')),
                ('element_by', models.CharField(default='', max_length=10, verbose_name='查找方式')),
                ('element_locate', models.CharField(default='', max_length=300, verbose_name='定位内容')),
                ('element_index', models.IntegerField(null=True, verbose_name='元素下标')),
                ('project', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='project.Project', verbose_name='关联项目')),
            ],
            options={
                'verbose_name': '页面元素',
                'verbose_name_plural': '页面元素',
                'unique_together': {('project', 'element_name')},
            },
        ),
    ]
