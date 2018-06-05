from django.db import models

# 用户信息表
class User(models.Model):
    uname = models.CharField(max_length=13)
    upwd = models.CharField(max_length=40, help_text='长度为6-15')
    ucel = models.CharField(max_length=11)
    uadd = models.CharField(max_length=20,null=True)
    uemail = models.CharField(max_length=254)
    isdelete = models.BooleanField(default=False)

    def __str__(self):
        return self.uname

    def uadd2(self):
        if self.uadd:
            return self.uadd
        else:
            return '暂无'

# 收货地址表
class Address(models.Model):
    recipients = models.CharField(max_length=20)
    add = models.CharField(max_length=60)
    cel = models.CharField(max_length=11)
    postcode = models.CharField(max_length=6)
    user = models.ForeignKey(User)

    def __str__(self):
        return self.recipients


