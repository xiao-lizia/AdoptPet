<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>创建用户|领宠后台</title>
<%
	String uid = (String)session.getAttribute("uid");
	boolean isAdmin = (boolean)session.getAttribute("isAdmin");
	if(uid == null || isAdmin == false){
%>
<script>
	window.location.href ="/AdoptPet/views/login.jsp";
</script>
<%  } %>
<script src="../js/back.js"></script>
<style>
	.icon_user{
		transform: rotate(-90deg);
	}
	.nav_item ul#ul_user{
		display: block;
	}
	.two_ul li{
		background: none;
	}
	.create_user_a{
		background: #c84200;
	}
	.con{
		min-height: 350px;
		border: 1px solid #299366;
		margin: 10px 20px 50px 20px; 
	}
	.con_nav{
		line-height: 50px;
		padding-left: 15px;
		color: #807979;
		border-bottom: 1px solid #d3b9b9;
	}
	form{
		width: 300px;
		margin: auto;
		margin-top: 20px;
	}
	h1{
		line-height: 50px;
		background-color: #00B1A9;
		color:#fff;
		padding-left: 15px;
		font-size: 18px;
	}
	.con input{
		display: block;
		width: 300px;
		height: 40px;
		margin: 10px 0 10px 0;
	}
	.username{
		background: url(../images/username.png) no-repeat;
		padding-left: 30px;
		background-position: left;
		box-sizing: border-box;
	}
	.password{
		background: url(../images/password.png) no-repeat;
		padding-left: 30px;
		background-position: left;
		box-sizing: border-box;
	}
	.con input.btnInput{
		margin-top: 50px;
		width: 120px;
	    display: inline-block;
	    background-color: #2ea2a2;
	    color: #fff;
	    border: 1.5px solid #3cb866;
	    font-size: 16px;
	    height: 35px;
		border-radius: 35px;
	}
</style>
</head>
<body>
	<%@ include file="../views/navAndMenu.jsp"%>
	<div class="con_right">
		<div class="con_nav">首页&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;用户管理&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;创建用户</div>
		<div class="con">
			<h1>创建用户</h1>
			<form class="login" method="post">
				<input type="text" class="username" name="username" placeholder="用户名">
				<input type="password" class="password" name="password" placeholder="密码">
				<input type="password" class="password" id="verPassword" name="verPassword" placeholder="确认密码">
				<input type="button" class="btnInput" value="提交" onclick="addUser()">
				<input type="button" class="btnInput" value="取消" onclick="addUserClear()">
			</form>
		</div>
	</div>
	
<%@ include file="../views/mFooter.jsp"%>
</body>
</html>