from django.contrib import admin
from order import models

admin.site.register(models.OrderInfo)
admin.site.register(models.OrderDetailInfo)
