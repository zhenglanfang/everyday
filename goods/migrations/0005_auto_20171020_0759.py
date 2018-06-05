# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0004_reviews_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reviews',
            name='date',
            field=models.DateField(default=datetime.date(2017, 10, 20)),
        ),
    ]
