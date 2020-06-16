<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	String path=""; 
	String username = "";
%>
<% 
	path=request.getContextPath(); 
	username = (String)session.getAttribute("uAccount");
%>
<link rel="stylesheet" href="<%=path%>/css/navAndMenu.css"/>
<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=path%>/js/indexBack.js"></script>
<div class="logo"><img src="<%=path%>/images/logo.png"></div>
<div class="top">
	<div class="rank_ul">
		<ul>
			<li><img src="${sessionScope.userHead}" class="head"><span><%=username %></span><i><img class="arrow" src="<%=path%>/images/arrow.png"></i></li>
			<li><a href="<%=path%>/userInfo/queryUserInfoByAdmin">个人信息</a></li>
			<li><a href="<%=path%>/views/changePasswordBack.jsp">修改密码</a></li>
			<li><a href="<%=path%>/views/login.jsp">退出登录</a></li>
		</ul>  
	</div>
</div>
<div class="content">
	<div class="nav">
		<ul class="nav_ul">
			<li class="nav_item"><a href="<%=path%>/views/indexBack.jsp" class="index_a"><span>首页</span></a></li>
			<li class="nav_item"><a><span>用户管理</span><img src="<%=path%>/images/arrowMenu.png" class='nav_more icon_user'></img></a>
				<ul class="two_ul" id="ul_user">
					<li><a href="<%=path%>/views/createUser.jsp" class="create_user_a">创建用户</a></li>
					<li><a href="<%=path%>/user/userAllByPage" class="user_list_a">用户列表</a></li>
				</ul>
			</li>
			<li class="nav_item"><a><span>宠物管理</span><img src="<%=path%>/images/arrowMenu.png" class='nav_more icon_pet'></img></a>
				<ul class="two_ul"  id="ul_pet">
					<li><a href="<%=path%>/views/addPet.jsp" class="add_pet_a">添加宠物</a></li>
					<li><a href="<%=path%>/petList/petListByPage" class="pet_list_a">宠物列表</a></li>
				</ul>
			</li>
			<li class="nav_item"><a><span>宠物申请管理</span><img src="<%=path%>/images/arrowMenu.png" class='nav_more icon_adopt'></img></a>
				<ul class="two_ul" id="ul_pet_adopt">
					<li><a href="<%=path%>/applyCheck/queryAdoptApplyCheck" class="adopt_apply_a">收养申请审核</a></li>
					<li><a href="<%=path%>/applyCheck/querySendApplyCheck" class="send_apply_a">送养申请审核</a></li>
					<li><a href="<%=path%>/applyRecord/queryAdoptApplyList" class="adopt_record_a">收养申请记录列表</a></li>
					<li><a href="<%=path%>/applyRecord/querySendApplList" class="send_record_a">送养申请记录列表</a></li>
				</ul>
			</li>
			<li class="nav_item"><a><span>帖子管理</span><img src="<%=path%>/images/arrowMenu.png" class='nav_more icon_search'></img></a>
				<ul class="two_ul"  id="ul_search">
					<li><a href="<%=path%>/searcher/SearcherPageBack" class="search_list_a">删除帖子</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>