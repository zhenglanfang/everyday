/**
 * Created by zheng on 17-10-14.
 */

$(function () {
    $('.sort_bar a').click(function () {
        $('.sort_bar .active').removeClass('active');
        $(this).addClass('active');
    });
    //得到offset
    site();
    $('.goods_list li .add_goods').click(function (event) {
        var url = $(this).attr('url');
        var add = $(this);
        var click_evetnt = event;
        $.post(url,{add_count:1},function (data) {
            if(/^\d+$/.test(data)){
                /*购物车飞入*/
                var img_src = $(add).parents('li').find('img').attr('src');
                var flag = true;
                img_fly(img_src,flag,click_evetnt);
                $('.shopping_cart .count').text(data)
            }
            else if (data != 'error'){
                 //当前页面的url
                //console.log(window.location.href);
                //设置cookie
                document.cookie = "url="+window.location.href+";path=/";
                //console.log(document.cookie)
                window.location.href = '/login/';
            }
        })
    });
});