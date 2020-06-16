<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%  
	String path = request.getContextPath(); 
	String uId = (String)session.getAttribute("uid");
%>
<html>
<head>
<meta charset="UTF-8">
<title>留言|领宠网</title>
	<link rel="stylesheet" href="../css/index.css">
	<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
	<script src="<%=path%>/js/index.js"></script>
<style>
	.content{
		height: auto;
	}
	.content img{
		height: 50px;
	}
	.leaving{
		width: 70%;
		height:170px;
		border: 1px solid #ebebeb;
	}
	.upLoadFile{
		width: 40px;
		height: 40px;
		opacity: 0.0;
		position: relative;
		z-index: 1;
	}
	.leaving img {
		width: 40px;
		height: 30px;
		vertical-align: top;
		position: relative;
		left: -40px;
		top: 5px;
	}
	.l_title{
		width: 100%;
		border-bottom: 1px solid #ebebeb;
	}
	.btn_leaving{
		width: 80px;
		height: 40px;
		background: #0c87b8;
		border: 1px solid #d1b8b8;
		margin: 10px auto;
		color: #ffe3e3;
		font-size: 14.5px;
		cursor: pointer;
	}
	.l_con{
		border: none;
		width: 98%;
		height: 160px;
		margin: 10px;
		font-size: 0.9em;
	}
	.all_leaving{
		width: 100%;
		border-top: 1px solid #ededed;
	}
	.all_leaving .title{
		    color: #f5ac00;
		    font-size: 1.6em;
		    line-height: 50px;
		    font-family: 'Eater', cursive;
		    height: 50px;
		    font-weight: bold;
		    border: none;
		    margin-bottom: -5px;
	}
	.list{
		height: 110px;
		border: 1px solid #dec8c8;
		margin-top: 5px;
	}
	.list_head{
		height: 90px;
		text-align: center;
		width: 90px;
		margin: 5px 20px 5px 5px;
	}
	div.list_head img {
        height: 80px;
	    width: 80px;
	    border-radius: 80px;
	}
	.list_head p {
	 	width: 80px;
	    margin-left: 10px;
	    color: #7c7c7c;
	    display: block;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    text-align: center;
	
	}
	.list_context {
	    height: 80px;
	    vertical-align: top;
	    width: 88%;
	}
	p.desc {
	    padding-top: 30px;
		font-size: 0.8em;
		line-height: 16px;
		height: 90px;
		max-width: 100%;
	}
	p.l_time{
		font-family: 'Eater', cursive;
		font-size: 0.7em;		
		color: #a7a7a7;
	}
	.page {
		height: 50px;
		text-align: center;
		width: 80%;
		font-size: 14px;
		margin-top: 5px;
		line-height: 50px;
	}
	.page span{
		margin:0 10px 0 10px;
		
	}
	.page a{
		display: inline-block;
		color: #000;
	}
	.sel_page{
		width: 40px;
		border: 1px solid #19bec6;
		color: #09c6a2;
		font-weight: bold;
	}
	.page span i{
		color:#fd5b5b;
		margin-right: 4px;
	}
	#nextPage{
		margin:0 5px;
	}
	.footer{
		margin-top: 5px;
	}
	.rank_ul ul{
		display: none;
	}
</style>
<script>
	var currentPage = ${requestScope.lmPage.currentPage};
	var countPage = ${requestScope.lmPage.totalPage};
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
	
	$.ajax({
		type:"post",
	    url:"/AdoptPet/showLogin/isLogin",
	    success:function (result) {    //返回成功时的执行函数一般进行页面跳转，具体如下
	 	   console.log(result);
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
	$(document).ready(function(){
		<%
			if(uId==null){
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
	function leavingMessage(){
		<%
			if(uId == null){
		%>
			alert("请登录后再进行留言~");
		<% 
			}else{
		%>
			var uId = <%=uId%>;
			var lmContent = $(".l_con").val();
			console.log(uId + "---" +lmContent);
			$.ajax({
				type:"post",
		        url:"/AdoptPet/leaving/leavingMessage",
			    data: {
			    	"uId" : uId,
			    	"lmContent" : lmContent
			    },
				dataType:"json",
		        beforeSend:function () {  
		            //一般进行表单验证，在发送数据之前执行的函数
		        	if(lmContent == null || lmContent ==""){
		        		alert("留言内容为空");
		        		return false;
		        	}
		            return true;
		        },
		        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
		           if (ajaxResult.success){
		      			alert(ajaxResult.message);
		           		window.location.href ="/AdoptPet/views/leavingMessage.jsp";
		           }else {
		        	   alert(ajaxResult.message);
		        	}
		        },
		        error :function () {      //返回失败时的执行函数
		            alert("留言信息提交失败！");
		        }
			});
		<%
			}
		%>
	}
</script>
<script>
	$(function(){
	    $('.sel_page').change(function(){
	    	window.location = "/AdoptPet/leaving/getLeavingMessage?currentPage=" + $(this).val();
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
				<li><a href="<%=path%>/pet/petPageByUnAdopt"  class="normal">收养宠物</a></li>
				<li><a href="<%=path%>/views/sendPet.jsp" class="normal">送养宠物</a></li>
				<li><a href="<%=path%>/searcher/SearcherPage"  class="normal">寻物启事</a></li>
				<li><a href="<%=path%>/leaving/getLeavingMessage"  class="selecter">网站留言</a></li>
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
			</div>
			<span class="inden">游客身份</span>
		</div>
	</div>
	<div class="content">
		<span><img src="<%=path%>/images/leavingMessage.jpg"></span>
		<div class="leaving">
			<!-- <div class="l_title">
				<input type="file" class="upLoadFile"/>
				<img src="<%=path%>/images/fileIcon1.jpg"> 
			</div>-->
			<textarea class="l_con"></textarea>
		</div>
		<input type="button" class="btn_leaving" value="留言" onclick="leavingMessage()"/>
		<div class="all_leaving">
			<div class="title">留言信息</div>
			<c:forEach  var="lm" items="${requestScope.lmPage.hashMap}">
				<div class="list">
					<div>
						<div class="list_head">
							<img src="${lm.uPic}">
							<p>${lm.uAccount}</p>
						</div>
						<div class="list_context">
							<p class="desc">${lm.lmContent}</p>
							<p class="l_time">留言时间：${lm.lmTime}</p>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="page">
			<span>共有<i>${requestScope.lmPage.count}</i>条数据</span>
			<a href="<%=path%>/leaving/getLeavingMessage?currentPage=0" id="onePage">首页</a>
			<a href="<%=path%>/leaving/getLeavingMessage?currentPage=${requestScope.lmPage.currentPage-1}" id="previousPage">上一页</a>
			<span>第${requestScope.lmPage.currentPage+1} / ${requestScope.lmPage.totalPage+1}页</span>
			跳转到第
			<select class="sel_page"> 
				<c:forEach  begin="0" end="${requestScope.lmPage.totalPage}" step="1" varStatus="status">
					<c:choose>
						<c:when test="${(requestScope.lmPage.currentPage+1) == (status.index+1)}">
							<option value="${status.index}" selected="selected">${status.index + 1}</option>
						</c:when>
						<c:otherwise>
							<option value="${status.index}">${status.index + 1}</option>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</select>
			页
			<a href="<%=path%>/leaving/getLeavingMessage?currentPage=${requestScope.lmPage.currentPage+1}" id="nextPage">下一页 </a>
			<a href="<%=path%>/leaving/getLeavingMessage?currentPage=${requestScope.lmPage.totalPage}" id="lastPage">尾页</a>
		</div>
		</div>
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