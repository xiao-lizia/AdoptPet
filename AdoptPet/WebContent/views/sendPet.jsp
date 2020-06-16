<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! String path=""; %>
<% path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<title>送养|领宠网</title>
	<link rel="stylesheet" href="../css/sendPet.css">
	<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
	<script src="<%=path%>/js/sendPet.js"></script>
<script src="<%=path%>/js/index.js"></script>
	<%
		String uid = (String)session.getAttribute("uid");
		if(uid == null){
	%>
	<script>
		window.location.href ="/AdoptPet/views/login.jsp";
	</script>
	<%  } %>
</head>
<body>
	<div class="logo"><img src="<%=path%>/images/logo.png"></div>
	<div class="nav">
		<div class="nav_left">
			<ul>
				<li><a href="<%=path%>/views/index.jsp" class="normal">首页</a></li>
				<li><a href="<%=path%>/pet/petPageByUnAdopt"  class="normal">收养宠物</a></li>
				<li><a href="<%=path%>/views/sendPet.jsp" class="selecter">送养宠物</a></li>
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
	<div class="content">
		<h1>送养宠物</h1>
		<form method="post" enctype="multipart/form-data">
			<span><i>*</i>宠物的名字：</span><input type="text" name="pName" class="pName"><br>
			<span><i>*</i>宠物的种类：</span><input type="text" name="pKid" class="pKid"><br>
			<span><i>*</i>宠物的年龄：</span><input type="text" name="pAge" class="pAge"><br>
			<span><i>*</i>宠物的性别：</span>
			<select name="" class="select_sex"> 
			<option value="1">男孩</option> 
			<option value="0">女孩</option> 
			</select><br>
			<span><i>*</i>宠物的描述：</span><input type="text" name="pDesc" class="pDesc"><br>
			<span><i>*</i>宠物的图片：</span><input type="file" name="picFile" id="upload_pic" class="pPic" onchange="uploadPic()">
			<img src="<%=path%>/images/fileIcon1.jpg" id="file_photo"><span class="file_name">请选择上传的图片</span>
			<br>
			<input type="button" value="提交" class="btnsend" onclick="sendPet()">
		</form>
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