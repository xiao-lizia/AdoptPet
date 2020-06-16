<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%! String path=""; %>
<% path=request.getContextPath(); %>
<html>
<head>
<meta charset="UTF-8">
	<title>申请记录|领宠网</title>
	<link rel="stylesheet" href="<%=path%>/css/applyRecord.css">
<%
	String uid = (String)session.getAttribute("uid");
	if(uid == null){
%>
<script>
	window.location.href ="/AdoptPet/views/login.jsp";
</script>
<%  } %>
</head>
<body>
	<div class="content">
		<h1>申请记录列表</h1><hr>
		<table id="applyRecord">
			<tr>
				<th>序号</th>
				<th>宠物图片</th>
				<th>申请类别</th>
				<th>宠物名字</th>
				<th>宠物性别</th>
				<th>宠物类别</th>
				<th>申请状态</th>
				<th>申请时间</th>
				<th>审核时间</th>
			</tr>
			<c:set var="index" value="0"/>
			
			<c:forEach var="adoptPetHashMap" items="${requestScope.adoptPetHashMap}">
				<tr class="alt">
				
					<td class="td_width">${index+1}<c:set var="index" value="${index+1}" /></td>
					<td><img id="pPic_img" src="${adoptPetHashMap.pPic}" alt="宠物图片无"></td>
					<td class="zhuangtai td_width">收养申请</td>
					<td class="td_width">${adoptPetHashMap.pName}</td>
					<td class="td_width">
						<c:choose>
							<c:when test="${adoptPetHashMap.pSex == 0}">
								女孩
							</c:when>
							<c:otherwise>
								男孩
							</c:otherwise>
						</c:choose>
					</td>
					<td class="td_width">${adoptPetHashMap.pKid}</td>
					<td class="zhuangtai td_width">
						<c:choose>
							<c:when test="${adoptPetHashMap.aType == 1}">
								待审核
							</c:when>
							<c:when test="${adoptPetHashMap.aType == 2}">
								通过
							</c:when>
							<c:otherwise>
								驳回
							</c:otherwise>
						</c:choose>
					</td>
					<td>${adoptPetHashMap.applyTime}</td>
					
					<td>
						<c:if test="${adoptPetHashMap.checkTime != null}" var="result" scope="request">
							${adoptPetHashMap.checkTime}
						</c:if>	
					</td>
				</tr>
			</c:forEach>
			<c:forEach var="sendPetHashMap" items="${requestScope.sendPetHashMap}">
				<tr class="alt">
					<td class="td_width">${index+1}<c:set var="index" value="${index+1}"/></td>
					<td><img id="pPic_img" src="${sendPetHashMap.pPic}" alt="宠物图片无"></td>
					<td class="zhuangtai td_width">送养申请</td>
					<td class="td_width">${sendPetHashMap.pName}</td>
					<td class="td_width">
						<c:choose>
							<c:when test="${sendPetHashMap.pSex == 0}">
								女孩
							</c:when>
							<c:otherwise>
								男孩
							</c:otherwise>
						</c:choose>
					</td>
					<td class="td_width">${sendPetHashMap.pKid}</td>
					<td class="zhuangtai td_width">
						<c:choose>
							<c:when test="${sendPetHashMap.pType == 1}">
								待审核
							</c:when>
							<c:when test="${sendPetHashMap.pType == 2}">
								送养通过
							</c:when>
							<c:when test="${sendPetHashMap.pType == 3}">
								驳回
							</c:when>
							<c:when test="${sendPetHashMap.pType == 4}">
								已被领养
							</c:when>
							<c:otherwise>
								其他
							</c:otherwise>
						</c:choose>
					</td>
					<td>${sendPetHashMap.applyTime}</td>	
					<td>
						<c:if test="${sendPetHashMap.checkTime != null}" var="result" scope="request">
							${sendPetHashMap.checkTime}
						</c:if>	
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="back">
			<span>共 ${index} 条记录</span>
			<a href="<%=path%>/views/index.jsp"  class="btnBack" >返回首页</a>
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