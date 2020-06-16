<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除帖子|领宠后台</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adoptPet.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/searcherList.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/back.js"></script>
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
</script>
<script>
	$(function(){
	    $('.sel_page').change(function(){
	    	window.location = "/AdoptPet/searcher/SearcherPageBack?sIn=<%=request.getParameter("sIn")!=null?request.getParameter("sIn"):""%>&&currentPage=" + $(this).val();
	    });
	});
	$(document).ready(function() {
		var sIn = '<%=request.getParameter("sIn")%>';
		if(sIn != 'null'){
			$('.username').val('<%=request.getParameter("sIn")%>');
		}
	});
	
</script>
</head>
<body>
<%@ include file="../views/navAndMenu.jsp"%>
	<div class="con_right">
		<div class="con_nav">首页&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;帖子管理&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;帖子列表</div>
		<div class="con">
			<form method="get" action="<%=path%>/searcher/SearcherPageBack">
				<div class="search">
					<input type="text" class="username" name="sIn" placeholder="请输入帖子标题或帖子内容">
					<input type="submit" value="搜索" class="search_a"/>
				</div>
			</form>
			<c:forEach var="hashMap" items="${requestScope.searcherAll.hashMap}">
				<div class="list">
					<div class="photo_list">
						<a>
							<img src="${hashMap.sPic}">
						</a>
					</div>
					<div class="text_list">
						<h3>标题：<strong>${hashMap.sTitle}</strong></h3>
						<div class="desc">
							${hashMap.sDesc}
						</div>
						<input type="button" value="删除 " class="adopt" onclick="delSearcherBysId(${hashMap.sId})" />
						<div class="info">
							<div class="info_text">用户：<i>${hashMap.uAccount}</i></div>
							<div class="info_text">发布时间：${fn:substring(hashMap.sTime, 0, 19)}</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="page">
			<span>共有<i>${requestScope.searcherAll.count}</i>条数据</span>
			<a href="<%=path%>/searcher/SearcherPageBack?sIn=<%=request.getParameter("sIn")!=null?request.getParameter("sIn"):""%>&&currentPage=0" id="onePage">首页</a>
			<a href="<%=path%>/searcher/SearcherPageBack?sIn=<%=request.getParameter("sIn")!=null?request.getParameter("sIn"):""%>&&currentPage=${requestScope.searcherAll.currentPage-1}" id="previousPage">上一页</a>
			<span>第${requestScope.searcherAll.currentPage+1} / ${requestScope.searcherAll.totalPage+1}页</span>
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
			<a href="<%=path%>/searcher/SearcherPageBack?sIn=<%=request.getParameter("sIn")!=null?request.getParameter("sIn"):""%>&&currentPage=${requestScope.searcherAll.currentPage+1}" id="nextPage">下一页 </a>
			<a href="<%=path%>/searcher/SearcherPageBack?sIn=<%=request.getParameter("sIn")!=null?request.getParameter("sIn"):""%>&&currentPage=${requestScope.searcherAll.totalPage}" id="lastPage">尾页</a>
		</div>
	</div>
	<%@ include file="../views/mFooter.jsp"%>
</body>
</html>