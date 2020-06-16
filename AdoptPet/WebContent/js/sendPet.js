
function uploadPic(){
	var fileObj = document.getElementById('upload_pic').files[0];
	var fileObjName = $(".pPic").val();
	if(typeof(fileObj) == "undefined" || fileObj.size <= 0){
		alert("请选择上传的宠物图片！！");
		return;
	}
	 var fileName = getFileName(fileObjName);
	 var fileSuffix = getFileSuffix(fileObjName);
	 var myfile_name = document.getElementsByClassName('file_name')[0];
	if(fileSuffix !='jpg' && fileSuffix != 'png' && fileSuffix != 'gif'){
		alert("请上传正确文件格式的文件");
		myfile_name.innerHTML="请选择上传的图片";
		return;
	}else{
		 myfile_name.innerHTML = fileName;
	}
}
function sendPet(){
	var regNumber = /^([1-9])?[0-9](.[0-9])?$/;
	var pName = $(".pName").val();
	var pKid = $(".pKid").val();
	var pAge = $(".pAge").val();
	var pSex = $(".select_sex").find("option:selected").val();
	var pDesc = $(".pDesc").val();
	var formFile = new FormData();
	var pic = document.getElementById('upload_pic').files[0];
	formFile.append("picFile",document.getElementById('upload_pic').files[0]);
	formFile.append("pName",pName);
	formFile.append("pKid",pKid);
	formFile.append("pAge",pAge);
	formFile.append("pSex",pSex);
	formFile.append("pDesc",pDesc);
	formFile.append("mark",0);
	$.ajax({
		type:"post",
        url:"/AdoptPet/pet2/addPetApply",
        processData: false,
        contentType: false,
	    data: formFile,
		dataType:"json",
        beforeSend:function () {  
            //一般进行表单验证，在发送数据之前执行的函数
        	if(pName == null || pName ==""){
        		alert("宠物的名字不为空");
        		return false;
        	}
        	if(pKid == null || pKid ==""){
        		alert("宠物的种类不为空");
        		return false;
        	}
        	if(pAge == null || pAge ==""){
        		alert("宠物的年龄不为空");
        		return false;
        	}
        	if(pAge != null && pAge !=""){
        		if(regNumber.test(pAge) == false){
            		alert("年龄格式有误！");
            		return false;
            	}
        	}
        	if(pSex == null || pSex ==""){
        		alert("宠物的性别不为空");
        		return false;
        	}
        	if(pDesc == null || pDesc ==""){
        		alert("宠物的描述不为空");
        		return false;
        	}
        	if(pic == null || pic ==""){
        		alert("宠物图片不为空");
        		return false;
        	}
            return true;
        },
        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
           if (ajaxResult.success){
      			alert(ajaxResult.message);
           		window.location.href ="/AdoptPet/views/index.jsp";
           }
           else {
        	   alert(ajaxResult.message);
        	}

        },
        error :function () {      //返回失败时的执行函数
            alert("宠物信息提交失败");
        }
	});
}


function addPet(){
	var regNumber = /^([1-9])?[0-9](.[0-9])?$/;
	var pName = $(".pName").val();
	var pKid = $(".pKid").val();
	var pAge = $(".pAge").val();
	var pSex = $(".select_sex").find("option:selected").val();
	var pDesc = $(".pDesc").val();
	var formFile = new FormData();
	var pic = document.getElementById('upload_pic').files[0];
	formFile.append("picFile",document.getElementById('upload_pic').files[0]);
	formFile.append("pName",pName);
	formFile.append("pKid",pKid);
	formFile.append("pAge",pAge);
	formFile.append("pSex",pSex);
	formFile.append("pDesc",pDesc);
	formFile.append("mark",1);
	$.ajax({
		type:"post",
        url:"/AdoptPet/pet2/addPetApply",
        processData: false,
        contentType: false,
	    data: formFile,
		dataType:"json",
        beforeSend:function () {  
            //一般进行表单验证，在发送数据之前执行的函数
        	if(pName == null || pName ==""){
        		alert("宠物的名字不为空");
        		return false;
        	}
        	if(pKid == null || pKid ==""){
        		alert("宠物的种类不为空");
        		return false;
        	}
        	if(pAge == null || pAge ==""){
        		alert("宠物的年龄不为空");
        		return false;
        	}
        	if(pAge != null && pAge !=""){
        		if(regNumber.test(pAge) == false){
            		alert("年龄格式有误！");
            		return false;
            	}
        	}
        	if(pSex == null || pSex ==""){
        		alert("宠物的性别不为空");
        		return false;
        	}
        	if(pDesc == null || pDesc ==""){
        		alert("宠物的描述不为空");
        		return false;
        	}
        	if(pic == null || pic ==""){
        		alert("宠物图片不为空");
        		return false;
        	}
            return true;
        },
        success:function (ajaxResult) {    //返回成功时的执行函数一般进行页面跳转，具体如下
           if (ajaxResult.success){
      			alert(ajaxResult.message);
           		window.location.href ="/AdoptPet/views/addPet.jsp";
           }
           else {
        	   alert(ajaxResult.message);
        	}

        },
        error :function () {      //返回失败时的执行函数
            alert("宠物信息提交失败");
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
/**
* 获取后缀
*/
 function getFileSuffix(file) {
     var point = file.lastIndexOf(".");
     var type = file.substr(point + 1);
     return type;
 }