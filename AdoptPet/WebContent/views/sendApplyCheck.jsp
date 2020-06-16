<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>送养审核|领宠后台</title>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="../css/sendApplyCheck.css">
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
var currentPage = ${requestScope.sendApply.currentPage};
var countPage = ${requestScope.sendApply.totalPage};
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
	    	window.location = "/AdoptPet/applyCheck/sendApplyCheck?currentPage=" + $(this).val();
	    });
	});
</script>
</head>
<body>
<%@ include file="../views/navAndMenu.jsp"%>
<div class="con_right">
	<div class="con_nav">首页&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;宠物申请管理&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;送养申请审核</div>
	<div class="con">
		<h1>送养申请审核列表</h1><hr>
		<table id="adoptApply">
			<tr>
				<th>序号</th>
				<th>宠物图片</th>
				<th>送养者</th>
				<th>宠物名字</th>
				<th>宠物性别</th>
				<th>宠物类别</th>
				<th>申请状态</th>
				<th>申请时间</th>
				<th>操作</th>
			</tr>
			<c:forEach  var="hashMap" items="${requestScope.sendApply.hashMap}"  varStatus="status">
				<tr class="alt">
					<td>${requestScope.sendApply.currentPage * requestScope.sendApply.pageSize + status.index+1}</td>
					<td><img id="pPic_img" src="${hashMap.pPic}" alt="宠物图片"></td>
					<td><a class="user_info" onclick="updateUserByAccount('${hashMap.uAccount}')">${hashMap.uAccount}</a></td>
					<td>${hashMap.pName}</td>
					<td>
						<c:choose>
							<c:when test="${hashMap.pSex == 0}">
								女孩
							</c:when>
							<c:otherwise>
								男孩
							</c:otherwise>
						</c:choose>
					</td>
					<td>${hashMap.pKid}</td>
					<td class="zhuangtai">待审核</td>
					<td>${fn:substring(hashMap.applyTime, 0, 19)}</td>
					<td class="operation">
						<input type="button" value="通过" class="btn_access" onclick="sendApplyCheckAccess('${hashMap.pId}',2)"></input>
						<input type="button" value="不通过" class="btn_unaccess" onclick="sendApplyCheckAccess('${hashMap.pId}',3)"></input>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="page">
			<span>共有<i>${requestScope.sendApply.count}</i>条数据</span>
			<a href="<%=path%>/applyCheck/sendApplyCheck?currentPage=0" id="onePage">首页</a>
			<a href="<%=path%>/applyCheck/sendApplyCheck?currentPage=${requestScope.sendApply.currentPage-1}" id="previousPage">上一页</a>
			<span>第${requestScope.sendApply.currentPage+1} / ${requestScope.sendApply.totalPage+1}页</span>
			跳转到第
			<select class="sel_page"> 
				<c:forEach  begin="0" end="${requestScope.sendApply.totalPage}" step="1" varStatus="status">
					<c:choose>
						<c:when test="${(requestScope.sendApply.currentPage+1) == (status.index+1)}">
							<option value="${status.index}" selected="selected">${status.index + 1}</option>
						</c:when>
						<c:otherwise>
							<option value="${status.index}">${status.index + 1}</option>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</select>
			页
			<a href="<%=path%>/applyCheck/sendApplyCheck?currentPage=${requestScope.sendApply.currentPage+1}" id="nextPage">下一页 </a>
			<a href="<%=path%>/applyCheck/sendApplyCheck?currentPage=${requestScope.sendApply.totalPage}" id="lastPage">尾页</a>
		</div>
</div>

<%@ include file="../views/mFooter.jsp"%>
</body>
</html>