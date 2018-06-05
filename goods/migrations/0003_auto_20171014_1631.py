# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0002_auto_20171013_1951'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goodsinfo',
            name='promo_price',
            field=models.DecimalField(default=None, decimal_places=2, max_digits=5),
        ),
    ]
