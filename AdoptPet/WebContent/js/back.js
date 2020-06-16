function addUser(){
	var username = $(".username").val();
	var password = $(".password").val();
	var verPassword = $("#verPassword").val();
	$.ajax({
		type:"post",
        url:"/AdoptPet/regist/addUser",
	    data:{
	           "username":username,
	           "password":password
		},
		dataType:"json",
        beforeSend:function () {  
            //一般进行表单验证，在发送数据之前执行的函数
        	//一般进行表单验证，在发送数据之前执行的函数
        	if(username=="" || username==null){
        		alert("用户名不为空");
        		return false;
        	}else if(password=="" || password==null){
        		alert("密码不为空");
        		return false;
        	}else  if(verPassword=="" || verPassword==null){
	    		alert("确认密码不为空");
	    		return false;
	    	}else  if(verPassword!=verPassword){
	    		alert("两次密码不一致");
	    		return false;
	    	}
        	return true;
        },
        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
        	if (ajaxResult.success){
        		alert(ajaxResult.message);
        		addUserClear();
            }
            else {
            	alert(ajaxResult.message);
        		addUserClear();
            }
        },
        error :function () {      //返回失败时的执行函数
        	changeVerCode();
            alert("添加用户失败");
        }
	})	
}
function addUserClear(){
	$(".username").val('');
	$(".password").val('');
	$("#verPassword").val('');
}
function delUserByAccount(uAccount){
	var meaasgeDialog = confirm("确认删除用户 " + uAccount + " ？");
	if(meaasgeDialog==true){
		$.ajax({
			type:"post",
	        url:"/AdoptPet/user/delUserByAccount",
		    data:{
		           "uAccount":uAccount,
			},
			dataType:"json",
	        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
	        	if (ajaxResult.success){
	        		alert(ajaxResult.message);
	        		window.location.href ="/AdoptPet/user/userAllByPage";
	            }
	            else {
	            	alert(ajaxResult.message);
	            }
	        },
	        error :function () {      //返回失败时的执行函数
	            alert("删除用户失败");
	        }
		})	
	}	
}
function delSearcherBysId(sId){
	var meaasgeDialog = confirm("确认删除该帖？删除后不可找回的哦 ~");
	if(meaasgeDialog==true){
		$.ajax({
			type:"post",
	        url:"/AdoptPet/searcher/delSearcher",
		    data:{
		           "sId":sId,
			},
			dataType:"json",
	        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
	        	if (ajaxResult.success){
	        		alert(ajaxResult.message);
	        		window.location.href ="/AdoptPet/searcher/SearcherPageBack";
	            }
	            else {
	            	alert(ajaxResult.message);
	            }
	        },
	        error :function () {      //返回失败时的执行函数
	            alert("帖子删除失败");
	        }
		})	
	}	
}
function delPetByPid(pId){
	var meaasgeDialog = confirm("确认删除该宠物？ ");
	if(meaasgeDialog==true){
		$.ajax({
			type:"post",
	        url:"/AdoptPet/petList/delPetByPid",
		    data:{
		           "pId":pId,
			},
			dataType:"json",
	        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
	        	if (ajaxResult.success){
	        		alert(ajaxResult.message);
	        		window.location.href ="/AdoptPet/petList/petListByPage";
	            }
	            else {
	            	alert(ajaxResult.message);
	            }
	        },
	        error :function () {      //返回失败时的执行函数
	            alert("删除用户失败");
	        }
		})	
	}	
}
function updateUserByAccount(uAccount){
	window.location.href ="/AdoptPet/userInfo/queryUserByAccountToAdmin/"+uAccount;
}

function updatePetByPid(pId){
	window.location.href ="/AdoptPet/petList/queryPetInfoByPid/"+pId;
}

/*修改宠物信息*/
function changePetInfo(pId){
	var pPic = $("#head_img").attr("src");
	var pName = $(".pName").val();
	var pType = $('input[name="pType"]:checked').val() ;
	var pKid = $(".pKid").val();
	var pAge = $(".pAge").val();
	var pSex = $(".select_sex").find("option:selected").val();
	var pDesc = $(".pDesc").val();
	var hidden = $(".hidden").val();
	if(document.getElementById('uploadPic').files[0] != undefined){
		hidden = 1;
	}
	var formFile = new FormData();
	formFile.append("picFile",document.getElementById('uploadPic').files[0]);
	formFile.append("pId",pId);
	formFile.append("pName",pName);
	formFile.append("pType",pType);
	formFile.append("pKid",pKid);
	formFile.append("pAge",pAge);
	formFile.append("pSex",pSex);
	formFile.append("pDesc",pDesc);
	formFile.append("pPic",pPic);
	formFile.append("hidden",hidden);
	$.ajax({
		type:"post",
        url:"/AdoptPet/petList/updatePetInfoByPid",
        processData: false,
        contentType: false,
	    data: formFile,
		dataType:"json",
        beforeSend:function () {  
            //一般进行表单验证，在发送数据之前执行的函数
            return true;
        },
        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
           if (ajaxResult.success){
        	   alert(ajaxResult.message);
        	   window.location.href ="/AdoptPet/petList/petListByPage"; 
           }else {
        	   alert(ajaxResult.message);
        	}

        },
        error :function () {      //返回失败时的执行函数
            alert("宠物信息提交失败");
        }
	});
}
function changeImg(obj){/*上传的文件在页面显示*/
	var newImg = document.getElementById("head_img");
	if(obj){
		//IE兼容
		if(window.navigator.userAgent.indexOf("MSIE") >=1){
			obj.select();
			newHead.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
			var path = document.select.createRange().text;
			var flag = judgeImgSuffix(path); 
			if(flag){
				newImg.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.selection.createRange().text;
            }else{
                alert("要求图片格式为png,jpg,jpeg.gif");
            }
            return;
		}else{//兼容firefox
			if(obj.files){
				newImg.src = window.URL.createObjectURL(obj.files.item(0));
				return;
			}
			newImg.src = obj.value;
			return;
		}
		newImg.src = obj.value;
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
function adoptApplyCheckAccess(aId,pId,aType){
	var meaasgeDialog = "";
	if(aType == 2) 
		meaasgeDialog = confirm("确认通过该用户的领养申请？");
	else 
		meaasgeDialog = confirm("确认拒绝该用户的领养申请？");
	if(meaasgeDialog==true){
		$.ajax({
			type:"post",
	        url:"/AdoptPet/applyCheck/adoptApplyCheck",
		    data:{
		           "aId":aId,
		           "aType":aType,
		           "pId":pId
			},
			dataType:"json",
	        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
	        	if (ajaxResult.success){
	        		alert(ajaxResult.message);
	        		window.location.href ="/AdoptPet/applyCheck/queryAdoptApplyCheck";
	            }
	            else {
	            	alert(ajaxResult.message);
	            }
	        },
	        error :function () {      //返回失败时的执行函数
	            alert("审核操作失败");
	        }
		})	
	}
}

function sendApplyCheckAccess(pId,pType){
	var meaasgeDialog = "";
	if(pType == 2) 
		meaasgeDialog = confirm("确认通过该用户的送养申请？");
	else 
		meaasgeDialog = confirm("确认拒绝该用户的送养申请？");
	if(meaasgeDialog==true){
		$.ajax({
			type:"post",
	        url:"/AdoptPet/applyCheck/sendApplyCheck",
		    data:{
		           "pId":pId,
		           "pType":pType,
			},
			dataType:"json",
	        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
	        	if (ajaxResult.success){
	        		alert(ajaxResult.message);
	        		window.location.href ="/AdoptPet/applyCheck/querySendApplyCheck";
	            }
	            else {
	            	alert(ajaxResult.message);
	            }
	        },
	        error :function () {      //返回失败时的执行函数
	            alert("审核操作失败");
	        }
		})
	}
}

function changePwd(uAccount){
	var oldPwd = $(".oldPwd").val();
	var newPwd = $(".newPwd").val();
	var rePwd = $(".rePwd").val();
	$.ajax({
		type:"post",
        url:"/AdoptPet/pwd/changePassword",
	    data:{
	    	"uAccount":uAccount,
	    	"oldPwd":oldPwd,
	    	"newPwd":newPwd,
	    	"rePwd":rePwd
		},
		dataType:"json",
        beforeSend:function () {  
            //一般进行表单验证，在发送数据之前执行的函数
        	if(oldPwd=="" || oldPwd==null){
        		alert("旧密码不为空！");
        		return false;
        	}else if(newPwd=="" || newPwd==null){
        		alert("新密码不为空！");
        		return false;
        	}else if(rePwd=="" || rePwd==null){
        		alert("确认密码不为空！");
        		return false;
        	}else  if(rePwd != newPwd){
        		alert("两次密码不一致！");
        		$(".newPwd").val("");
        		$(".rePwd").val("");
        		return false;
        	}
            return true;
        },
        success:function (result) {    //返回成功时的执行函数一般进行页面跳转，具体如下
        	if(result == 0){
          		alert("密码修改失败，请重试！");
            }else if (result == 1){
        		alert("密码修改成功！");
        	    window.location.href ="/AdoptPet/views/indexBack.jsp";
        	}else if(result == 2){
          		alert("两次密码不一致！");
            }else if(result == 3){
          	  alert("新密码长度需在6~16之间且必须包括为字母和数字！");
            }else if(result == 4){
        		alert("旧密码输入有误");
        		$(".wangjiPwd").css('display','block');
        	}
        },
        error :function () {      //返回失败时的执行函数
            alert("密码修改失败");
        }
	})
}