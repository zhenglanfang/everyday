from django.shortcuts import render,redirect
from django.core.urlresolvers import reverse
from django.db.models import Q
from goods.models import GoodsInfo,TypeInfo
from goods.public import cart_count,page

#首页
def index(request):
    context = {}
    context['cart_count'] = cart_count(request)
    #获取全部分类
    types = TypeInfo.objects.filter(isdelete=False).values('pk')
    good_type = []
    #获取分类下的商品
    for i in types:
        good_type.append(GoodsInfo.objects.filter(good_type_id=i.get('pk')))
    #获取部分商品信息
    i = 0
    while i < len(good_type):
        # type_sell热门,按销量排序
        # type_new新增
        context['type%s_sell'%i] = good_type[i].order_by('-sell_count')[0:3]
        context['type%s_new'%i] = good_type[i].order_by('-pk')[0:4]
        i += 1
    return render(request,'index.html',context)

#商品分类页
def list(request,type_id,now_page):
    classify = TypeInfo.objects.filter(pk=int(type_id))
    keywd = request.GET.get('search')
    # 既不是查询,也不存在当前类别,则跳转到index
    if not (keywd or classify) :
        return redirect(reverse('index'))
    # 查询默认设置
    context = {
        'cart_count': cart_count(request),  # 购物数量
        'classify' : {'type_title':'搜索商品','pk':0} , # 商品类别对象
        'new_good': GoodsInfo.objects.order_by('-pk')[:2] #新品推荐 全部
    }
    # 判断当前类别是否存在(当类别存在的时候,无论是查询还是访问list页面都需要设置当前类别和该类下的新品推荐)
    if classify.exists():
        # 获取该类下的good
        type_goods = classify[0].goodsinfo_set
        context['classify'] = classify[0]  # 商品类别对象
        context['new_good'] = type_goods.order_by('-pk')[:2]  # 新品推荐 分类
    # 判断是否是查询,是查询则获取查询的结果集
    if keywd:
        type_goods = search(keywd, type_id)
        context['search'] = keywd.strip()
    # 排序
    sell = request.GET.get('sell')
    price = request.GET.get('price')
    goods = type_goods.order_by('desc')
    # 按销量排序
    if sell == '1':
        context['sell'] = 1 #用于确定单击人气
        goods = type_goods.order_by('-sell_count')
    # 按价格排序
    elif price == '1':
        context['price'] =1
        goods = type_goods.order_by('price')

    # 分页
    page_context = page(goods,3,now_page)
    context.update(page_context)
    return render(request,'goods/list.html',context)

#商品详细页
def detail(request,good_id):
    good = GoodsInfo.objects.filter(pk=int(good_id))
    #查询不到good，返回列表页
    if not good.exists():
        return redirect(reverse('index'))
    context = {
        'cart_count':cart_count(request),
        'good':good[0],
        'new_good':GoodsInfo.objects.order_by('-pk')[0:2]
    }
    response = render(request,'goods/detail.html',context)

    # 设置浏览cookie
    browse_goods = request.COOKIES.get('browse_goods')
    #得到str类型的id
    str_good_id = str(good_id)
    # 判断浏览的cookie是否存在
    if browse_goods:
        # 将获取的cookie分割，例：cookie['browse_goods']='1,2,13,3'
        browse_goods = browse_goods.split(',')
        # 判断浏览的id是否存在，如果存在这删除
        if str(good_id) in browse_goods:
            browse_goods.remove(str_good_id)
        #判断cookie中的id个数是否大于4(等于5)，删除最后一个
        elif len(browse_goods) > 4:
            browse_goods.pop()
        #最后将id插入到最前面
        browse_goods.insert(0,str_good_id)
        #将列表转换为str
        browse_goods_str = ','.join(browse_goods)
        response.set_cookie('browse_goods',browse_goods_str)
    else:
        response.set_cookie('browse_goods',str_good_id)

    return response

#查找商品
def search(keywd,type_id):
    '''
    查找商品
    :param keywd: 关键字
    :param type_id: 类别id
    :return: 查询的结果集
    '''
    goods_set = GoodsInfo.objects.filter()
    # type_id存在
    if type_id and TypeInfo.objects.filter(pk=int(type_id)).exists():
        goods_set = goods_set.filter(good_type_id=int(type_id))
    # 模糊查询
    result = goods_set.filter(Q(good_title__icontains=keywd) | Q(desc__icontains=keywd))
    # 查询结果不存在，返回所以商品
    if not result.exists():
        result = goods_set
    # 返回查询的结果集
    return result

#查询的对象是否存在
def exists(query_result):
    if not query_result.exists():
        return redirect(reverse('index'))
    return True

'''
    浏览记录：
    1.游客：缓存到cookie
    2.用户：缓存到数据库
'''

