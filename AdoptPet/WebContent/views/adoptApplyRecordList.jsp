<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>收养申请记录列表|领宠后台</title>
<link rel="stylesheet" href="../css/applyRecordList.css">
<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
<style>
	.two_ul li{
		background: none;
	}
	.adopt_record_a{
		background: #c84200;
	}
</style>
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
var currentPage = ${requestScope.adoptApplyList.currentPage};
var countPage = ${requestScope.adoptApplyList.totalPage};
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
	    	window.location = "/AdoptPet/applyRecord/queryAdoptApplyList?currentPage=" + $(this).val();
	    });
	});
</script>
</head>
<body>
<%@ include file="../views/navAndMenu.jsp"%>
<div class="con_right">
	<div class="con_nav">首页&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;宠物申请管理&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;收养申请记录列表</div>
	<div class="con">
		<h1>收养申请记录列表</h1><hr>
		<form method="post" action="<%=path%>/applyRecord/queryAdoptApplyList">
			<div class="search">
				<input type="text" class="pName" name="pName" placeholder="宠物名">
				<input type="submit" value="搜索" class="search_a"/>
			</div>
		</form>
		<table id="adoptApply">
			<tr>
				<th>序号</th>
				<th>宠物图片</th>
				<th>宠物名字</th>
				<th>收养者</th>
				<th>宠物性别</th>
				<th>宠物类别</th>
				<th>申请状态</th>
				<th>申请时间</th>
				<th>审核时间</th>
			</tr>
			<c:forEach var="adoptHash" items="${requestScope.adoptApplyList.hashMap}"  varStatus="status">
				<tr class="alt">
				
					<td class="td_width">${requestScope.adoptApplyList.currentPage * requestScope.adoptApplyList.pageSize + status.index+1}</td>
					<td><img id="pPic_img" src="${adoptHash.pPic}" alt="宠物图片无"></td>
					<td class="td_width">${adoptHash.pName}</td>
					<td class="td_width">${adoptHash.uAccount}</td>
					<td class="td_width">
						<c:choose>
							<c:when test="${adoptHash.pSex == 0}">
								女孩
							</c:when>
							<c:otherwise>
								男孩
							</c:otherwise>
						</c:choose>
					</td>
					<td class="td_width">${adoptHash.pKid}</td>
					<td class="zhuangtai td_width">
						<c:choose>
							<c:when test="${adoptHash.aType == 1}">
								待审核
							</c:when>
							<c:when test="${adoptHash.aType == 2}">
								通过
							</c:when>
							<c:otherwise>
								驳回
							</c:otherwise>
						</c:choose>
					</td>
					<td>${fn:substring(adoptHash.applyTime, 0, 19)}</td>	
					<td>
						<c:if test="${adoptHash.checkTime != null}" var="result" scope="request">
							${fn:substring(adoptHash.checkTime, 0, 19)}
						</c:if>	
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="page">
		<span>共有<i>${requestScope.adoptApplyList.count}</i>条数据</span>
		<a href="<%=path%>/applyRecord/queryAdoptApplyList?currentPage=0" id="onePage">首页</a>
		<a href="<%=path%>/applyRecord/queryAdoptApplyList?currentPage=${requestScope.adoptApplyList.currentPage-1}" id="previousPage">上一页</a>
		<span>第${requestScope.adoptApplyList.currentPage+1} / ${requestScope.adoptApplyList.totalPage+1}页</span>
		跳转到第
			<select class="sel_page"> 
				<c:forEach  begin="0" end="${requestScope.adoptApplyList.totalPage}" step="1" varStatus="status">
					<c:choose>
						<c:when test="${(requestScope.adoptApplyList.currentPage+1) == (status.index+1)}">
							<option value="${status.index}" selected="selected">${status.index + 1}</option>
						</c:when>
						<c:otherwise>
							<option value="${status.index}">${status.index + 1}</option>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</select>
			页
		<a href="<%=path%>/applyRecord/queryAdoptApplyList?currentPage=${requestScope.adoptApplyList.currentPage+1}" id="nextPage">下一页 </a>
		<a href="<%=path%>/applyRecord/queryAdoptApplyList?currentPage=${requestScope.adoptApplyList.totalPage}" id="lastPage">尾页</a>
	</div>
</div>

<%@ include file="../views/mFooter.jsp"%>
</body>
</html>