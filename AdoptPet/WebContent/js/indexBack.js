$(function(){
	$('.nav_ul').on('click','.nav_item>a',function(){
         if ($(this).next().css('display') == "none") {
                //展开
               	$(this).children('img').css('transform','rotate(-90deg)');
                $(this).next('ul').slideDown(300);
                $(this).parent('li').addClass('nav-show').siblings('li').removeClass('nav_show');
            }else{
                //收缩
               	$(this).children('img').css('transform','rotate(0deg)');
                $(this).next('ul').slideUp(300);
                $('.nav_item.nav_show').removeClass('nav_show');
            }
	        
	});
	$('.nav_ul').on('click','.two_ul>li',function(){
    	$('.two_ul>li').css('background','none');
    	$(this).css('background','#c84200');
    });
});
window.onload = function(){
	var select_li = document.querySelectorAll(".rank_ul li");
	select_li[0].onclick = function(){
		var img_arrow = document.querySelector(".arrow");
		var temp_flag = select_li[1].style.display;
		if(temp_flag == "block"){//判断当前列表是否为展开状态
			img_arrow.style.transform = 'rotate(-90deg)';
			for(var i=1; i<select_li.length; i++){
				select_li[i].style.display = 'none';
			}
		}else{
			img_arrow.style.transform = 'rotate(0deg)';
			for(var i=1; i<select_li.length; i++){
				select_li[i].style.display = 'block';
			}
		}
	}
}