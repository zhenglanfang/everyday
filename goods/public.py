from django.core.paginator import Paginator
from goods.models import GoodsInfo
from user.models import User

#商品是否存在
def exists_good(good_id):
    good = GoodsInfo.objects.filter(pk=good_id)
    return good.exists()

# 获取购物车的数量
def cart_count(request):
    userid = request.session.get('userid')
    count = 0
    # 用户不存在,直接返回
    if not userid:
         return count
    #获取用户,查询其购物记录
    user = User.objects.filter(pk=int(userid))
    if user.exists():
        carts = user[0].cartinfo_set.all()
        for cart in carts:
            count += cart.nums
    return count

# 分页
def page(result,page_size,page_now):
    '''
    分页,下面的分页共显示5列,当点击第4的时候,添加一个
    :param result: 总数据集合
    :param page_size: 每页显示的数量
    :param page_now: 当前页码
    :return: context字典,包含需要的数据
    '''
    p = Paginator(result,page_size)
    page_range = p.page_range
    #如果传递的page_now,不存在就设置为1
    # page_now.isdigit() ：传递的page_now是字符串
    if page_now.isdigit():
        page_now = int(page_now)
        if page_now not in p.page_range:
            page_now = 1
    else:
        page_now = 1

    #总页小于5
    if p.num_pages <= 5:
        pass
    #page_now < 4 时
    elif page_now < 4 and p.count>5:
        page_range = [1,2,3,4,5]
    # page_now:下面的页数大于2
    elif p.num_pages - page_now >= 2:
        page_range = list(range(page_now-2,page_now+3))
    #page_now:下面的页数小于2
    else:
        page_range = page_range[len(page_range)-5:]

    pages = p.page(page_now)
    context = {
        'count':p.count,             #总记录数
        'num_pages':p.num_pages,     #总页数
        'page_range':page_range,     #页码列表
        'page_now':page_now,         #当前页码
        'objs':pages.object_list,    #当前页上所有对象的列表
        'pages':pages                #当前page对象
    }
    return context

# 查询
def find(request):
    pass