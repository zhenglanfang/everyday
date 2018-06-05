from django.contrib import admin
from user import models

class UserAdmin(admin.ModelAdmin):
    list_display = ['pk','uname','isdelete']

class AddressAdmin(admin.ModelAdmin):
    list_display = ['pk','user','recipients']
    list_per_page = 20

admin.site.register(models.User,UserAdmin)
admin.site.register(models.Address,AddressAdmin)
