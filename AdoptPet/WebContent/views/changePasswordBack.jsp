<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码||领宠后台</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/back.js"></script>
<style>
	.nav_ul .index_a{
		background: #c84200;
	}
	.two_ul li{
		background: none;
	}
	.con{
		 min-height: 440px;
	}
	.con_nav{
		border-bottom: 1px solid #865b79;;
	}
	form{
	    width: 50%;
	    margin: auto;
	    margin-top: 100px;
	}
	form span {
	    height: 40px;
	    width: 30%;
	    line-height: 40px;
	    text-align: center;
	    box-sizing: border-box;
	    border: 1.5px solid #09a4bd;
	    margin: 10px 0 10px;
	}
	span i{
		color: red;
		margin-right:10px;
	}
	form input {
	    padding-left: 5px;
	}
	input {
	    height: 40px;
	    width: 70%;
	    box-sizing: border-box;
	    border: 1.5px solid #007ca9;
	    border-left: 0px;
	    vertical-align: top;
	    margin: 10px 0 10px;
	}
	form .btn_change {
	    padding-left: 0;
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
	.wangjiPwd{
		display: none;
		color: red;
	}
</style>
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
</head>
<body>
	<%@ include file="../views/navAndMenu.jsp"%>
	<div class="con_right">
		<div class="con_nav">修改密码</div>
		<div class="con">
			<form method="post">
				<span><i>*</i>请输入旧密码：</span><input type="password" name="oldPwd" class="oldPwd" placeholder="请输入旧密码"></input>
				<span><i>*</i>请输入新密码：</span><input type="password" name="newPwd" class="newPwd" placeholder="请输入新密码"></input>
				<span><i>*</i>请输入确认密码：</span><input type="password" name="rePwd" class="rePwd" placeholder="请输入确认密码"></input>
				<input type="button" class="btn_change" value="修改密码" onclick="changePwd('<%=session.getAttribute("uAccount")%>')"> 
				<a href="<%=path%>/views/changePwd.jsp" class="wangjiPwd">忘记密码？</a>
			</form>
		</div>
	</div>
	<%@ include file="../views/mFooter.jsp"%>
</body>
</html>