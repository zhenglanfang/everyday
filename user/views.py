import hashlib
import random
import goods.models
from django.shortcuts import render,redirect
from user import models
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect,HttpResponse
from PIL import Image,ImageDraw,ImageFont
from io import BytesIO
from django.views.decorators.csrf import csrf_exempt
from datetime import timedelta,datetime
from user import user_decorator

#登录
def login(request):
    context = {}
    # 判断是否是注册成功
    # if request.COOKIES.get('ok'):
    #     context['ok'] = 'ok'
    #     resopnse.delete_cookie('ok')

    username = request.session.get('rem_username','')
    userpwd = request.session.get('rem_userpwd','')
    if username and userpwd:
        context['username'] = username
        context['userpwd'] = userpwd
    else:
        #获取cookie:userid
        uid = request.COOKIES.get('userid')
        query = models.User.objects.filter(pk=uid)
        if query.exists():
            # upwd = query[0].upwd
            context['username'] = query[0].uname

    #判断是否提交
    if not request.POST:
        return render(request, 'user/login.html',context)
    #登录逻辑处理
    return login_handle(request)

#登录逻辑处理
def login_handle(request):
    context = {}
    agrs = request.POST
    username = agrs.get('username','').strip()
    userpwd = agrs.get('userpwd','').strip()
    rempwd = agrs.get('rempwd', None)
    newpwd = hashlib.sha1(userpwd.encode('utf-8')).hexdigest()
    cekcode = agrs.get('verifycode').strip()
    context['username'] = username
    context['userpwd'] = userpwd
    if cekcode.upper() != request.session.get('verifycode'):
        context['err'] = '验证码错误！'
        return render(request, 'user/login.html', context)
    query = models.User.objects.filter(uname=username, upwd=newpwd)
    # 登录成功
    if query.exists():
        userid = query[0].pk
        request.session['userid'] = userid
        request.session['username'] = username
        # request.session.set_expiry(0)
        if request.COOKIES.get('url'):
            response = HttpResponseRedirect(request.COOKIES.get('url'))
            response.delete_cookie('url')
        else:
            response = HttpResponseRedirect(reverse('index'))
        # 记住密码
        if rempwd:
            request.session['rem_username'] = username
            request.session['rem_userpwd'] = userpwd
        # 记住用户名
        response.set_cookie('userid', userid, expires=datetime.now() + timedelta(days=7))
        return response
    # 登录失败
    context['err'] = '用户名或密码错误！'
    context['userpwd'] = ''
    return render(request, 'user/login.html', context)

#退出
def logout(request):
    if request.session.get('userid') and request.session.get('username'):
        del request.session['userid']
        del request.session['username']
    return redirect(reverse('user:login'))
    # return HttpResponse('<script type="text/javascript">window.open("","_parent","");window.opener = window;window.close();</script>')

#注册
def register(request):
    agrs = request.POST
    if not agrs:
        return render(request, 'user/register.html')

    #注册逻辑处理
    username = agrs['username'].strip()
    userpwd = agrs['userpwd'].strip()
    email = agrs['email'].strip()
    context = {}
    query = models.User.objects.filter(uname=username)
    if query.exists():
        context['err'] = '手机号已被注册！'
        return render(request, 'user/register.html',context)

    #异常处理,添加不成功
    userpwd = hashlib.sha1(userpwd.encode('utf-8')).hexdigest()
    models.User.objects.create(uname=username,upwd=userpwd,uemail=email,ucel=username)

    # 注册成功返回登录页面
    response = HttpResponseRedirect(reverse('user:login'))
    result = models.User.objects.filter(uname=username)
    userid = result[0].pk
    response.set_cookie('ok','ok')
    response.set_cookie('userid', userid,expires=datetime.now()+timedelta(days=7))
    # 删除cookie
    # response.delete_cookie('uname')
    return response

#验证码
def verifycode(request):
    bgcolor = (random.randrange(20,101),random.randrange(20,101),random.randrange(101,255))
    height = 35
    width = height*4
    im = Image.new('RGB',(width,height),bgcolor)
    draw = ImageDraw.Draw(im)
    for i in range(200):
        xy = (random.randrange(0,width),random.randrange(0,height))
        draw.point(xy,fill=random_color())

    str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0'
    checkcode = ''

    for i in range(0,4):
        checkcode += str1[random.randint(0,len(str1)-1)]

    font = ImageFont.truetype('DejaVuSerif.ttf',18)

    for i in range(0,4):
        draw.text((height*i+7,5),checkcode[i],font=font,fill=random_color())

    del draw
    request.session['verifycode'] = checkcode
    buf = BytesIO()
    im.save(buf,'png')
    return HttpResponse(buf.getvalue(),'image/png')

#判断用户名是否存在
@csrf_exempt
def check_name(request):
    name = request.POST.get('name','').strip()
    if name:
        name = name.strip()
        query = models.User.objects.filter(uname=name)
        if query.exists():
            return HttpResponse('error')
    return HttpResponse('ok')

#随机颜色
def random_color():
    return (255,random.randrange(0,255),random.randrange(0,255))

# 用户信息
@user_decorator.login
def info(request):
    context = {}
    id = request.session.get('userid')
    user = models.User.objects.get(pk=int(id))
    context['uname'] = user.uname
    context['ucel'] = user.ucel
    context['uadd'] = user.uadd2()

    # 获取浏览记录
    browse_goods = request.COOKIES.get('browse_goods')
    if browse_goods:
        browse_goods = browse_goods.split(',')
        goods_id = [int(i) for i in browse_goods]
        # map 返回的是迭代器，适合获取多个值
        # goods_id = map(int,browse_goods)
        good = []
        for id in goods_id:
            good.append(goods.models.GoodsInfo.objects.filter(pk=id)[0])
        context['goods'] = good
    return render(request,'user/user_info.html',context)

# 收货地址
@user_decorator.login
def address(request):
    id = request.session.get('userid')
    context = {}
    del_id = request.GET.get('del_id')
    update_id = request.GET.get('update_id')
    # 删除
    if del_id:
        del_add(int(del_id))
    # 修改,传递地址信息
    elif update_id:
        add = models.Address.objects.get(pk=int(update_id))
        context['add_id'] = update_id
        context['recipients'] = add.recipients
        context['add'] = add.add
        context['cel'] = add.cel
        context['postcode'] = add.postcode

    user = models.User.objects.get(pk=int(id))
    adds = user.address_set.all()
    context['adds'] = adds
    return render(request,'user/user_address.html',context)

# 编辑收货地址
def edit_add(request):
    id = request.session.get('userid')
    post = request.POST
    # 提交
    if post:
        # 添加地址
        add = models.Address()
        # 修改地址
        if post.get('update'):
            add_id = post.get('update')
            add = models.Address.objects.get(pk=int(add_id))
        add.recipients = post.get('recipients')
        add.add = post.get('add')
        add.cel = post.get('cel')
        add.postcode = post.get('postcode')
        add.user_id = int(id)
        add.save()
    # 重定向到订单页面
    if post.get('order'):
        return redirect(post.get('order'))
    return redirect(reverse('user:user_address'))

# 删除收货地址
def del_add(id):
    add = models.Address.objects.filter(pk=id)
    if add.exists():
        add[0].delete()




