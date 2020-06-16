<%@page import="org.liliting.entity.Pet"%>
<%@page import="java.util.List"%>
<%@page import="org.liliting.entity.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%! String path=""; 
	String uid = "";
%>
<% path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>收养|领宠网</title>
	<link rel="stylesheet" href="<%=path %>/css/adoptPet.css">
	<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
	<script src="<%=path%>/js/index.js"></script>
	<script>
		var currentPage = ${requestScope.petsByUnAdopt.currentPage};
		var countPage = ${requestScope.petsByUnAdopt.totalPage};
		if(currentPage == 0){
			$(function(){
				$('#onePage').removeAttr('href');//去掉a标签中的href属性
				$('#onePage').css('color','#d4d4d4');
				$('#previousPage').removeAttr('href');//去掉a标签中的href属性
				$('#previousPage').css('color','#d4d4d4');
			});
		}
		if(currentPage == countPage){
			$(function(){
				$('#lastPage').removeAttr('href');//去掉a标签中的href属性
				$('#lastPage').css('color','#d4d4d4');
				$('#nextPage').removeAttr('href');//去掉a标签中的href属性
				$('#nextPage').css('color','#d4d4d4');
			});
		}
	</script>
	<script>
		$(document).ready(function(){
			<%
				uid = (String)session.getAttribute("uid");
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
		       }else {
		    	   console.log(result);
		    	   $(".header").css('display','none');
		       }
		    },
		    error :function () {      //返回失败时的执行函数
		    }
		});
	</script>
	<script>
	function adoptPetApply(pId){
		<%
			uid = (String)session.getAttribute("uid");
			if(uid==null){
		%>
				alert("请登录后再申请领养！");
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
	<script>
		$(function(){
		    $('.sel_page').change(function(){
		    	window.location = "/AdoptPet/pet/petPageByUnAdopt?currentPage=" + $(this).val();
		    });
		});
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
					<li><a href="<%=path%>/views/login.jsp">退出登录</a></li>
				</ul>
				<span class="inden">游客身份</span>
			</div>
		</div>
	</div>
	<div class="content">
		<h1>宠物领养列表：</h1>
		<hr>
	<c:forEach  var="hashMap" items="${requestScope.petsByUnAdopt.hashMap}">
		<div class="list">
			<ul>
				<div class="photo_list">
					<a href="<%=path%>/petDetailed/getPetDetailed/${hashMap.pId}">
						<img src="${hashMap.pPic}">
						<p>${hashMap.pName}&nbsp;&nbsp;
							<c:choose>
								<c:when test="${hashMap.pSex == 1}">
									男孩
								</c:when>
								<c:otherwise>
									女孩
								</c:otherwise>
							</c:choose>
						</p>
					</a>
					<p>
						<a href="<%=path%>/petDetailed/getPetDetailed/${hashMap.pId}">详细信息</a>
					</p>
				</div>
				<div class="text_list">
					<h3>主人描述</h3>
					<div class="desc">
						${hashMap.pDesc}
					</div>
					<c:if test="${hashMap.uId  != sessionScope.uid}">
						<input type="button" value="收养" class="adopt" onclick="adoptPetApply(${hashMap.pId})" />
					</c:if>
					<div class="info">
						<div class="info_text">主人：<i>${hashMap.uAccount}</i></div>
						<div class="info_text">发布时间：${fn:substring(hashMap.checkTime, 0, 19)}</div>
						<!--  <div class="info_text" id="effTime">有效时间：${fn:substring(hashMap.checkTime, 0, 4)+1}${fn:substring(hashMap.pTime, 4, 10)}</div>
						-->
					</div>
				</div>
			</ul>
		</div>
	</c:forEach>
		<div style="clear:both;"></div>
		<div class="page">
			<span>共有<i>${requestScope.petsByUnAdopt.count}</i>条数据</span>
			<a href="<%=path%>/pet/petPageByUnAdopt?currentPage=0" id="onePage">首页</a>
			<a href="<%=path%>/pet/petPageByUnAdopt?currentPage=${requestScope.petsByUnAdopt.currentPage-1}" id="previousPage">上一页</a>
			<span>第${requestScope.petsByUnAdopt.currentPage+1} / ${requestScope.petsByUnAdopt.totalPage+1}页</span>
			跳转到第
			<select class="sel_page"> 
				<c:forEach  begin="0" end="${requestScope.petsByUnAdopt.totalPage}" step="1" varStatus="status">
					<c:choose>
						<c:when test="${(requestScope.petsByUnAdopt.currentPage+1) == (status.index+1)}">
							<option value="${status.index}" selected="selected">${status.index + 1}</option>
						</c:when>
						<c:otherwise>
							<option value="${status.index}">${status.index + 1}</option>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</select>
			页
			<a href="<%=path%>/pet/petPageByUnAdopt?currentPage=${requestScope.petsByUnAdopt.currentPage+1}" id="nextPage">下一页 </a>
			<a href="<%=path%>/pet/petPageByUnAdopt?currentPage=${requestScope.petsByUnAdopt.totalPage}" id="lastPage">尾页</a>
		</div>
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