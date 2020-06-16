<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! String path="";
%>
<% 
	path=request.getContextPath(); 
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
</head>
<script>
$.ajax({
	type:"post",
    url:"/AdoptPet/lvMessage/lvMessagePage",
    success:function (result) {    //返回成功时的执行函数一般进行页面跳转，具体如下
    }
});
</script>
<body>
	
</body>
</html>