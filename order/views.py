from django.shortcuts import render,redirect
from django.core.urlresolvers import reverse
from django.db import transaction
from django.views.decorators.csrf import csrf_exempt
from django.http.response import HttpResponse
from datetime import datetime
from user import user_decorator
from order.models import OrderDetailInfo,OrderInfo
from user.models import Address
from cart.models import CartInfo
from goods.public import page

# 用户订单
@user_decorator.login
def order(request):
    context = {}
    user_id = int(request.session.get('userid'))
    orders = OrderInfo.objects.filter(user_id=user_id).order_by('-pk')
    if orders.exists():
        # context['orders'] = orders
        # 分页
        now_page = request.GET.get('page', '1')
        page_context = page(orders, 2, now_page)
        context.update(page_context)
    return render(request, 'order/user_order.html',context)

# 显示提交订单
@user_decorator.login
def submit_order(request):
    user_id = int(request.session.get('userid'))
    # 选购商品
    cart_ids = request.GET.getlist('cart_ids')
    cart_ids2 = ','.join(cart_ids)
    if not cart_ids:
        return redirect(reverse('cart:carts'))
    cart_ids = [int(i) for i in cart_ids]
    carts = CartInfo.objects.filter(pk__in=cart_ids)
    # 总金额和总商品数量
    sum_money = 0
    count = 0
    for cart in carts:
        sum_money += float(cart.money())
        count += cart.nums
    # 收货地址
    adds = Address.objects.filter(user_id=user_id)
    if not adds.exists():
        adds = None
    context = {
        'carts':carts,
        'adds':adds,
        'sum_money':sum_money,
        'count':count,
        'pay_money':sum_money+10,
        'cart_ids':cart_ids2, # 购物车的id,用于提交订单
    }
    response = render(request, 'order/submit_order.html',context)
    response.set_cookie('order_url',request.get_full_path())
    return response

# 添加订单
'''
    添加订单：
     1.创建订单
     2.判断商品库存
     3.创建订单明细对象
     4.修改商品信息：库存,销量
     5.删除购物车
     
    事务设计原则：
     1.保持事务短小
     2.尽量避免事务中rollback
     3.默认情况下,依赖于悲观锁
     4.为吞吐量要求苛刻的事务考虑乐观锁
     5.显示声明打开事务
     6.锁的行越少越好,锁的时间越短越好
     
    django中的事务：http://python.usyiyi.cn/translate/django_182/topics/db/transactions.html
        
        from django.db import transaction # 导入模块
        
        # open a transaction
        @transaction.atomic
        def viewfunc(request):
            a.save()
            # transaction now contains a.save()

            sid = transaction.savepoint() # 事务起点
        
            b.save()
            # transaction now contains a.save() and b.save()
        
            if want_to_keep_b:
                transaction.savepoint_commit(sid) # 提交事务
                # open transaction still contains a.save() and b.save()
            else:
                transaction.savepoint_rollback(sid) # 回滚到起点
                # open transaction now contains only a.save()
    
'''
@user_decorator.login
@transaction.atomic
def add_order(request):
    post = request.POST
    if post:
        address = Address.objects.get(pk=int(post.get('address')))
        address = '%s （%s收） %s'%(address.add,address.recipients,address.cel)
        cart_ids = post.get('cart_ids').split(',')
        cart_ids = [int(i) for i in cart_ids]
        carts = CartInfo.objects.filter(pk__in=cart_ids)

        sid = transaction.savepoint() # 事务起点

        try:
            # 创建订单
            order = OrderInfo()
            now = datetime.now()
            order.pk = int(now.strftime('%s')) # 订单编号：当前时间now.strftime('%Y%m%d%H%M%S')
            order.user_id = int(request.session.get('userid')) # 用户编号
            order.address = address # 地址
            order.total = 0 # 总金额
            order.save()
            # 1/0 异常模拟

            # 创建订单明细
            total = 0
            for cart in carts:
                if cart.nums > cart.cart_good.stock: # 如果数量大于库存
                    transaction.savepoint_rollback(sid) # 回滚到起点
                    return redirect(reverse('cart:carts')) # 重定向到购物车
                else:
                    order_detail = OrderDetailInfo()
                    order_detail.good = cart.cart_good
                    order_detail.order = order
                    order_detail.price = cart.cart_good.price
                    order_detail.count = cart.nums
                    order_detail.save()

                    total += float(cart.money())
                    cart.delete()
            # 修改总价
            order.total = total + 10
            order.save()
            transaction.savepoint_commit(sid)  # 提交事务
            return redirect(reverse('order:play',args=(order.pk,)))
        except Exception as e:
            print('异常：%s'%e)
            transaction.savepoint_rollback(sid) # 回滚到起点
            raise e   # 抛出异常，用于调试
            return redirect(reverse('order:user_order'))  # 重定向到订单页面

# 支付页面
def play(request,order_id):
    order = OrderInfo.objects.filter(pk=order_id)
    if order.exists():
        context = {
            'order':order[0]
        }
        return render(request, 'order/play.html',context)
    return redirect(reverse('order:user_order'))

# 支付处理
@csrf_exempt
@user_decorator.login
@transaction.atomic
def play_handle(request):
    order_id = request.POST.get('order')
    if order_id:
        order = OrderInfo.objects.get(pk=int(order_id))
        orders_detail = order.orderdetailinfo_set.all()
        sid = transaction.savepoint()  # 事务起点
        try:
            for order_detail in orders_detail:
                # 判断库存是否充足
                if order_detail.count > order_detail.good.stock: # 如果数量大于库存
                    # 返回商品的id
                    return HttpResponse(order_detail.good.pk)
                # 修改商品,应该在支付后修改
                order_detail.good.stock -= order_detail.count
                order_detail.good.sell_count += order_detail.count
                order_detail.good.save()
            # 1/0
            # 修改订单
            order.isPlay = True
            order.save()
            transaction.savepoint_commit(sid)
            return HttpResponse('ok')
        except Exception as e:
            print('异常：%s' % e)
            transaction.savepoint_rollback(sid)  # 回滚到起点
            # raise e  # 抛出异常，用于调试

    return HttpResponse('false')


# 计算总价
def sub_money(cart_ids):
    cart_ids = [int(i) for i in cart_ids]
    carts = CartInfo.objects.filter(pk__in=cart_ids)
    # 总金额和总商品数量
    sum_money = 0
    count = 0
    for cart in carts:
        sum_money += float(cart.money())
        count += cart.nums
    context = {
        'carts': carts, # 购物商品
        'sum_money': sum_money, # 总价
        'count': count, # 总数量
        'pay_money': sum_money + 10, # 实付款
    }
    return context

