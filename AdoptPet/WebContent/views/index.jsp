<%@page import="java.util.HashMap"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<%! String path="";
	String uid = "";
	String username = "";
%>
<% 
	path=request.getContextPath(); 
	username = (String)session.getAttribute("uAccount");
%>
<html>
<head>
<meta charset="UTF-8">
<title>首页|领宠网</title>
<link rel="stylesheet" href="<%=path%>/css/index.css">
<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=path%>/js/index.js"></script>

<script>
$(document).ready(function(){
	<%
		uid = (String)session.getAttribute("uid");
		if(uid==null){
	%>
	$(".rank_ul ul").css('display','none');
	$(".inden").css('display','block');
	<%}else{%>
	$(".rank_ul ul").css('display','block');
	$(".inden").css('display','none');
	<%}%>
});
</script>
<script>
$.ajax({
	type:"post",
    url:"/AdoptPet/showLogin/isLogin",
    success:function (result) {    //返回成功时的执行函数一般进行页面跳转，具体如下
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

$.ajax({
	type:"post",
    url:"/AdoptPet/lvMessage/lvMessagePage",
    success:function (jsonArray) {    //返回成功时的执行函数一般进行页面跳转，具体如下
    	var jsons = eval(jsonArray);
    	for(var i = 0; i < jsons.length; i++){
    	    var map = jsons[i];
    	    var biaoqian = '<div class="list" id="list' + i + '">'
    	    +'<ul>'
			+'<div class="list_head">'
			+'<img class="user_head" src="' + map["uPic"] + '">'
			+'<p class="uAccount">'+map["uAccount"] + '</p>'	
			+'</div>'
			+'<div class="list_context">'
			+'<p class="desc">' + map["lmContent"] + '</p>'
			+'<p class="leavingTime">留言时间： '+map["lmTime"] + '</p>'
			+'</div>'	
			+'</ul>'
			+'</div>';
			if(i == 0){
				$("#leaving").after(biaoqian);
			}else{
				
				$('#list' + (i-1)).after(biaoqian);
			}
    	}
    }
});
</script>
<!--  
	轮播图效果
-->
<script type="text/javascript">
 	function startChange() {//开始轮播
        timerID = setInterval("timer_tick()", 2000);
    }
    function stopChange() {//停止轮播
        clearInterval(timerID);
    }
    var cur_index = 1;
    function changeImg(i) {//点击小圆点改变显示第几张图
        cur_index = i;//当前图片下标
        for (j = 1; j <= 4; j++) {
            if (j == i) {
                $("#flash" + j).fadeIn(2000);
                $("#f" + j).removeClass();
                $("#f" + j).addClass("sel");
            } else {
                $("#flash" + j).fadeOut();
                $("#f" + j).removeClass();
                $("#f" + j).addClass("no");
            }
        }
    }
    function timer_tick() {
        cur_index = cur_index >= 4 ? 1 : cur_index + 1; 
        changeImg(cur_index);
    }
    $(document).ready(function() {
        $(".f_bar div").mouseover(function() { 
        	stopChange(); 
        }).mouseout(function() { 
        	startChange(); 
        });
        startChange();
        
        $(".con_left a").mouseover(function() { 
        	stopChange(); 
        }).mouseout(function() { 
        	startChange(); 
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
				<li><a href="<%=path%>/views/index.jsp" class="selecter">首页</a></li>
				<li><a href="<%=path%>/pet/petPageByUnAdopt"  class="normal">收养宠物</a></li>
				<li><a href="<%=path%>/views/sendPet.jsp" class="normal">送养宠物</a></li>
				<li><a href="<%=path%>/searcher/SearcherPage"  class="normal">寻物启事</a></li>
				<li><a href="<%=path%>/leaving/getLeavingMessage"  class="normal">网站留言</a></li>
			</ul>
		</div>
		<div class="nav_right">
			<div class="rank_ul">
				<ul>
					<li><img src="${sessionScope.userHead}" class="head"><span><%=username %></span><i><img class="arrow" src="<%=path%>/images/arrow.png"></i></li>
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
			<a id="flash1"><img src="<%=path%>/images/flash1.jpg" class="about"></a>
			<a id="flash2"><img src="<%=path%>/images/flash2.jpg" class="about"></a>
			<a id="flash3"><img src="<%=path%>/images/flash3.jpg" class="about"></a>
			<a id="flash4"><img src="<%=path%>/images/flash4.jpg" class="about"></a>
			<div class="f_bar">
	            <div class="sel" id="f1" onclick="changeImg(1)"></div>
	            <div class="no" id="f2" onclick="changeImg(2)"></div>
	            <div class="no" id="f3" onclick="changeImg(3)"></div>
	            <div class="no" id="f4" onclick="changeImg(4)"></div>
	        </div>
		</div>
		<div class="con_right">
			<div class="title">公告栏</div>
			<ul>
				<li>1.本系统于2020-1-3日需进行维护，暂停使用，感谢广大用户的使用，此次维护预计需要1天，在2020-1-4日即可使用，谢谢</li>
				<li>2.本系统仅用于送养宠物和领养宠物，不接受进行买卖</li>
				<li>3.如果觉得本系统有需要改进的地方，欢迎在留言区进行留言</li>
				<li>4.希望本系统能带给您愉快的体验</li>
			</ul>
		</div>
	</div>
	<div class="banner">
		<div class="ban_left">
			<div class="baike">文章百科</div>
			<div class="news">
				<div class="new_img">
					<img src="<%=path%>/images/news1.jpg">
				</div>
				<div class="new_con">
					<div class="new_title">养猫需要注意的事项</div>
					<p>猫最好就是吃猫粮，如果没有猫粮，可以选择用剩饭泡白开水，也可以加一些鱼肉，不能放盐和油。不可以喝生水，也不能给它喝牛奶，不论什么牛奶都不可以。刚刚带回家的猫千万不要急着给它洗澡，因为你不能确定它身上有没有病，这个时候洗澡的话非常容易使它发病。可以选择等一段时间，看看它是不是健康，在能够确定它非常的健康发情况下就可以给它洗澡了。水温也不能过于凉，猫着凉会容易感冒发烧，非常的麻烦。</p>
				</div>
			</div>
			<div class="news">
				<div class="new_img">
					<img src="<%=path%>/images/news2.jpg">
				</div>
				<div class="new_con">
					<div class="new_title">狗狗喂食小经验</div>
					<p>对于喂食物的问题，幼犬一天喂四次以下就可以了。不能给狗狗喂牛奶，给它喂的水，只要是干净的水就可以了。特别是洋葱是一定不能给狗狗吃的，盐做的东西也不可以给它吃。喂给狗狗吃的肉要把肉给弄碎才让狗狗吃，特别是鸡鸭这些动物的小骨头要挑出来再喂给狗狗吃。如果喂的是幼犬，一定不能放太多的肉，因为幼犬的肠胃发育的还不够完全。过于太多的肉会使它的肠胃消化不动，导致它会拉肚子，特别是光喂肉会导致它的消化不动，严重会导致狗狗死亡。</p>
				</div>
			</div>
			<div class="news">
				<div class="new_img">
					<img src="<%=path%>/images/news3.jpg">
				</div>
				<div class="new_con">
					<div class="new_title">猫咪小知识</div>
					<p>别看猫咪比较高冷，且白天活动量小，但猫咪是很喜欢与主人互动玩耍的，主人可以买逗猫棒来与猫互动，猫咪会很高兴能和你一起玩。但猫咪不粘人，主人忙的时候可以让它自己玩，它喜欢线球类物品，给它一个毛线球，它就自己能玩很久。猫在高兴时，尾巴会竖起来，或者发出呼噜呼噜的声音。猫生气的时候，会使劲地摇尾巴。如果你惹它生气了，它有可能会猛地扑向你。</p>
				</div>
			</div>
		</div>
		<div class="ban_right">
			<div class="title" id="leaving">最新留言</div>
		</div>
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