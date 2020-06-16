window.onload = function(){
	var select_li = document.querySelectorAll(".rank_ul li");
	select_li[0].onclick = function(){
		var img_arrow = document.querySelector(".arrow");
		var temp_flag = select_li[1].style.display;
		if(temp_flag === "block"){//判断当前列表是否为展开状态
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
		// for(var i=1; i<select_li.length; i++){//每个li的单击事件
		// 	select_li[i].onclick = function(){
		// 		select_li[0].firstChild.innerText = this.innerText;
		// 		for(var i=1; i<select_li.length; i++){
		// 			select_li[i].style.display = 'none';
		// 		}
		// 		img_arrow.style.transform = 'rotate(0deg)';
		// 	}
		// }
	}
}