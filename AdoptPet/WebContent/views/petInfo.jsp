<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改个人信息|领宠后台</title>
<script src="<%=request.getContextPath()%>/js/userInfo.js"></script>
<script src="<%=request.getContextPath()%>/js/back.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
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
.icon_pet{
	transform: rotate(-90deg);
}
.nav_item ul#ul_pet{
	display: block;
}
.two_ul li{
	background: none;
}
.pet_list_a{
	background: #c84200;
}
.con_nav{
	line-height: 50px;
	padding-left: 15px;
	color: #807979;
	border-bottom: 1px solid #d3b9b9;
}
h1{
	line-height: 50px;
	background-color: #00B1A9;
	color:#fff;
	padding-left: 15px;
	font-size: 18px;
}
.con{    
	margin: 10px;
    border: 1px solid #00b0a8;
    height:630px;
}
.pic_img{
	width: 20%;
	height: 95px;
}
.pic_img img{
	width: 100%;
	height: 100px;
}
.con span{
	background-color: #fbfbfb;
	display: inline-block;
	width: 20%;
	margin-bottom: 5px;
	text-align: center;
	height: 40px;
	line-height: 40px;
	border: 1px solid #d4d4d4;
	color: #6c6c6c;
	box-sizing:border-box;
}
.con input{
	vertical-align: top;
}
select,.con input{
	margin:0px;
	width:80%;
	height: 40px;
	line-height: 40px;
	box-sizing:border-box;
	border: 1px solid #d4d4d4;
	border-left: none;
	
}
div select{
	width: 20%;
	vertical-align: top;
	margin-left: -5px;
}
.con .btnsend{
	float: left;
    border-left: 1px solid #d4d4d4;
    width: 17%;
    background-color: #2ea2a2;
    margin-bottom:10px;
    border-radius: 35px;
}

.hidden{
	display: none;
}
form{
	margin:10px auto;
	width: 800px;
}
.up_span,input.pPic{
	margin-top: 10px;
}
.pDesc{
	vertical-align: top;
	box-sizing:border-box;
	border: 1px solid #d4d4d4;
	width: 80%;
	height: 90px;
	line-height: 30px;
	margin-bottom: 10px;
}
div.type_radio{
	display: inline-block;
	border: 1px solid #d4d4d4;	
	vertical-align: top;	
	box-sizing: border-box;	
	height: 40px;	
	margin-left: -5px;	
	width: 80%;
	color: #0c918b;
}
.type_radio input.pType{
	display:inline-block;
	width: 20px;
	vertical-align: middle;
	margin:0 10px;
}
input.uAccount{
	background-color: #e3e3e3;
}
span.desc_span{
	height: 90px;
	line-height: 90px;
}
#file_photo {
    width: 40px;
    height: 30px;
    margin-top: 15px;
    position: absolute;
}
.con span.file_name {
    margin-left: -5px;
    width: 40%;
    color: #ff3b3b;
}
input#uploadPic {
    width: 50px;
    cursor: pointer;
}
input.pPic {
    position: absolute;
    z-index: 1;
    opacity: 0;
}
</style>
<script>
$(document).ready(function(){
	$('.pDesc').val('${requestScope.petHash.pDesc}');
	console.log("333");
});	
</script>
</head>
<body>
<%@ include file="../views/navAndMenu.jsp"%>
<div class="con_right">
	<div class="con_nav">宠物管理&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;宠物列表&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;编辑</div>
	<div class="con">
		<h1>修改宠物信息</h1>
		<form method="post" enctype="multipart/form-data">
			<div id="picImg" class="pic_img"><img id="head_img" src="${requestScope.petHash.pPic}" alt="宠物图片"></img></div>
			<span class="up_span">上传图片：</span><input type="file" name="pPic" id="uploadPic" class="pPic" onchange="changHead(this)">
			<img src="/AdoptPet/images/fileIcon1.jpg" id="file_photo"><span class="file_name">请选择上传的图片</span>
			<br>
			<span>宠物的名字：</span><input type="text" name="pName" class="pName" value="${requestScope.petHash.pName}"><br>
			<span>宠物的状态：</span>
			<div class="type_radio">
				 <input type="radio" name="pType" class="pType" value="1" <c:if test="${requestScope.petHash.pType== 1}">checked="checked"</c:if>>送养待审核
   			 	 <input type="radio" name="pType" class="pType" value="2" <c:if test="${requestScope.petHash.pType== 2}">checked="checked"</c:if>>待领养
   			 	 <input type="radio" name="pType" class="pType" value="3" <c:if test="${requestScope.petHash.pType== 3}">checked="checked"</c:if>>领养待审核
   			 	 <input type="radio" name="pType" class="pType" value="4" <c:if test="${requestScope.petHash.pType== 4}">checked="checked"</c:if>>已领养
   			 	 <input type="radio" name="pType" class="pType" value="5" <c:if test="${requestScope.petHash.pType== 5}">checked="checked"</c:if>>其他
			</div>
			<br>
			<span>所属主人：</span><input type="text" name="uAccount" class="uAccount" readonly="readonly" value="${requestScope.petHash.uAccount}"><br>
			<span>宠物的种类：</span><input type="text" name="pKid" class="pKid" value="${requestScope.petHash.pKid}"><br>
			<span>宠物的年龄：</span><input type="text" name="pAge" class="pAge" value="${requestScope.petHash.pAge}"><br>
			<span>宠物的性别：</span>
			<select name="" class="select_sex"> 
			<c:choose>
					<c:when test="${requestScope.petHash.pSex == 1}">
						<option value="1">男孩</option> 
						<option value="0">女孩</option>
					</c:when>
					<c:otherwise>
						<option value="0">女孩</option> 
						<option value="1">男孩</option> 
					</c:otherwise>
				</c:choose>
			</select><br>
			<span class="desc_span">宠物的描述：</span><textarea name="pDesc" class="pDesc"></textarea><br>	
			<input type="button" value="保存" class="btnsend" onclick="changePetInfo(${requestScope.petHash.pId})">
		</form>
		<input type="text" name="hidden" class="hidden" value="0">
	</div>
</div>

<%@ include file="../views/mFooter.jsp"%>
</body>
</html>