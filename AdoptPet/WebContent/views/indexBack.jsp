<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页|领宠后台</title>
<%
	try{
		String uid = (String)session.getAttribute("uid");
		boolean isAdmin = (boolean)session.getAttribute("isAdmin");
		if(uid == null || isAdmin==false){
%>
		<script>
			window.location.href ="/AdoptPet/views/login.jsp";
		</script>
<%
		}
	}catch(NullPointerException e){
%>
	<script>
		window.location.href ="/AdoptPet/views/login.jsp";
	</script>
<%
	}
%>
<style>
	.nav_ul .index_a{
		background: #c84200;
	}
	.two_ul li{
		background: none;
	}
	.con{
		min-height: 500px;
		background: url("../images/indexBackBg.png");
		background-size:100% 100%;
	}
	.con_nav{
		line-height: 50px;
		padding-left: 15px;
		color: #807979;
		border-bottom: 1px solid #d3b9b9;
	}
</style>
</head>
<body>
<%@ include file="../views/navAndMenu.jsp"%>
<div class="con_right">
	<div class="con_nav">首页</div>
	<div class="con"></div>
</div>
<%@ include file="../views/mFooter.jsp"%>
</body>
</html>