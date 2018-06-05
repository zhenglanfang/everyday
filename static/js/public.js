/**
 * Created by Administrator on 2017/8/27.
 */

//正则检验
function check_reg(reg,str) {
    return reg.test(str)
}

//去除前后空格,默认有trim方法
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g,'')
};

//去除左边空格
String.prototype.ltrim = function () {
    return this.replace(/^\s*/g,'')
};

//去除右边空格
String.prototype.rtrim = function () {
    return this.replace(/\s*$/g,'')
};

//搜索框事件
$(function () {
    $('.search_con form').submit(function () {
        var keywd = $(this).find('.input_search').val();
        if (keywd.trim() == ''){
            return false
        }
        else
            return true
    })
});

//获取XMLHttpRequest 对象
function xmlhttpRequest(){
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp
}

//ajax封装函数，xmlhttp:XMLHttpRequest 对象,func：处理响应的函数，url：请求的地址，method：请求方式，param：请求参数
/*function myajax(xmlhttp,func,url,method="GET",param="") {
    xmlhttp.onreadystatechange = func;
    xmlhttp.open(method,url,true);
    if (method == "POST"){
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    }
    xmlhttp.send(param);
}*/

//关闭窗口
function custom_close(){
    if (confirm("您确定要关闭本页吗？")) {
        $.get("/logout/",function () {
            window.open("","_parent","");
            window.opener = window;
            window.close();
        });
    }
    else {
        return false;
    }
}

//购物车飞入动画效果
/*2.终点：offset在获取初始值时，会受到滚动条的影响，当有上下滚动条或者左右滚动条时，offset的位置就会相应的偏大*/
//$(window).scrollTop(0);
/*$(window).resize(site);
function site() {
    $(window).scrollTop(0);
    offset=$('#end').offset();

}
/!*3.起点：受到scoll的影响，所以我们实际的起飞位置应该是page的值减去scoll的值*!/
var scrollTop = 0;
$(window).scroll(function() {
    scrollTop = $(window).scrollTop();
});

function img_fly(img_src,flag,event) {
    // var img = addcar.parent().find('img').attr('src');
    var flyer = $('<img class="u-flyer" src="'+img_src+'">');
    flyer.fly({
        start: {
            left: event.pageX, //开始位置（必填）#fly元素会被设置成position: fixed
            top: event.pageY - scrollTop  //开始位置（必填）
        },
        end: {
            left: offset.left+32, //结束位置（必填）
            top: offset.top+16, //结束位置（必填）
            width: 0, //结束时宽度
            height: 0 //结束时高度
        },

        /!*speed: 1.1, //越大越快，默认1.2
         vertex_Rtop:100, //运动轨迹最高点top值，默认20  *!/

        onEnd: function(){ //结束回调
            if(flag){
                $("#msg").show().animate({width: '250px'}, 500).fadeOut(1500); //提示信息
            }
            this.destory(); //移除dom
        }
    });
}*/
