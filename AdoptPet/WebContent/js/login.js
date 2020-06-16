$(function(){
    $("span").each(function(){
        $(this).click(function(){
            $("span").addClass("unchecked").removeClass("checked");
            $(this).addClass("checked").removeClass("unchecked");
        })
     
    });
});
function changeVerCode(){
	var img = document.getElementById("imgVerCode");
	img.src="/AdoptPet/verCode/getImgVerCode" + "?=" +Math.random();
}
var identify = 0;
function loginSubmit(){
	if($("#u_login").hasClass("checked")){
		identify = 0;
   	}else{
   		identify = 1;
   	}
	var username = $(".username").val();
	var password = $(".password").val();
	var inputCode = $(".inputCode").val();
	$.ajax({
		type:"post",
        url:"/AdoptPet/login/userLoign",
	    data:{
	           "username":username,
	           "password":password,
	           "identify":identify,
	           "inputCode":inputCode
		},
		dataType:"json",
        beforeSend:function () {  
            //一般进行表单验证，在发送数据之前执行的函数
        	if(username=="" || username==null){
        		alert("用户名不为空");
        		return false;
        	}else if(password=="" || password==null){
        		alert("密码不为空");
        		return false;
        	}else  if(inputCode=="" || inputCode==null){
        		alert("验证码不为空");
        		return false;
        	}
            return true;
        },
        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
           if (ajaxResult.success){
           		if(ajaxResult.identify == 1){
           			window.location.href ="/AdoptPet/views/indexBack.jsp";
           		}else
           			window.location.href ="/AdoptPet/views/index.jsp";
           }
           else {
        	   		changeVerCode();
        	  		alert(ajaxResult.message);
        	   }

        },
        error :function () {      //返回失败时的执行函数
        	changeVerCode();
            alert("用户信息提交失败");
        }
	})
}

function registerBtn(){
	var username = $(".username").val();
	var password = $(".password").val();
	var verPassword = $(".verPassword").val();
	var inputCode = $(".inputCode").val();
	$.ajax({
		type:"post",
        url:"/AdoptPet/regist/userRegist",
	    data:{
	           "username":username,
	           "password":password,
	           "verPassword":verPassword,
	           "inputCode":inputCode
		},
		dataType:"json",
        beforeSend:function () {  
            //一般进行表单验证，在发送数据之前执行的函数
        	//一般进行表单验证，在发送数据之前执行的函数
        	if(username=="" || username==null){
        		alert("用户名不为空");
        		return false;
        	}else if(password=="" || password==null){
        		alert("密码不为空");
        		return false;
        	}else  if(verPassword=="" || verPassword==null){
	    		alert("确认密码不为空");
	    		return false;
	    	}else  if(password!=verPassword){
	    		alert("两次密码不一致");
	    		return false;
	    	}else  if(inputCode=="" || inputCode==null){
	    		alert("验证码不为空");
	    		return false;
	    	}
        	return true;
        },
        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
        	if (ajaxResult.success){
        		alert(ajaxResult.message);
        		window.location.href ="/AdoptPet/views/login.jsp";
            }
            else {
            	changeVerCode();
            	alert(ajaxResult.message);
            }
        },
        error :function () {      //返回失败时的执行函数
        	changeVerCode();
            alert("用户注册信息提交失败");
        }
	})
	
}


DD_belatedPNG.fix('div, ul, img, li, input,p,ul,ol,h1,h2,h3,a,span,i'); 