/**
 * Created by Administrator on 2017/9/3.
 */
$(function () {
    var recipients=false;
    var add = false;
    var cel = false;
    var email = false;
    $('.recipients').focus();
    $('.recipients,.add,.cel,.email').focus(function () {
       $(this).next().text('');
    });
    $('.recipients').blur(function () {
        if(!isNull($(this))) {
            recipients = false;
            return;
        }
        else {
            recipients = true;
        }
    });
    $('.add').blur(function () {
        if(!isNull($(this))) {
            add = false;
            return;
        }
        else {
            add = true;
        }
    });
    $('.cel').blur(function () {
        if(!isNull($(this))){
            cel = false;
            return;
        }
        var reg = /^1[34578]\d{9}$/; //手机号
        if(check_reg(reg,$(this).val())){
            cel = true;
        }
        else {
            cel = false;
            $(this).next().text('手机号格式错误！')
        }
    });
    $('.email').blur(function () {
        if(!isNull($(this))){
            email = false;
            return;
        }
        var reg = /\d{6}$/; //邮编
        if(check_reg(reg,$(this).val())){
            email = true;
        }
        else {
            email = false;
            $(this).next().text('邮编格式错误！')
        }
    });
    $('.info_submit').click(function () {
        $('.recipients,.add,.cel,.email').blur();
        if(recipients == true && cel == true && add== true && email == true)
		{
            // alert('添加成功！');
			return true;
		}
		else
		{
			return false;
		}
    });
});

function isNull(obj) {
    if($(obj).val()==''){
        $(obj).next().text('不能为空！');
        return false;
    }
    else {
        return true;
    }
}
