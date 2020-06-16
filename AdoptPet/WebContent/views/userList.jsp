<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表|领宠后台</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/userList.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/back.js"></script>
<script>
	var currentPage = ${requestScope.userAll.currentPage};
	var countPage = ${requestScope.userAll.totalPage};
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
	$(document).ready(function() {
		var username = '<%=request.getParameter("username")%>';
		if(username != 'null'){
			$('.username').val('<%=request.getParameter("username")%>');
		}
	});
	$(function(){
	    $('.sel_page').change(function(){
	    	window.location = "/AdoptPet/user/userAllByPage?username=<%=request.getParameter("username")!=null?request.getParameter("username"):""%>&&currentPage=" + $(this).val();
	    });
	});
</script>
</head>
<body>
<%@ include file="../views/navAndMenu.jsp"%>
<div class="con_right">
		<div class="con_nav">首页&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;用户管理&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;用户列表</div>
		<div class="con">
			<form method="get" action="<%=path%>/user/userAllByPage">
				<div class="search">
					<input type="text" class="username" name="username" placeholder="用户名">
					<input type="submit" value="搜索" class="search_a"/>
				</div>
			</form>
			<table id="userInfo">
				<tr class="title">
					<td colspan="11">用户信息列表</td>
				</tr>
				<tr>
					<th>序号</th>
					<th>头像</th>
					<th>用户名</th>
					<th>姓名</th>
					<th>性别</th>
					<th>密保问题</th>
					<th>密保答案</th>
					<th>联系方式</th>
					<th>注册时间</th>
					<th>操作</th>
				</tr>
				<c:forEach  var="hashMap" items="${requestScope.userAll.hashMap}"  varStatus="status">
					<tr>
						<td>${requestScope.userAll.currentPage * requestScope.userAll.pageSize + status.index+1}</td>
						<td><img id="pic_img" src="${hashMap.uPic}" alt="用户头像"></td>
						<td>${hashMap.uAccount}</td>
						<td>${hashMap.uName}</td>
						<td>
							<c:choose>
								<c:when test="${hashMap.uSex == 1}">
									男
								</c:when>
								<c:otherwise>
									女
								</c:otherwise>
							</c:choose>
						</td>
						<td>${hashMap.uQuestion}</td>
						<td>${hashMap.uAnswer}</td>
						<td>${hashMap.uPhone}</td>
						<td>${fn:substring(hashMap.uTime, 0, 10)}</td>
						<td class="operation"><input type="button" value="编辑" class="btn_update" onclick="updateUserByAccount('${hashMap.uAccount}')"></input><input type="button" value="删除" class="btn_del" onclick="delUserByAccount('${hashMap.uAccount}')"></input></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="page">
			<span>共有<i>${requestScope.userAll.count}</i>条数据</span>
			<a href="<%=path%>/user/userAllByPage?username=<%=request.getParameter("username")!=null?request.getParameter("username"):""%>&&currentPage=0" id="onePage">首页</a>
			<a href="<%=path%>/user/userAllByPage?username=<%=request.getParameter("username")!=null?request.getParameter("username"):""%>&&currentPage=${requestScope.userAll.currentPage-1}" id="previousPage">上一页</a>
			<span>第${requestScope.userAll.currentPage+1} / ${requestScope.userAll.totalPage+1}页</span>
			跳转到第
			<select class="sel_page">
				<c:if test="${requestScope.userAll.totalPage >= 0}">
					<c:forEach  begin="0" end="${requestScope.userAll.totalPage}" step="1" varStatus="status">
						<c:choose>
							<c:when test="${(requestScope.userAll.currentPage+1) == (status.index+1)}">
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
			<a href="<%=path%>/user/userAllByPage?username=<%=request.getParameter("username")!=null?request.getParameter("username"):""%>&&currentPage=${requestScope.userAll.currentPage+1}" id="nextPage">下一页 </a>
			<a href="<%=path%>/user/userAllByPage?username=<%=request.getParameter("username")!=null?request.getParameter("username"):""%>&&currentPage=${requestScope.userAll.totalPage}" id="lastPage">尾页</a>
		</div>
	</div>
	
<%@ include file="../views/mFooter.jsp"%>
</body>
</html>