from django.db import models

#订单表
class OrderInfo(models.Model):
    user = models.ForeignKey('user.User')
    date = models.DateTimeField(auto_now=True)
    isPlay = models.BooleanField(default=False)
    total  = models.DecimalField(max_digits=6,decimal_places=2)
    address = models.CharField(max_length=150)

    def __str__(self):
        return str(self.pk)

    def isplay_switch(self):
        if self.isPlay:
            return '已支付'
        return '未支付'

#订单详细表
class OrderDetailInfo(models.Model):
    good = models.ForeignKey('goods.GoodsInfo')
    order = models.ForeignKey(OrderInfo)
    price =  models.DecimalField(max_digits=5,decimal_places=2)
    count = models.IntegerField()

    def __str__(self):
        return self.good.good_title

    def sub_money(self):
        return '%0.2f' % (self.price * self.count)


