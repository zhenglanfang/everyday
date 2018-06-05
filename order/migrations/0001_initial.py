# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0005_auto_20171020_0759'),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='OrderDetailInfo',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('price', models.DecimalField(decimal_places=2, max_digits=5)),
                ('count', models.IntegerField()),
                ('good', models.ForeignKey(to='goods.GoodsInfo')),
            ],
        ),
        migrations.CreateModel(
            name='OrderInfo',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(auto_now=True)),
                ('isPlay', models.BooleanField(default=False)),
                ('total', models.DecimalField(decimal_places=2, max_digits=6)),
                ('address', models.CharField(max_length=150)),
                ('user', models.ForeignKey(to='user.User')),
            ],
        ),
        migrations.AddField(
            model_name='orderdetailinfo',
            name='order',
            field=models.ForeignKey(to='order.OrderInfo'),
        ),
    ]
