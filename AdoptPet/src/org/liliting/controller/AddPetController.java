package org.liliting.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.liliting.entity.AjaxResult;
import org.liliting.entity.Pet;
import org.liliting.service.PetService;
import org.liliting.util.GetSystemTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/pet2")
@Controller
public class AddPetController extends HttpServlet{
	
	@Autowired
	PetService petService;
	public void setPetService(PetService petService) {
		this.petService = petService;
	}
	
	/***
	 * 普通用户申请送养宠物/管理员用户添加待领养宠物
	 * @param pName
	 * @param pKid
	 * @param pAge
	 * @param pSex
	 * @param pDesc
	 * @param mark
	 * @param file
	 * @param request
	 * @return Object
	 * @throws ParseException
	 */
	@RequestMapping(value = "/addPetApply", method = RequestMethod.POST)
	@ResponseBody
	public Object addPetApply(@RequestParam(value="pName", required=false)String pName,
			@RequestParam(value="pKid", required=false)String pKid,
			@RequestParam(value="pAge", required=false)float pAge,
			@RequestParam(value="pSex", required=false)int pSex,
			@RequestParam(value="pDesc", required=false)String pDesc,
			@RequestParam(value="mark", required=false)int mark,
			@RequestParam(value = "picFile", required = false)MultipartFile file,HttpServletRequest request) throws ParseException {
		
		Pet pet = new Pet();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String checkTime = df.format(new Date());
		
		pet.setCheckTime(Timestamp.valueOf(checkTime));
		pet.setpName(pName);
		pet.setpKid(pKid);
		pet.setpAge(pAge);
		pet.setpSex(pSex);
		String strUid = (String)request.getSession().getAttribute("uid");
		int uid = Integer.parseInt(strUid);
		pet.setuId(uid);
		pet.setpDesc(pDesc);
		AjaxResult ajaxResult = new AjaxResult();
		if(!file.isEmpty()) {
			String fileName = file.getOriginalFilename();//获取文件名
			try {
				String url = "D:\\apache-tomcat-8.5.50\\photo\\upload\\";
				String headPath = "/AdoptPet/photo/upload/";
				File dest = new File(url + GetSystemTimeUtil.getSystemTime() + fileName);
				pet.setpPic(headPath + GetSystemTimeUtil.getSystemTime() + fileName);
				int result = 0;
				if(mark == 1) {//mark==1则为管理员用户添加的待领养宠物
					pet.setpType(2);
					result = petService.addPetApplyByAdmin(pet);
				}else {//mark==1则为普通用户提交的宠物领养申请
					pet.setpType(1);
					result = petService.addPetApplyByUser(pet);;
				}
				if(result == 1) {
					file.transferTo(dest);
					ajaxResult.setSuccess(true);
					ajaxResult.setMessage("添加成功！");
				}else {
					ajaxResult.setSuccess(false);
					ajaxResult.setMessage("添加失败！");
				}
				
			}catch(Exception e) {
				ajaxResult.setSuccess(false);
				ajaxResult.setMessage("提交宠物送养申请失败！！");
			}
		}
		
		return ajaxResult;
	}

}
