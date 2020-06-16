<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%! String path="";
%>
<% 
	path=request.getContextPath(); 
%>
<html>
<head>
<meta charset="UTF-8">
	<title>宠物详细信息|领宠网</title>
	<link rel="stylesheet" href="<%=path%>/css/searcher.css">
	<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
	<script src="<%=path%>/js/index.js"></script>
	<style>
		.footer{
			width:80%;
			height: 60px;
			line-height: 60px;
			text-align: center;
			border-top: 2px solid #d2d2d2;
			margin:auto;
			color: #a5a4a4;
			font-family: "宋体";
			background-color:rgba(255,255,255,0.5);
			left:10%;
			position: fixed;
			bottom: 0;
		}
		.footer span{
			margin-left: 1em;
		}
		.content{
			width: 60%;
			box-sizing: border-box;
			background-color: #f0f0f0;
			padding-top: 5px;
			padding-bottom: 20px;
		}
		h1{
			font-size: 20px;
			margin:10px 0 10px 20px;
		}
		.applyNum{
			float: right;
		}
		.user_info{
			width: 80%;
		}
		.applyNum strong{
			color:red;
		}
		.btnBack{
			width: 150px;
			height: 30px;
			border: 1px solid #099b72;
			color: #fffcfc;
			text-align: center;
			background-color: #80bc00;
			border-radius: 30px;
			margin: 20px 0 0 20%;
			cursor: pointer;
			line-height: 30px;
		}
		.adopt{
			width: 80px;
			height: 30px;
			float: right;
			clear: right;
			color: #fff;
			font-size: 0.9em;
			text-shadow: 1px 1px 3px #333;
			background: #80bc00;
			margin-right: 40px;
			cursor: pointer;
		}
		.pet_pic{
			width: 100%;

		}
	</style>
	<script>
		$(document).ready(function(){
			<%
				String uid = (String)session.getAttribute("uid");
				if(uid==null){
			%>
			$(".rank_ul ul").css('display','none');
			$(".inden").css('display','block');
			<%
				}else{
			%>
			$(".rank_ul ul").css('display','block');
			$(".inden").css('display','none');
			<%
				}
			%>
		});
	</script>
	<script>
		$.ajax({
			type:"post",
		    url:"/AdoptPet/showLogin/isLogin",
		    success:function (result) {    //返回成功时的执行函数一般进行页面跳转，具体如下
		       if (result == 0){
		    	   $(".header").css('display','block');
		       }
		       else {
		    	   $(".header").css('display','none');
		       }
		    },
		    error :function () {      //返回失败时的执行函数
		    }
		});
		
		function applyAdopt(pId){
			<%
				uid = (String)session.getAttribute("uid");
				if(uid==null){
			%>
				alert("请登录后在申请领养！");
			<%
				}else{
			%>
				var meaasgeDialog = confirm("是否确认申请收养？");
				if(meaasgeDialog==true){
					$.ajax({
						type:"post",
				        url:"/AdoptPet/adoptPet/adoptPetApply",
					    data:{
					           "pId":pId,
						},
						dataType:"json",
				        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
				           if (ajaxResult.success){
				        	   alert(ajaxResult.message);
				        	   window.location.href ="/AdoptPet/pet/petPageByUnAdopt";
				           }
				           else {
				        	   alert(ajaxResult.message);
				        	}
				        },
				        error :function () {      //返回失败时的执行函数
				            alert("领养申请提交失败！");
				        }
					})
				}
			<%
				}
			%>
			
		}
	</script>
</head>
<body>
	<div class="logo"><img src="<%=path%>/images/logo.png"></div>
	<div class="header">
		<a href="<%=path%>/views/login.jsp">登录</a>
		|
		<a href="<%=path%>/views/register.jsp">注册</a>
	</div>
	<div class="nav">
		<div class="nav_left">
			<ul>
				<li><a href="<%=path%>/views/index.jsp" class="normal">首页</a></li>
				<li><a href="<%=path%>/pet/petPageByUnAdopt"  class="selecter">收养宠物</a></li>
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
				<span class="inden">游客身份</span>
			</div>
		</div>
	</div>
	<div class="content">
		<h1>宠物详细信息列表</h1><hr>
		<div class="list">
				<div class="user">
					<div class="user_head">
						<img alt="用户头像" src="${requestScope.petDetailed.uPic}" />
					</div>
					<div class="user_info">
						<div class="user_name">${requestScope.petDetailed.uAccount}</div>
						<div class="fb_time">发布时间：${requestScope.petDetailed.applyTime}
							<span class="applyNum">申请领养人数：<strong>${requestScope.petDetailed.adoptApplyCount}</strong></span>
						</div>
					</div>
				</div>
				<div class="clear" ></div>
				<div class="title">
					宠物名：${requestScope.petDetailed.pName}&nbsp;&nbsp;&nbsp;宠物性别：
					<c:choose>
						<c:when test="${requestScope.petDetailed.pSex == 1}">
							男孩
						</c:when>
						<c:otherwise>
							女孩
						</c:otherwise>
					</c:choose>
					&nbsp;&nbsp;
				</div>
				<div class="pet_pic">
					<img src="${requestScope.petDetailed.pPic}" alt="宠物图片">
					<c:if test="${requestScope.petDetailed.uId != sessionScope.uid}">
						<input type="button" value="申请收养 " onclick="applyAdopt(${requestScope.petDetailed.pId})" class="adopt"></input>
					</c:if>
				</div>
				<div class="clear"></div>
				<div class="pet_info">
					${requestScope.petDetailed.pDesc}
				</div>
			</div>
		</div>
		<a href="<%=path%>/pet/petPageByUnAdopt" class="btnBack" >返回</a>
	</div>
	<div class="footer">
		<p>
			© 2020 lingchong
			<span>公益网站</span>
			<span>版权声明</span>
		</p>
	</div>
</body>
</html>