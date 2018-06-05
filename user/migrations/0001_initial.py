# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('recipients', models.CharField(max_length=20)),
                ('add', models.CharField(max_length=60)),
                ('cel', models.CharField(max_length=11)),
                ('postcode', models.CharField(max_length=6)),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('uname', models.CharField(max_length=13)),
                ('upwd', models.CharField(max_length=40, help_text='长度为6-15')),
                ('ucel', models.CharField(max_length=11)),
                ('uadd', models.CharField(max_length=20, null=True)),
                ('uemail', models.CharField(max_length=254)),
                ('isdelete', models.BooleanField(default=False)),
            ],
        ),
        migrations.AddField(
            model_name='address',
            name='user',
            field=models.ForeignKey(to='user.User'),
        ),
    ]
