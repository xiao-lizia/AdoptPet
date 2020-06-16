<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<%! String path=""; %>
<% path=request.getContextPath(); %>
<html>
<head>
<meta charset="UTF-8">
	<title>寻宠发布|领宠网</title>
	<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="<%=path%>/css/searcher.css">
	<script src="<%=path%>/js/searcherPet.js"></script>
	<script src="<%=path%>/js/index.js"></script>
	<script>
		var currentPage = ${requestScope.searcherAll.currentPage};
		var countPage = ${requestScope.searcherAll.totalPage};
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
		console.log(countPage);
	</script>
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
		function btnPost(){
			<%
				if(uid==null){
			%>
					alert("请登录后再进行发布寻物贴子！");
			<%
				}else{
			%>
					window.location.href ="/AdoptPet/views/post.jsp";
			<%
				}
			%>
		}
	</script>
	<script>
		$(function(){
		    $('.sel_page').change(function(){
		    	window.location = "/AdoptPet/searcher/SearcherPage?currentPage=" + $(this).val();
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
				<li><a href="<%=path%>/searcher/SearcherPage"  class="selecter">寻物启事</a></li>
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
		<div class="con_left">
		<c:forEach  var="hashMap" items="${requestScope.searcherAll.hashMap}">
			<div class="list">
				<div class="user">
					<div class="user_head">
						<img alt="用户头像" src="${hashMap.uPic}" />
					</div>
					<div class="user_info">
						<div class="user_name">${hashMap.uAccount}</div>
						<div class="fb_time">${hashMap.sTime} 【发布于寻物频道】</div>
					</div>
				</div>
				<div class="clear" ></div>
				<div class="title">
					标题：${hashMap.sTitle}
				</div>
				<div class="pet_pic">
					<img src="${hashMap.sPic}" alt="宠物图片无">
				</div>
				<div class="clear"></div>
				<div class="pet_info">
					${hashMap.sDesc}
				</div>
				<div class="leaving">
				</div>
			</div>
			</c:forEach>
		</div>
		<div class="con_right">
			<div class="zhuyi">
				1、本帖子仅限于发布<span>丢失宠物/捡到宠物寻找主人</span>的帖子，送养宠物/收养宠物请到相关频道进行申请
				<br>2、为保障所有寻宠者的信息得到公平的展示机会，禁止刷屏、重复标题、重复描述信息者全部删除（可以发不同图片、不同标题、不同描述的新帖子）
				<br>3、要上传一张宠物的近照，图片过大会导致上传时间过长或无法上传。
				<br>4、如有其它问题可以给网站留言。感谢您的使用
			</div>
			<p>发布寻找宠物/寻找失主</p><br>
			<input type="button" value="发布贴子" class="btnfb" onclick="btnPost()">
		</div>
	</div>
	<div class="page">
				<span>共有<i>${requestScope.searcherAll.count}</i>条数据</span>
				<a href="<%=path%>/searcher/SearcherPage?currentPage=0" id="onePage">首页</a>
				<a href="<%=path%>/searcher/SearcherPage?currentPage=${requestScope.searcherAll.currentPage-1}" id="previousPage">上一页</a>
				<span>第${requestScope.searcherAll.currentPage+1} / ${requestScope.searcherAll.totalPage +1}页</span>
				跳转到第
				<select class="sel_page"> 
					<c:forEach  begin="0" end="${requestScope.searcherAll.totalPage}" step="1" varStatus="status">
						<c:choose>
							<c:when test="${(requestScope.searcherAll.currentPage+1) == (status.index+1)}">
								<option value="${status.index}" selected="selected">${status.index + 1}</option>
							</c:when>
							<c:otherwise>
								<option value="${status.index}">${status.index + 1}</option>
							</c:otherwise>
						</c:choose>
	
					</c:forEach>
				</select>
				页
				<a href="<%=path%>/searcher/SearcherPage?currentPage=${requestScope.searcherAll.currentPage+1}" id="nextPage">下一页</a>
				<a href="<%=path%>/searcher/SearcherPage?currentPage=${requestScope.searcherAll.totalPage}" id="lastPage">尾页</a>
			</div>
	<div class="clear"></div>
	<div class="footer">
		<p>
			© 2020 lingchong
			<span>公益网站</span>
			<span>版权声明</span>
		</p>
	</div>
	
	<a href="#top" class="gotop"></a>
</body>
</html>