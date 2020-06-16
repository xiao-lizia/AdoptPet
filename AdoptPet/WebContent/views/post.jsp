<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%! String path=""; %>
<% path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<title>发布贴子|领宠网</title>
	<link rel="stylesheet" href="../css/sendPet.css">
	<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
	<script src="<%=path%>/js/sendPet.js"></script>
	<script src="<%=path%>/js/index.js"></script>
</head>
	<script>
		function btnPost(){
			var sTitle = $(".sTitle").val();
			var sType = $(".select_sex").find("option:selected").val();
			var sDesc = $(".sDesc").val();
			var hidden = $(".hidden").val();
			if(document.getElementById('upload_pic').files[0] != undefined){
				hidden = 1;
			}
			var formFile = new FormData();
			formFile.append("picFile",document.getElementById('upload_pic').files[0]);
			formFile.append("sTitle",sTitle);
			formFile.append("sType",sType);
			formFile.append("sDesc",sDesc);
			formFile.append("hidden",hidden);
			
			$.ajax({
				type:"post",
		        url:"/AdoptPet/post/postByUid",
			    data:
			    	formFile,
				dataType:"json",
				processData: false,
		        contentType: false,
		        beforeSend:function () {  
		            //一般进行表单验证，在发送数据之前执行的函数
		        	if(sTitle == null || sTitle ==""){
		        		alert("标题不为空");
		        		return false;
		        	}
		        	if(sType == null || sType ==""){
		        		alert("贴子类型不为空");
		        		return false;
		        	}
		        	if(sDesc == null || sDesc ==""){
		        		alert("贴子描述不为空");
		        		return false;
		        	}
		            return true;
		        },
		        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
		           if (ajaxResult.success){
		        	   alert(ajaxResult.message);
		        	   window.location.href ="/AdoptPet/searcher/SearcherPage";
		           }
		           else {
		        		   alert(ajaxResult.message);
		        	}
		        },
		        error :function () {      //返回失败时的执行函数
		            alert("发布贴子提交失败！");
		        }
			})
		}
	</script>
<body>
	<div class="logo"><img src="<%=path%>/images/logo.png"></div>
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
			</div>
		</div>
	</div>
	<div class="content">
		<h1>发布贴子</h1>
		<form method="post" enctype="multipart/form-data">
			<span><i>*</i>帖子的标题：</span><input type="text" name="sTitle" class="sTitle"><br>
			<span><i>*</i>贴子的类型：</span>
			<select name="" class="select_sex"> 
			<option value="1">寻找宠物</option> 
			<option value="0">捡到宠物</option> 
			</select><br>
			<span><i>*</i>贴子的描述：</span><textarea name="sDesc" class="sDesc"></textarea><br>
			<span>宠物的图片：</span><input type="file" name="picFile" id="upload_pic" class="pPic" onchange="uploadPic()">
			<img src="<%=path%>/images/fileIcon1.jpg" id="file_photo"><span class="file_name">请选择上传的图片</span>
			<br>
			<input type="button" value="提交" class="btnsend" onclick="btnPost()">
		</form>
		<input type="text" name="hidden" class="hidden" value="0">
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