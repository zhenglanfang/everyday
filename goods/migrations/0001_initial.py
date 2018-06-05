# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, primary_key=True, verbose_name='ID')),
                ('good_title', models.CharField(max_length=15)),
                ('price', models.DecimalField(decimal_places=2, max_digits=5)),
                ('promo_price', models.DecimalField(decimal_places=2, max_digits=5,null=True,default=None)),
                ('unit', models.CharField(max_length=5, default='500g')),
                ('desc', models.CharField(max_length=100)),
                ('detail', tinymce.models.HTMLField()),
                ('stock', models.IntegerField(default=0)),
                ('freight', models.DecimalField(decimal_places=2, default=0, max_digits=5)),
                ('sell_count', models.IntegerField(default=0)),
                ('imgs', models.ImageField(upload_to='images/goods/')),
                ('isdelete', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Reviews',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, primary_key=True, verbose_name='ID')),
                ('context', tinymce.models.HTMLField()),
                ('par_review', models.ForeignKey(default=None, null=True, to='goods.Reviews')),
                ('reviews_good', models.ForeignKey(to='goods.GoodsInfo')),
            ],
        ),
        migrations.CreateModel(
            name='TypeInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, primary_key=True, verbose_name='ID')),
                ('type_title', models.CharField(max_length=15)),
                ('isdelete', models.BooleanField(default=False)),
            ],
        ),
        migrations.AddField(
            model_name='goodsinfo',
            name='good_type',
            field=models.ForeignKey(to='goods.TypeInfo'),
        ),
    ]
