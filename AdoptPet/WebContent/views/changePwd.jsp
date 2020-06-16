<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! String path="";
%>
<% 
	path=request.getContextPath(); 
%>
<html>
<head>
<meta charset="UTF-8">
	<title>忘记密码|领宠网</title>
	<link rel="stylesheet" href="<%=path%>/css/changePwd.css">
	<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
	<script>
	
	/*验证用户是否存在,并且是否设置密保*/
	function verUser(){
				var uAccount = $(".uAccount").val();
				$.ajax({
					type:"post",
			        url:"/AdoptPet/pwd/isExistMibao",
				    data:{
				           "uAccount":uAccount
					},
					dataType:"json",
			        beforeSend:function () {  
			            //一般进行表单验证，在发送数据之前执行的函数
			        	if(uAccount=="" || uAccount==null){
			        		alert("用户名不为空");
			        		return false;
			        	}
			            return true;
			        },
			        success:function (result) {    //返回成功时的执行函数一般进行页面跳转，具体如下
			           if (result[0] == "1"){
			        	   $('.question').val(result[1]);
			        	   $(".isExist").css('display','none');
			        	   $(".mibao").css('display','block');
			           }else if(result[0] == "2"){
			        	   alert("该用户没有设置密保，无法进行修改密码！！"); 
			        	   window.location.href ="/AdoptPet/views/index.jsp";
			           }
			           else{
			               alert("该用户不存在！"); 
			           }

			        },
			        error :function () {      //返回失败时的执行函数
			            alert("用户信息提交失败");
			        }
				})
			}
	
	/*验证密保是否正确*/
	function verMibao(){
		var uAccount = $(".uAccount").val();
		var uQuestion = $(".question").val();
		var uAnswer = $(".answer").val();
		$.ajax({
			type:"post",
	        url:"/AdoptPet/pwd/isTrueByMibao",
		    data:{
		    	"uAccount":uAccount,
		        "uQuestion":uQuestion,
		        "uAnswer":uAnswer
			},
			dataType:"json",
	        beforeSend:function () {  
	            //一般进行表单验证，在发送数据之前执行的函数
	        	if(uAnswer=="" || uAnswer==null){
	        		alert("密保答案不为空！");
	        		return false;
	        	}
	            return true;
	        },
	        success:function (isTrue) {    //返回成功时的执行函数一般进行页面跳转，具体如下
	           if (isTrue == 1){
	        	   $(".mibao").css('display','none');
	        	   $(".pwd").css('display','block');
	           }else if(isTrue == 0){
	        	   $(".answer").val('');
	        	   $(".verMessage").css('display','block');
	           }
	        },
	        error :function () {      //返回失败时的执行函数
	            alert("用户信息提交失败");
	        }
		})
	}
	/*修改密码*/
	function changePwd(){
		console.log("1a");
		var uAccount = $(".uAccount").val();
		var newPwd = $(".newPwd").val();
		var rePwd = $(".rePwd").val();
		$.ajax({
			type:"post",
	        url:"/AdoptPet/pwd/changePwd",
		    data:{
		    	"uAccount":uAccount,
		    	"newPwd":newPwd,
		    	"rePwd":rePwd
			},
			dataType:"json",
	        beforeSend:function () {  
	            //一般进行表单验证，在发送数据之前执行的函数
	        	if(newPwd=="" || newPwd==null){
	        		alert("密码不为空！");
	        		return false;
	        	}else if(rePwd=="" || rePwd==null){
	        		alert("确认密码不为空！");
	        		return false;
	        	}else  if(rePwd != newPwd){
	        		alert("两次密码不一致！");
	        		$(".newPwd").val("");
	        		$(".rePwd").val("");
	        		return false;
	        	}
	            return true;
	        },
	        success:function (result) {    //返回成功时的执行函数一般进行页面跳转，具体如下
	        	if(result == 0){
		        	  alert("密码修改失败，请重试！");
	            }else if (result == 1){
        	    	alert("密码修改成功！");
        	    	window.location.href ="/AdoptPet/views/login.jsp";
	            }else if(result == 2){
	        		alert("两次密码不一致！！");
	           	}else if(result == 3){
	        	  	alert("密码长度需在6~16之间且必须包括为字母和数字！");
	           	}
	        },
	        error :function () {      //返回失败时的执行函数
	            alert("密码修改失败");
	        }
		})
	}
	</script>
	
</head>
<body>
	<div class="chang">
		<h1>修改密码</h1>  
		<div class="isExist">
			<p>请输入用户名，进行验证</p>
			<span>用户名：</span><input type="text" name="uAccount" class="uAccount"></input>
			<input type="button" class="btn_change" value="用户验证" placeholder="请输入用户名" onclick="verUser()"> 
		</div>
		<div class="mibao">
			<p>请回答密保问题，进行密保验证</p>
			<span>密保问题：</span><input type="text" name="question" class="question" readonly="readonly"></input>
			<span>密保答案：</span><input type="text" name="answer" class="answer" placeholder="请输入密保答案">
			<p class="verMessage">密保验证失败，请重试</p>
			<input type="button" class="btn_change" value="密保验证" onclick="verMibao()"> 
		</div>
		<div class="pwd">
			<p>密保验证成功，请进行修改密码</p>
			<span>请输入新密码：</span><input type="password" name="newPwd" class="newPwd" placeholder="请输入新密码"></input>
			<span>请输入确认密码：</span><input type="password" name="rePwd" class="rePwd" placeholder="请输入确认密码"></input>
			<input type="button" class="btn_change" value="修改密码" onclick="changePwd()"> 
		</div>
	</div>
</body>
</html>