package org.liliting.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.liliting.entity.AjaxResult;
import org.liliting.entity.Page;
import org.liliting.entity.Pet;
import org.liliting.entity.User;
import org.liliting.service.PetService;
import org.liliting.util.GetSystemTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/petList")
@Controller
public class QueryPetListByPageController {
	
	@Autowired    //程序在ioc容器中自动找一个bean，类型是petServiceImpl，就将petService注入到controller中
	PetService petService;
	
	public void setPetService(PetService petService) {
		this.petService = petService;
	}
	
	/***
	 * 管理员查看所有宠物信息
	 * @param currentPage
	 * @param pageSize
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/petListByPage")
	public String petPageByUnAdopt(@RequestParam(required = false,defaultValue="0")int currentPage,
								   @RequestParam(required = false,defaultValue="5")int pageSize,
								   HttpServletRequest request) throws UnsupportedEncodingException {
		int count = 0;
		request.setCharacterEncoding("utf-8");
		String uAccount = request.getParameter("username");
		count = petService.queryPetByAccountLike(uAccount);

		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("uAccount",uAccount);
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setCount(count);
		page.setPageSize(pageSize);
		int currentArticle = currentPage*pageSize;
		map.put("currentArticle",currentArticle);
		map.put("pageSize",pageSize);
		List<HashMap> hashMap = petService.queryPetsAllByLike(map);
		page.setHashMap(hashMap);
		request.setAttribute("petsList",page);
		return "petList";
	}
	
	/***
	 * 管理员删除一条宠物信息
	 * @param pId
	 * @param request
	 * @return
	 */
	@RequestMapping("/delPetByPid")
	@ResponseBody
	public Object delPetByPid(int pId,HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();;
		int result = 0;
		result = petService.delPetByPid(pId);
		if(result == 1) {
			ajaxResult.setMessage("删除成功！");
			ajaxResult.setSuccess(true);
		}else {
			ajaxResult.setSuccess(false);
			ajaxResult.setMessage("删除失败！");
		}
		return ajaxResult;
	}
	
	/***
	 * 管理员查看宠物详细信息
	 * @param pId
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryPetInfoByPid/{pId}")
	public String queryPetInfoByPid(@PathVariable("pId")int pId,HttpServletRequest request) {
		HashMap<String,Object> petHash = null;
		try {
			petHash = petService.queryPetByPid(pId);
		}catch(Exception e) {
			petHash = null;
		}
		request.setAttribute("petHash", petHash);
		return "petInfo";
	}
	
	/***
	 * 管理员更新宠物信息
	 * @param hidden
	 * @param pId
	 * @param pName
	 * @param pType
	 * @param pKid
	 * @param file
	 * @param pAge
	 * @param pSex
	 * @param pDesc
	 * @param pPic
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatePetInfoByPid")
	@ResponseBody
	public Object updatePetInfoByPid(
								@RequestParam(value="hidden",required=false)int hidden,
								@RequestParam(value="pId",required=false)int pId,
								@RequestParam(value="pName",required=false)String pName,
								@RequestParam(value="pType",required=false)int pType,
								@RequestParam(value="pKid",required=false)String pKid,
								@RequestParam(value = "picFile", required = false)MultipartFile file,
								@RequestParam(value="pAge", required=false)float pAge,
								@RequestParam(value="pSex", required=false)int pSex,
								@RequestParam(value="pDesc", required=false)String pDesc,
								@RequestParam(value="pPic", required=false)String pPic,HttpServletRequest request) {
		Pet pet = new Pet();
		pet.setpId(pId);
		pet.setpName(pName);
		pet.setpType(pType);
		pet.setpKid(pKid);
		pet.setpAge(pAge);
		pet.setpSex(pSex);
		pet.setpDesc(pDesc);
		
		AjaxResult ajaxResult = new AjaxResult();
		int result = 0;
		if(hidden == 1) {
			if(!file.isEmpty()) {
				String fileName = file.getOriginalFilename();//获取文件名
				try {
					String url = "D:\\apache-tomcat-8.5.50\\photo\\upload\\";
					String headPath = "/AdoptPet/photo/upload/";
					File dest = new File(url + GetSystemTimeUtil.getSystemTime() + fileName);
					pet.setpPic(headPath + GetSystemTimeUtil.getSystemTime() + fileName);
					result = petService.updatePetByPid(pet);
					if(result == 1) {
						file.transferTo(dest);
						String filename = pPic.substring(pPic.lastIndexOf("/")+1);
						File delFile = new File("D:\\apache-tomcat-8.5.50\\photo\\upload\\" + filename);
						if(delFile.exists()) {
							delFile.delete();
						}
						ajaxResult.setSuccess(true);
						ajaxResult.setMessage("修改成功！");
					}else {
						ajaxResult.setSuccess(false);
						ajaxResult.setMessage("修改失败！");
					}
					
				}catch(Exception e) {
					ajaxResult.setSuccess(false);
					ajaxResult.setMessage("修改宠物信息提交失败！！");
				}
			}	
		}else {
			try {
				pet.setpPic(pPic);
				result = petService.updatePetByPid(pet);
				if(result == 1) {
					ajaxResult.setSuccess(true);
					ajaxResult.setMessage("修改成功！");
				}else {
					ajaxResult.setSuccess(false);
					ajaxResult.setMessage("修改失败！");
				}
				
			}catch(Exception e) {
				ajaxResult.setSuccess(false);
				ajaxResult.setMessage("修改个人信息提交失败！！");
			}
		}
		return ajaxResult;
	}

}
