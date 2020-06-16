var uPic;
function changHead(obj){/*上传的文件在页面显示*/
	var newHead = document.getElementById("head_img");
	uPic = $("#head_img").attr("src");
	var fileObjName = $(".pPic").val();
	if(obj){
		//IE兼容
		var fileName = getFileName(fileObjName);
		var myfile_name = document.getElementsByClassName('file_name')[0];
		var flag = judgeImgSuffix(fileObjName); 
		if(!flag){
            alert("要求图片格式为png,jpg,jpeg.gif");
            myfile_name.innerHTML="请选择上传的图片";
		}else{
            myfile_name.innerHTML = fileName;
            if(window.navigator.userAgent.indexOf("MSIE") >=1){
    			obj.select();
    			newHead.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
            	newHead.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.selection.createRange().text;
                return;
    		}else{//兼容firefox
    			if(obj.files){
    				newHead.src = window.URL.createObjectURL(obj.files.item(0));
    				return;
    			}
    			newHead.src = obj.value;
    			return;
    		}
    		newHead.src = obj.value;
        }
		return;
	}
}

function judgeImgSuffix(path){/*获取上传文件的后缀*/
	var index = path.lastIndexOf('.');
    var suffix = "";
    if(index > 0){
        suffix = path.substring(index+1);
    }
    if("png"==suffix || "jpg"==suffix || "jpeg"==suffix || "bmp"==suffix || "PNG"==suffix || "JPG"==suffix || "JPEG"==suffix || "BMP"==suffix){
        return true;
    }else{
        return false;
    }
}
/*修改个人信息*/
function changeInfo(uId,i){
	var uName = $(".uName").val();
	var uPhone = $(".uPhone").val();
	var uSex = $(".select_sex").find("option:selected").val();
	var uAddress = $(".uAddress").val();
	var uQuestion = $(".uQuestion").val();
	var uAnswer = $(".uAnswer").val();
	var hidden = $(".hidden").val();
	if(document.getElementById('uploadPic').files[0] != undefined){
		hidden = 1;
	}
	var formFile = new FormData();
	formFile.append("picFile",document.getElementById('uploadPic').files[0]);
	formFile.append("uName",uName);
	formFile.append("uId",uId);
	formFile.append("uPhone",uPhone);
	formFile.append("uSex",uSex);
	formFile.append("uAddress",uAddress);
	formFile.append("uQuestion",uQuestion);
	formFile.append("uAnswer",uAnswer);
	formFile.append("hidden",hidden);
	formFile.append("uPic",uPic);
	console.log(uPic);
	$.ajax({
		type:"post",
        url:"/AdoptPet/userInfo/updateUserInfo",
        processData: false,
        contentType: false,
	    data: formFile,
		dataType:"json",
        beforeSend:function () {  
            //一般进行表单验证，在发送数据之前执行的函数
        	if(i == 0){
        		if(uName == null || uName ==""){
            		alert("真实姓名不为空！");
            		return false;
            	}else if(uPhone== null || uPhone ==""){
            		alert("手机号码不为空！");
            		return false;
            	}else if(uAddress== null || uAddress ==""){
            		alert("家庭住址不为空！");
            		return false;
            	}
        	}
            return true;
        },
        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
           if (ajaxResult.success){
        	   alert(ajaxResult.message);
        	   if(ajaxResult.identify == 3){
        		   window.location.href ="/AdoptPet/user/userAllByPage";
        	   }else{
        		   if(i){
            		   window.location.href ="/AdoptPet/views/indexBack.jsp";
            	   }else{
            		   window.location.href ="/AdoptPet/views/index.jsp";
            	   } 
        	   }
           }else {
        	   alert(ajaxResult.message);
        	}

        },
        error :function () {      //返回失败时的执行函数
            alert("用户信息提交失败");
        }
	});
}

/**
* 获取文件名
* @param file
* @returns {*}
*/
 function getFileName(file) {
    var arr = file.split('\\');
    return arr[arr.length - 1];
}