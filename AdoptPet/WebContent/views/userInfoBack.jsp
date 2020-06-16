<%@page import="org.liliting.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改个人信息|领宠后台</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/userInfoBack.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/userInfo.js"></script>
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
<script>
	function resetPwd(uAccount){
		$.ajax({
			type:"post",
	        url:"/AdoptPet/pwd/resetPwd",
	        data:{
	        	"uAccount":uAccount
	        },
			dataType:"json",
	        success:function (result) {    //返回成功时的执行函数一般进行页面跳转，具体如下
	           if (result){
	        	   alert("密码重置完成!");
	
	           }else {
	        	   alert("密码重置失败！");
	        	}
	
	        },
	        error :function () {      //返回失败时的执行函数
	            alert("密码重置失败");
	        }
		});
	}
</script>
<body>
<%@ include file="../views/navAndMenu.jsp"%>
<div class="con_right">
	<div class="con_nav">导航栏首页&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;个人信息</div>
	<div class="con">
		<h1>修改个人信息</h1>
		<form method="post" enctype="multipart/form-data">
			<div id="userHead" class="user_head">
				<img id="head_img" src="${requestScope.user.uPic}" alt="用户头像"></img>
				<span class="tishi">注意：密保用于忘记密码验证，没有设置密保无法找回密码。</span>
				<input type="button" class="reset" id="reset" value="密码重置" onclick="resetPwd('${requestScope.user.uAccount}')">
			</div>
			<span>更换头像：</span><input type="file" name="uPic" id="uploadPic" class="pPic" onchange="changHead(this)">
			<img src="/AdoptPet/images/fileIcon1.jpg" id="file_photo"><span class="file_name">请选择上传的图片</span>
			<br>
			<span>用户名：</span><input type="text" name="uAccount" class="uAccount" value="${requestScope.user.uAccount}" readonly="readonly"><br>
			<span>真实姓名：</span><input type="text" name="uName" class="uName"  value="${requestScope.user.uName}"><br>
			<span>密保问题：</span><input type="text" name="uQuestion" class="uQuestion" value="${requestScope.user.uQuestion}"><br>
			<span>密保答案：</span><input type="text" name="uAnswer" class="uAnswer" value="${requestScope.user.uAnswer}"><br>
			<span>手机号码：</span><input type="text" name="uPhone" class="uPhone" value="${requestScope.user.uPhone}"><br>
			<span>性别:</span>
			<select name="" class="select_sex"> 
				<c:choose>
					<c:when test="${requestScope.user.uSex == 1}">
						<option value="1">男孩</option> 
						<option value="0">女孩</option>
					</c:when>
					<c:when test="${requestScope.user.uSex == 0}">
						<option value="0">女孩</option> 
						<option value="1">男孩</option> 
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				</select><br>
			<span>家庭住址：</span><input type="text" name="uAddress" class="uAddress"  value="${requestScope.user.uAddress}"><br>
			<input type="button" value="保存" class="btnsend" onclick="changeInfo(${requestScope.user.uId},1)">
		</form>
		<input type="text" name="hidden" class="hidden" value="0">
	</div>
</div>

<%@ include file="../views/mFooter.jsp"%>
</body>
</html>