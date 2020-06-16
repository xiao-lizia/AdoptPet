<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
	String path="";
%>
<%
	path= (String) request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>注册|领宠网</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/login.css">
<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/login.js"></script>
<script>

</script>
</head>
<body>

	<div class="content">
		<span id="u_login" class="checked">
			用户注册
		</span>
		<form class="login" method="post">
			<input type="text" class="username" name="username" placeholder="用户名">
			<input type="password" class="password" name="password" placeholder="密码">
			<input type="password" class="verPassword" name="verPassword" placeholder="确认密码">
			<input type="text" class="inputCode" placeholder="请输入验证码"></input>
			<img src="<%=path%>/verCode/getImgVerCode" alt="验证码" title="点击获取新验证码" id="imgVerCode" class="imgCode" onclick="changeVerCode()">
			<input type="button" class="subLogin" value="注册" onclick="registerBtn()">
			<a href="<%=path%>/views/login.jsp">返回登录</a>
		</form>
	</div>
</body>
</html>