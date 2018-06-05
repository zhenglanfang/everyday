# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0003_auto_20171014_1631'),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CartInfo',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('nums', models.IntegerField()),
                ('cart_good', models.ForeignKey(to='goods.GoodsInfo')),
                ('cart_user', models.ForeignKey(to='user.User')),
            ],
        ),
    ]
