<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%   
	String path = request.getContextPath(); 
	String uAccount = (String)session.getAttribute("uAccount");
%>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码|领宠网</title>
<link rel="stylesheet" href="<%=path%>/css/changePwd.css">
<link rel="stylesheet" href="<%=path%>/css/index.css">
<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=path%>/js/index.js"></script>
<style>
	.pwd{
		display:block;
		width: 50%;
		margin: auto;
		margin-top:100px;
	}
	.chang{
		width: 80%;
		margin: auto;
		box-sizing: border-box;
		padding-bottom: 100px;
		margin-top: 10px;
		background:none;
	}
	.wangjiPwd{
		color:red;
		margin-top: 20px;
		display: none;
	}
	div .btn_change {
	    color: #fff;
	    background-color: #43a29e;
	    width: 150px;
	    height: 40px;
	    line-height: 40px;
	    text-align: center;
	    display: inline-block;
	    font-size: 15px;
	    cursor: pointer;
	    border: 1px solid #609137;
	    border-radius: 20px;
	}
	span i{
		color:red;
		float:left;
		margin-left:10px;
	}
	.pwd input{
		padding-left: 5px;
	}
	.pwd .btn_change{
		padding-left: 0;
	}
	.rank_ul ul{
		display: inline-block;
	}
	.footer{
		position: fixed;
		bottom: 0px;
		left: 10%;
	}
	.footer p{
		color: #a5a4a4;
		font-size:16px;
	}
</style>
<%
	String uid = (String)session.getAttribute("uid");
	if(uid == null){
%>
<script>
	window.location.href ="/AdoptPet/views/login.jsp";
</script>
<%  } %>
<script>
function changePwd(){
	var uAccount = "<%=uAccount%>";
	var oldPwd = $(".oldPwd").val();
	var newPwd = $(".newPwd").val();
	var rePwd = $(".rePwd").val();
	$.ajax({
		type:"post",
        url:"/AdoptPet/pwd/changePassword",
	    data:{
	    	"uAccount":uAccount,
	    	"oldPwd":oldPwd,
	    	"newPwd":newPwd,
	    	"rePwd":rePwd
		},
		dataType:"json",
        beforeSend:function () {  
            //一般进行表单验证，在发送数据之前执行的函数
        	if(oldPwd=="" || oldPwd==null){
        		alert("旧密码不为空！");
        		return false;
        	}else if(newPwd=="" || newPwd==null){
        		alert("新密码不为空！");
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
          		alert("两次密码不一致！");
            }else if(result == 3){
          	  alert("新密码长度需在6~16之间且必须包括为字母和数字！");
            }else if(result == 4){
        		alert("旧密码输入有误");
        		$(".wangjiPwd").css('display','block');
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
<div class="logo"><img src="<%=path%>/images/logo.png"></div>
<div class="nav">
	<div class="nav_left">
		<ul>
			<li><a href="<%=path%>/views/index.jsp" class="selecter">首页</a></li>
			<li><a href="<%=path%>/pet/petPageByUnAdopt"  class="normal">收养宠物</a></li>
			<li><a href="<%=path%>/views/sendPet.jsp" class="normal">送养宠物</a></li>
			<li><a href="<%=path%>/searcher/SearcherPage"  class="normal">寻物启事</a></li>
				<li><a href="<%=path%>/leaving/getLeavingMessage"  class="normal">网站留言</a></li>
		</ul>
	</div>
	<div class="nav_right">
		<div class="rank_ul">
			<ul>
				<li><img src="${sessionScope.userHead}" class="head"><span>${sessionScope.uAccount}</span><i><img class="arrow" src="../images/arrow.png"></i></li>
				<li><a href="<%=path%>/userInfo/queryUserInfo">个人信息</a></li>
				<li><a href="<%=path%>/views/changePassword.jsp">修改密码</a></li>
				<li><a href="<%=path%>/petAdopt/petApplyRecord">申请记录</a></li>
				<li><a href="<%=path%>/views/login.jsp">退出登录</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="chang">
		<div class="pwd">
			<h1>修改密码</h1>  
			<span><i>*</i>请输入旧密码：</span><input type="password" name="oldPwd" class="oldPwd" placeholder="请输入旧密码"></input>
			<span><i>*</i>请输入新密码：</span><input type="password" name="newPwd" class="newPwd" placeholder="请输入新密码"></input>
			<span><i>*</i>请输入确认密码：</span><input type="password" name="rePwd" class="rePwd" placeholder="请输入确认密码"></input>
			<input type="button" class="btn_change" value="修改密码" onclick="changePwd()"> 
			<a href="<%=path%>/views/changePwd.jsp" class="wangjiPwd">忘记密码？</a>
		</div>
</div>
<div class="footer">
		<p>
			© 2020 lingchong
			<span>公益网站</span>
			<span>版权声明</span>
		</p>
	</div>
</body>
</html>