/**
 * Created by zheng on 17-10-15.
 */

/*购物车飞入动画效果*/

//使用之前需要引入jquery.fly.min.js,if lte IE 9,引入requestAnimationFrame.js
//页面改变是触发的resize()事件中，重新获取offset属性
$(window).resize(site);

/*
 offset在获取初始值时，会受到滚动条的影响，
 当有上下滚动条或者左右滚动条时，offset的位置就会相应的偏大
 让页面的scoll值为0，并且每次改变页面也归置为0
 */
function site() {
    $(window).scrollTop(0);
    offset=$('#end').offset();
}

//实际的起飞位置应该是page的值减去scoll的值
var scrollTop = 0;
$(window).scroll(function() {
    scrollTop=$(window).scrollTop();
});

//起飞：img_src:图片的路径，event：事件
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

//        speed: 1.5, //越大越快，默认1.2
//        vertex_Rtop:100, //运动轨迹最高点top值，默认20

        onEnd: function(){ //结束回调
            if(flag){
                $("#msg").show().animate({width: '250px'}, 500).fadeOut(1500); //提示信息
            }
            this.destory(); //移除dom
        }
    });
}


