from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.core.urlresolvers import reverse
from django.views.decorators.csrf import csrf_exempt
from user import user_decorator
from cart import models
from goods.public import exists_good,cart_count

# 显示购物车
@user_decorator.login
def cart(request):
    user_id = int(request.session.get('userid'))
    carts = models.CartInfo.objects.filter(cart_user_id=user_id)
    context = {}
    #查询是否有记录
    if carts.exists():
        context['carts'] = carts

    return render(request,'cart/cart.html',context)

# 改变购物数量
@csrf_exempt
@user_decorator.login
def update_cart(request,id):
    result = cart_exists(id)
    nums = request.POST.get('nums')
    if result and nums:
        result.nums = int(nums)
        result.save()
        return HttpResponse('ok')
    else:
        return HttpResponse('error')

# 删除购物记录
@csrf_exempt
@user_decorator.login
def delete_cart(request,id):
    result = cart_exists(id)
    if result:
        result.delete()
        return HttpResponse('ok')
    else:
        return HttpResponse('error')

# 添加购物记录
@csrf_exempt
@user_decorator.login
def add_cart(request,good_id):
    # 判断请求的good是否存在,同时发送的是post请求
    if exists_good(good_id) and request.POST:
        user_id = int(request.session.get('userid'))
        add_count = int(request.POST.get('add_count'))
        # 查询该商品是否已经在购物车
        cart = models.CartInfo.objects.filter(cart_user_id=user_id,cart_good_id=good_id)
        # 存在,则修改,否则添加
        if cart.exists():
            cart = cart[0]
            cart.nums = cart.nums + add_count
            cart.save()
        else:
            add_cart = models.CartInfo()
            add_cart.nums = add_count
            add_cart.cart_user_id = user_id
            add_cart.cart_good_id = good_id
            add_cart.save()
        # 从后端重新获取cart_count
        return HttpResponse(cart_count(request))
    else:
        return HttpResponse('error')

#判断cart记录是否存在
def cart_exists(cart_id):
    cart = models.CartInfo.objects.filter(pk=cart_id)
    if cart.exists():
        return cart[0]
    else:
        return False

