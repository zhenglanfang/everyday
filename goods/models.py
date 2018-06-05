from django.db import models
from tinymce.models import HTMLField
from public.imageStorage import ImageStorage

#商品种类
class TypeInfo(models.Model):
    type_title = models.CharField(max_length=15)
    isdelete = models.BooleanField(default=False)

    def __str__(self):
        return self.type_title

#商品
class GoodsInfo(models.Model):
    '''
        good_title:名称
        price:价格
        promo_price：促销价
        unit：单位，默认500g
        desc：商品描述
        detail：商品详情
        stock：库存,默认0
        freight：运费,默认0
        sell_count：销量,默认0
        imgs：图片,路径：/static/media/images/goods/
        isdelete：是否删除，默认False
        good_type:种类
    '''
    good_title = models.CharField(max_length=15)
    price = models.DecimalField(max_digits=5,decimal_places=2,)
    promo_price = models.DecimalField(max_digits=5,decimal_places=2,default=None)
    unit = models.CharField(max_length=10,default='500g')
    desc = models.CharField(max_length=100)
    detail = HTMLField()
    stock = models.IntegerField(default=0)
    freight = models.DecimalField(max_digits=5,decimal_places=2,default=0)
    sell_count = models.IntegerField(default=0)
    # 文件上传到：images/goods/2007/01/15下，
    imgs = models.ImageField(upload_to='images/goods/%Y/%m/%d',storage=ImageStorage())
    good_type = models.ForeignKey(TypeInfo)
    isdelete = models.BooleanField(default=False)

    def __str__(self):
        return self.good_title

    # 返回图片路径
    def img_url(self):
        return 'media/%s'%self.imgs

    # 截取标题
    def title10(self):
        if len(self.good_title) > 10:
            return '%s...'%self.good_title[:10]
        else:
            return self.good_title

    def title5(self):
        if len(self.good_title) > 5:
            return '%s...' % self.good_title[:5]
        else:
            return self.good_title

    # 转换单位
    def unit_switch(self):
        if not self.unit.endswith('kg'):
            if len(self.unit) >= 5:
                weigth = int(self.unit[:-1])
                return '%skg'%(weigth/1000)
        return self.unit

#评论（自关联）
class Reviews(models.Model):
    context = HTMLField()
    date = models.DateTimeField(auto_now=True)
    reviews_good = models.ForeignKey(GoodsInfo)
    par_review = models.ForeignKey('self',null=True,default=None)

    def __str__(self):
        return self.context

#商品图片：1对多
# class GoodsImages(models.Model):
#     img = models.ImageField()
#     img_good = models.ForeignKey(GoodsInfo)

from django.core.files.storage import FileSystemStorage



