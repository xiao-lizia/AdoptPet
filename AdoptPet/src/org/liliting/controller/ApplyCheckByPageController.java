package org.liliting.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.AjaxResult;
import org.liliting.entity.Page;
import org.liliting.service.AdoptPetService;
import org.liliting.service.PetService;
import org.liliting.util.GetSystemTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.jmx.snmp.Timestamp;

@RequestMapping("/applyCheck")
@Controller
public class ApplyCheckByPageController {

	@Autowired
	AdoptPetService adoptPetService;

	public void setAdoptPetService(AdoptPetService adoptPetService) {
		this.adoptPetService = adoptPetService;
	}
	
	@Autowired
	PetService petService;
	public void setPetService(PetService petService) {
		this.petService = petService;
	}

	/**
	 * 查询收养申请待审核记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryAdoptApplyCheck")
	public String queryAdoptApplyCheck(
					@RequestParam(required = false,defaultValue="0")int currentPage,
					@RequestParam(required = false,defaultValue="5")int pageSize,
					HttpServletRequest request) {
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("aType",1);
		
		int count = adoptPetService.queryAdoptApplyCount(map);
		
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setCount(count);
		page.setPageSize(pageSize);
		int currentArticle = currentPage*pageSize;
		map.put("currentArticle",currentArticle);
		map.put("pageSize",pageSize);
		map.put("order",10);
		map.put("orderType","asc");
		try {
			List<HashMap> hashMap = adoptPetService.queryAdoptApplyCheck(map);
			page.setHashMap(hashMap);
			request.setAttribute("adoptApply", page);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "adoptApplyCheck";
	}
	
	/**
	 * 查询送养申请待审核记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/querySendApplyCheck")
	public String querySendApplyCheck(
					@RequestParam(required = false,defaultValue="0")int currentPage,
					@RequestParam(required = false,defaultValue="5")int pageSize,
					HttpServletRequest request) {
		
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("pType",1);
		int count = petService.querySendApplyCount(map);
		
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setCount(count);
		page.setPageSize(pageSize);
		int currentArticle = currentPage*pageSize;
		map.put("currentArticle",currentArticle);
		map.put("pageSize",pageSize);
		map.put("order",12);
		map.put("orderType","asc");
		try {
			List<HashMap> hashMap = petService.querySendApplyCheck(map);
			page.setHashMap(hashMap);
			request.setAttribute("sendApply", page);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "sendApplyCheck";
	}
	
	/***
	 * 更新收养申请的审核状态
	 * @param aId
	 * @param aType
	 * @return
	 */
	@RequestMapping("/adoptApplyCheck")
	@ResponseBody
	public Object adoptApplyCheck(@Param("aId")int aId,@Param("pId")int pId,@Param("aType")int aType) {
		AjaxResult ajaxResult = new AjaxResult();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("aId",aId);
		map.put("aType",aType);
		map.put("checkTime",GetSystemTimeUtil.getSystemTimeByTimeStamp());
		int result = 0;
		try {
			result = adoptPetService.updateAdoptApplyTypeByAid(map);
			if(result == 1) {
				if(aType == 2) {//aType=2表示已通过，如果该宠物已被管理员通过收养申请，则修改该宠物的其他用户申请为不通过 ，并且更新宠物表中该宠物的状态为已领养
					map.put("pId",pId);
					map.put("pType",4);
					petService.updateSendPetApplyTypeByPid(map);
					adoptPetService.updateAdoptApplyTypeByPid(map);
				}
				ajaxResult.setSuccess(true);
				ajaxResult.setMessage("审核操作成功！");
			}
		}catch(Exception e){
			ajaxResult.setSuccess(false);
			ajaxResult.setMessage("审核操作失败");
			e.printStackTrace();
		}
		return ajaxResult;
	}
	
	/***
	 * 更新送养申请的审核状态
	 * @param pId
	 * @param true_false
	 * @return
	 */
	@RequestMapping("/sendApplyCheck")
	@ResponseBody
	public Object sendApplyCheck(@Param("pId")int pId,@Param("pType")int pType) {
		AjaxResult ajaxResult = new AjaxResult();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("pId",pId);
		map.put("pType",pType);
		map.put("checkTime",GetSystemTimeUtil.getSystemTimeByTimeStamp());
		int result = 0;
		try {
			result = petService.updateSendPetApplyTypeByPid(map);
			if(result == 1) {
				ajaxResult.setSuccess(true);
				ajaxResult.setMessage("审核通过");
			}
		}catch(Exception e){
			ajaxResult.setSuccess(false);
			ajaxResult.setMessage("审核操作失败");
			e.printStackTrace();
		}
		return ajaxResult;
	}
}
