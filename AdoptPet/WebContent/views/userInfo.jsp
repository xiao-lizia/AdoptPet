<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	String uid = (String)session.getAttribute("uid");
	if(uid == null){
%>
<script>
	window.location.href ="/AdoptPet/views/login.jsp";
</script>
<%  } %>
<%! String path="";%>
<%
	path= (String) request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
	<title>个人信息|领宠网</title>
	<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="../css/userInfo.css">
	<script src="../js/userInfo.js"></script>
	<script src="../js/index.js"></script>
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
					<li><img src="${sessionScope.userHead}" class="head"><span>${sessionScope.uAccount}</span><i><img class="arrow" src="<%=path%>/images/arrow.png"></i></li>
					<li><a href="<%=path%>/userInfo/queryUserInfo">个人信息</a></li>
					<li><a href="<%=path%>/views/changePassword.jsp">修改密码</a></li>
					<li><a href="<%=path%>/petAdopt/petApplyRecord">申请记录</a></li>
					<li><a href="<%=path%>/views/login.jsp">退出登录
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="content">
		<h1>修改个人信息</h1>
		<form method="post" enctype="multipart/form-data">
			<div id="userHead" class="user_head">
				<img id="head_img" src="${requestScope.user.uPic}" alt="用户头像"></img>
				<span class="tishi">注意：密保用于忘记密码验证，没有设置密保无法找回密码。</span>
			</div>
			<span>更换头像：</span><input type="file" name="uPic" id="uploadPic" class="pPic" onchange="changHead(this)">
			<img src="<%=path%>/images/fileIcon1.jpg" id="file_photo"><span class="file_name">请选择上传的图片</span>
			<br>
			<span>用户名：</span><input type="text" name="uAccount" class="uAccount" value="${requestScope.user.uAccount}" readonly="readonly"><br>
			<span><i>*</i>真实姓名：</span><input type="text" name="uName" class="uName"  value="${requestScope.user.uName}"><br>
			<span>密保问题：</span><input type="text" name="uQuestion" class="uQuestion" value="${requestScope.user.uQuestion}" placeholder="密保用于忘记密码时需要进行的验证"><br>
			<span>密保答案：</span><input type="text" name="uAnswer" class="uAnswer" value="${requestScope.user.uAnswer}"><br>
			<span><i>*</i>手机号码：</span><input type="text" name="uPhone" class="uPhone" value="${requestScope.user.uPhone}"><br>
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
			<span><i>*</i>家庭住址：</span><input type="text" name="uAddress" class="uAddress"  value="${requestScope.user.uAddress}"><br>
			<input type="button" value="保存" class="btnsend" onclick="changeInfo(${requestScope.user.uId},0)">
			
		</form>
		<input type="text" name="hidden" class="hidden" value="0">
	</div>
	<div class="clear"></div>
	<div class="footer">
		<p>
			© 2020 lingchong
			<span>公益网站</span>
			<span>版权声明</span>
		</p>
	</div>
</body>
</html>