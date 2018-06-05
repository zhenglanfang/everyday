from django.contrib import admin
from cart import models

class CartInfoAdmin(admin.ModelAdmin):
    list_display = ['pk','cart_user','cart_good','nums']
    list_per_page = 20

admin.site.register(models.CartInfo,CartInfoAdmin)
