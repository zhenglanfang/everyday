from django.db import models

class CartInfo(models.Model):
    cart_user = models.ForeignKey('user.User')
    cart_good = models.ForeignKey('goods.GoodsInfo')
    nums = models.IntegerField()

    def money(self):
        return '%0.2f'%(self.cart_good.price*self.nums)


