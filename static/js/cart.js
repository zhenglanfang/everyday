/**
 * Created by Administrator on 2017/9/2.
 */
$(function () {
    /*初始化：商品和全选*/
    change_count();
    checkall_start();
    //全选事件
    $('.check_all').click(function () {
        checkAll($(this))
    });

    //checkbox事件
    $('.cart_list').delegate('.cart_list_td .col01 input','click',function () {
        change_sum($(this));
    });
    /*$('.cart_list_td .col01 input').click(function () {
     change_sum($(this));
     });*/

    //删除事件
    $('.cart_list').delegate('.cart_list_td .col08 a','click',function (){
        delete_cart_ajax($(this));
    });
    /* $('.cart_list_td .col08 a').click(function () {
     $(this).parents('.cart_list_td').remove();
     var $obj = $(this).parent().prevAll('.col01').children();
     $obj.prop('checked',false);
     change_sum($obj);
     });*/

    //+事件
    $('.cart_list').delegate('.cart_list_td .col06 .add','click',function () {
        var num;
        num = add_minus($(this),'+');
        change_cart_ajax($(this),num);
    });
    /*$('.cart_list_td .col06 .add').click(function () {
     add_minus($(this),'+');
     });*/

    //-事件
    $('.cart_list').delegate('.cart_list_td .col06 .minus','click',function () {
        var num;
        num = add_minus($(this),'-');
        change_cart_ajax($(this),num);
    });
    /*$('.cart_list_td .col06 .minus').click(function () {
     add_minus($(this),'-');
     });*/

    //数量-input事件,con1:修改之前的数量
    var con1;
    $('.cart_list_td .col06 .num_show').on('focus change',function (event) {
        if(event.type =='focus'){
            con1 = $(this).val();
        }
        if(event.type =='change'){
            var con2= $(this).val();
            if(/^[1-9][0-9]{0,4}$/.test(con2)){
                // 判断是否大于库存
                var max;
                max = $(this).parents('.col06').prevAll('.col03').children('b').text();
                max = parseInt(max);
                if(con2 > max){
                    con2 = max;
                    $(this).val(con2)
                }
                //查找 checkbox
                var $obj = $(this).parents('.col06').prevAll('.col01').find('input');
                var flag = $obj.is(':checked');
                if (flag){
                    $obj.prop('checked',false);
                    change_sum($obj);
                    $obj.prop('checked',true);
                }
                //获取单价
                var price= get_price($(this).parents('.col06').prev());
                //改变小计
                change_money(parseInt(con2),price,$(this).parents('.col06').next());
                if(flag){
                    change_sum($obj);
                    /*比正确的结果少了con2-con1,因为在是上个change_sum中count应该减的是改变之前的数量，实际减的是con2*/
                    var count = parseInt($('.settlements .col03 b').text());
//                    console.log(count)
                    count += parseInt(con2) - parseInt(con1);
                    $('.settlements .col03 b').text(count);
                }
                change_count($(this),count);
                change_cart_ajax($(this),parseInt(con2));
            }
            else {
                $(this).val(con1);
            }
        }
    });

    $('.settlements .col04 a').click(function () {

    });

    /*表单提交*/
    $('form').submit(function () {
        /*console.log(parseInt($('.settlements .col03 b').text()) );
         return false*/

        if(parseInt($('.settlements .col03 b').text()) == 0){
            return false;
        }
        else
            return true;

    })
});

/*全选1 直接计算*/
function checkall_start() {
    $('.check_all').prop('checked',true);
    var count = change_count();
    var money = 0;
    $('.cart_list_td .col01 input').each(function () {
        $(this).prop('checked',true);
        money += parseFloat($(this).parent().nextAll('.col07').text());
    });
    $('.settlements .col03 b').text(count);
    $('.settlements .col03 em').text(money.toFixed(2));
}

/*全选2 obj：全选的checkbook对象（通过单个checkbook实现）*/
function checkAll(obj) {
    if($(obj).is(':checked')){
        $('.cart_list_td .col01 input').each(function () {
            if(! $(this).is(':checked')){
                $(this).prop('checked',true);
                change_sum($(this));
            }
        });
    }
    else {
        $('.cart_list_td .col01 input').prop('checked',false);
        $('.settlements .col03 b').text(0);
        $('.settlements .col03 em').text('0.00');
    }
}

/* 改变总数量和价格 obj：单个checkbook对象*/
function change_sum(obj) {
    var count,money;
    var sum_count = parseInt($('.settlements .col03 b').text());
    var sum_money = parseFloat($('.settlements .col03 em').text());
    count = parseInt($(obj).parent().nextAll('.col06').find('input').val());
    money = parseFloat($(obj).parent().nextAll('.col07').text());
    //判断是否选中
    if($(obj).is(':checked')){
        count += sum_count;
        money += sum_money;
    }
    else {
        count = sum_count - count;
        money = sum_money - money;
    }
    $('.settlements .col03 b').text(count);
    $('.settlements .col03 em').text(money.toFixed(2));
}

/*加减事件:先执行checkbook为false事件，改变数量和价钱后，再执行checkbox为true事件*/
function add_minus(target,icon) {
    var $obj = $(target).parents('.col06').prevAll('.col01').find('input');
    var flag = $obj.is(':checked');
    //如果checkbox是选中状态,先减去原来的价钱，之后在加上改过之后价钱
    if (flag){
        $obj.prop('checked',false);
        change_sum($obj);
        $obj.prop('checked',true);
    }
    var num1,num2,max;
    //获取库存
    max = $(target).parents('.col06').prevAll('.col03').children('b').text();
    max = parseInt(max);
//    console.log(max);
    if(icon == '+'){
        //获取input文本框---数量
        num1 = parseInt($(target).prev().val());
        //修改后的数量
        num2 = add(num1,$(target).prev(),max);
    }
    else {
        num1 = parseInt($(target).next().val());
        num2 = minus(num1,$(target).next(),max);
    }
    var price = get_price($(target).parents('.col06').prev());
    change_money(num2,price,$(target).parents('.col06').next());
    //加上改变后的价钱
    if (flag){
        change_sum($obj);
    }
    change_count();
    return num2
}

/* 改变小计
 num：数量，
 price：单价，
 obj：小计对象
 return：总价
 */
function change_money(num,price,obj) {
    var money = (num * price).toFixed(2);
    $(obj).text(money+'元');
    return money;
}

/*add加
 num: 当前数量，
 obj:商品数量的input对象，
 max：最大数量，可用于限购
 return: num
 */
function add(num,obj,max) {
    if(typeof max == 'undefined'){
        max= 99999;
    }
    if(num < max){
        num += 1;
        $(obj).val(num.toString());
    }
    return num;
}

/*minus减
 num: 当前数量，
 obj:商品数量的input对象
 return: num
 */
function minus(num,obj) {
    if(num > 1){
        num -= 1;
        $(obj).val(num.toString());
    }
    return num;
}

/*计算单价
 num：数量，
 obj：小计对象
 return: 单价
 */
/*function get_price(num,obj) {
 var price = parseFloat($(obj).text()) / num;
 return price.toFixed(2);
 }*/
/*获取价格*/
function get_price(obj) {
    var price = parseFloat($(obj).text());
    return price.toFixed(2);
}

/*改变全部商品*/
function change_count() {
    var count = 0;
    $('.cart_list_td .col06 .num_show').each(function () {
        count += parseInt($(this).val());
        /*console.log($(this).val());*/
    });
    $('.total_count em').text(count);
    return count
}

/*ajax异步改变购物车数量*/
function change_cart_ajax(obj,num) {
    var url;
    url = $(obj).parents().attr('url');
    $.post(url,{nums:num},function (data) {
        if(data == 'error'){
            alert('修改失败！');
        }
    });
}

/*ajax异步删除*/
function delete_cart_ajax(obj) {
    var url;
    url = $(obj).attr('url');
    $.post(url,function (data) {
        if(data == 'error'){
            alert('删除失败！');
        }
        else {
            $(obj).parents('.cart_list_td').remove();
            var $obj = $(obj).parent().prevAll('.col01').children();
            if($obj.is(':checked')){
                $obj.prop('checked',false);
                change_sum($obj);
            }
            change_count();
        }
    });
}