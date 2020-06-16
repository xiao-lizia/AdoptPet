<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! String p = ""; %>
<% p = request.getContentType(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>添加宠物|领宠后台</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/addPet.css">
	<script src="<%=request.getContextPath()%>/js/sendPet.js"></script>
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
	<div class="con_nav">首页&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;宠物管理&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;添加宠物</div>
	<div class="con">
		<h1>添加宠物</h1>
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
			<span><i>*</i>宠物的图片：</span><input type="file" name="picFile" id="upload_pic" class="pPic" onchange="uploadPic()"><br>
			<input type="button" value="提交" class="btnsend" onclick="addPet()">
		</form>
	</div>
</div>

<%@ include file="../views/mFooter.jsp"%>
</body>
</html>