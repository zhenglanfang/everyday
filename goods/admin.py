from django.contrib import admin
from goods import models

class GoodsInfoAdmin(admin.ModelAdmin):
    list_display = ['good_title', 'price', 'promo_price', 'unit', 'stock', 'freight', 'sell_count', 'good_type','imgs']
    list_per_page = 20

class TypeInfoAdmin(admin.ModelAdmin):
    list_display = ['pk','type_title']

class ReviewsAdmin(admin.ModelAdmin):
    list_display = ['reviews_good']


admin.site.register(models.GoodsInfo,GoodsInfoAdmin)
admin.site.register(models.TypeInfo,TypeInfoAdmin)
admin.site.register(models.Reviews,ReviewsAdmin)
