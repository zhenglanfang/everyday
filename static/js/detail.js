/**
 * Created by zheng on 17-10-6.
 */

$(function () {
    var num,$input_obj,price,$total_obj,sum;
    //货存
    sum = parseInt($('.goods_num span em').text());
    //数量文本框对象
    $input_obj = $('.num_add .num_show');
    //单价
    price = parseFloat($('.prize_bar .show_pirze em').text());
    //总价
    $total_obj = $('.total em');
    /*如果库存为0,让相关标签不可点击*/
    if (sum <= 0){
        $input_obj.val('0');
        change_money(parseInt($input_obj.val()),price,$total_obj);
        $('.num_add .add,.minus').removeAttr('href');
        $('.operate_btn .add_cart,.buy_btn').removeAttr('href');
        $input_obj.attr('disabled',true);
        $('.goods_num span em').css({"color": "red","font-weight": "bold"});
        return false
    }
    change_money(parseInt($input_obj.val()),price,$total_obj);

    $('.num_add .add,.minus').click(function () {
        num = parseInt($input_obj.val());
        var num2;
        if ($(this).context.name == 'add') {
            num2 = add(num, $input_obj,sum);
        }
        else {
            num2 = minus(num,$input_obj);
        }
        change_money(num2,price,$total_obj)
    });

    /*数量-input事件,con1:修改过之前的数量,输入input*/
    var con1;
    $input_obj.on('focus change',function (event) {
        if(event.type =='focus'){
            con1 = $(this).val();
        }
        if(event.type =='change'){
            var con2= $(this).val();
            if(/^[1-9][0-9]{0,4}$/.test(con2)){
                if(parseInt(con2) > sum){
                    $(this).val(sum);
                    change_money(sum,price,$total_obj);
                }
                else {
                    change_money(parseInt(con2),price,$total_obj);
                }
            }
            else {
                $(this).val(con1);
            }
        }
    });

    /*加入购物车*/
    site();
    $('.operate_btn .add_cart').click(function (event) {
        var url = $(this).attr('url');
        var count = parseInt($input_obj.val());
        $.post(url,{add_count:count},function (data) {
            if(/^\d+$/.test(data)){
                /*购物车飞入*/
                var img_src = $('.goods_detail_pic img').attr('src');
                var flag = true;
                img_fly(img_src,flag,event);
                /*修改数量*/
                $('.shopping_cart .count').text(data)
            }
            else if (data != 'error'){
                //当前页面的url
                console.log(window.location.href)
                //设置cookie
                document.cookie = "url="+window.location.href+";path=/";
//                console.log(document.cookie)
                window.location.href = '/login/';
            }
        });

    });
});
