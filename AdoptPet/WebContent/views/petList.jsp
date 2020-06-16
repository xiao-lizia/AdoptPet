<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>宠物列表|领宠后台</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/petList.css">
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
	var currentPage = ${requestScope.petsList.currentPage};
	var countPage = ${requestScope.petsList.totalPage};
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
	$(document).ready(function() {
		var username = '<%=request.getParameter("username")%>';
		if(username != 'null'){
			$('.username').val('<%=request.getParameter("username")%>');
		}
	});
	$(function(){
	    $('.sel_page').change(function(){
	    	window.location = "/AdoptPet/petList/petListByPage?username=<%=request.getParameter("username")!=null?request.getParameter("username"):""%>&&currentPage=" + $(this).val();
	    });
	});
</script>
</head>
<body>
<%@ include file="../views/navAndMenu.jsp"%>
<div class="con_right">
	<div class="con_nav">首页&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;宠物管理&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;宠物列表</div>
	<div class="con">
		<form method="get" action="<%=path %>/petList/petListByPage">
			<div class="search">
				<input type="text" class="username" name="username" placeholder="用户名">
				<input type="submit" value="搜索" class="search_a"/>
			</div>
		</form>
		<table id="userInfo">
			<tr class="title">
				<td colspan="10" id="title_td">宠物信息列表</td>
			</tr>
			<tr>
				<th>序号</th>
				<th>所属主人</th>
				<th>姓名</th>
				<th>状态</th>
				<th>性别</th>
				<th>图片</th>
				<th class="desc">宠物描述</th>
				<th>申请时间</th>
				<th>审核时间</th>
				<th>操作</th>
			</tr>
			<c:forEach  var="hashMap" items="${requestScope.petsList.hashMap}"  varStatus="status">
				<tr>
					<td>${requestScope.petsList.currentPage * requestScope.petsList.pageSize + status.index+1}</td>
					<td>${hashMap.uAccount}</td>
					<td>${hashMap.pName}</td>	
					<td class="type">
						<c:choose>
							<c:when test="${hashMap.pType == 1}">
								送养待审核
							</c:when>
							<c:when test="${hashMap.pType == 2}">
								待领养
							</c:when>
							<c:when test="${hashMap.pType == 3}">
								领养待审核
							</c:when>
							<c:when test="${hashMap.pType == 4}">
								已领养
							</c:when>
							<c:otherwise>
								其他
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${hashMap.pSex == 1}">
								男孩
							</c:when>
							<c:otherwise>
								女孩
							</c:otherwise>
						</c:choose>
					</td>
					<td><img id="pic_img" src="${hashMap.pPic}" alt="宠物照片"></td>
					<td class="desc">${hashMap.pDesc}</td>
					<td>${fn:substring(hashMap.applyTime, 0, 10)}</td>
					<td>
						<c:if test="${hashMap.checkTime != null}" var="result" scope="request">
							${fn:substring(hashMap.checkTime, 0, 10)}
						</c:if>	
					</td>
					<td class="operation">
						<input type="button" value="编辑" class="btn_update" onclick="updatePetByPid(${hashMap.pId})"></input>
						<input type="button" value="删除" class="btn_del" onclick="delPetByPid(${hashMap.pId})"></input>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="page">
			<span>共有<i>${requestScope.petsList.count}</i>条数据</span>
			<a href="<%=path%>/petList/petListByPage?username=<%=request.getParameter("username")!=null?request.getParameter("username"):""%>&&currentPage=0" id="onePage">首页</a>
			<a href="<%=path%>/petList/petListByPage?username=<%=request.getParameter("username")!=null?request.getParameter("username"):""%>&&currentPage=${requestScope.petsList.currentPage-1}" id="previousPage">上一页</a>
			<span>第${requestScope.petsList.currentPage+1} / ${requestScope.petsList.totalPage+1}页</span>
			跳转到第
			<select class="sel_page"> 
				<c:if test="${requestScope.petsList.totalPage >= 0}">
					<c:forEach  begin="0" end="${requestScope.petsList.totalPage}" step="1" varStatus="status">
						<c:choose>
							<c:when test="${(requestScope.petsList.currentPage+1) == (status.index+1)}">
								<option value="${status.index}" selected="selected">${status.index + 1}</option>
							</c:when>
							<c:otherwise>
								<option value="${status.index}">${status.index + 1}</option>
							</c:otherwise>
						</c:choose>
	
					</c:forEach>
				</c:if>
				
			</select>
			页
			<a href="<%=path%>/petList/petListByPage?username=<%=request.getParameter("username")!=null?request.getParameter("username"):""%>&&currentPage=${requestScope.petsList.currentPage+1}" id="nextPage">下一页 </a>
			<a href="<%=path%>/petList/petListByPage?username=<%=request.getParameter("username")!=null?request.getParameter("username"):""%>&&currentPage=${requestScope.petsList.totalPage}" id="lastPage">尾页</a>
		</div>
</div>

<%@ include file="../views/mFooter.jsp"%>
</body>
</html>