<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
	String path="";
%>
<%
	path= (String) request.getContextPath();
	session.removeAttribute("uid");
	session.setAttribute("isAdmin", false);
%>

<html>
<head>
<meta charset="UTF-8">
<title>登录|领宠网</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/login.css">
<script src="<%=path%>/js/DD_belatedPNG_0.0.8a-min.js"></script>
<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=path%>/js/login.js"></script>
</head>
<body>
	<div class="content">
		<span id="u_login" class="checked">
			用户登录
		</span>
		<span id="m_login" class="unchecked">
			管理员登录
		</span>
		<form class="login" method="post">
			<input type="text" class="username" name="username" placeholder="用户名">
			<input type="password" class="password" name="password" placeholder="密码">
			<input type="text" class="inputCode" name="inputCode" placeholder="请输入验证码"></input>
			<img src="<%=path%>/verCode/getImgVerCode" alt="  " title="点击获取新验证码" id="imgVerCode" class="imgCode" onclick="changeVerCode()">
			<br><a href="<%=path%>/views/register.jsp">还没注册？</a>|<a href="<%=path%>/views/changePwd.jsp">忘记密码？</a><input type="button" class="subLogin" value="登  录" onclick="loginSubmit()">
			<br><a href="<%=path%>/views/index.jsp" class="visitor">游客身份访问</a>
		</form>
	</div>
</body>
</html>