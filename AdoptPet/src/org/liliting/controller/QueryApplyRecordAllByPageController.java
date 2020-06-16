package org.liliting.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.Page;
import org.liliting.service.AdoptPetService;
import org.liliting.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/applyRecord")
@Controller
public class QueryApplyRecordAllByPageController {
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
	 * 查询所有领养申请记录
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/queryAdoptApplyList")
	public String queryAdoptApplyList(
					@RequestParam(required = false,defaultValue="0")int currentPage,
					@RequestParam(required = false,defaultValue="5")int pageSize,
					HttpServletRequest request) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		String pName = request.getParameter("pName");
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("pName",pName);
		
		int count = adoptPetService.queryAdoptApplyCount(map);
		
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setCount(count);
		page.setPageSize(pageSize);
		int currentArticle = currentPage*pageSize;
		map.put("currentArticle",currentArticle);
		map.put("pageSize",pageSize);
		map.put("orderType","desc");
		
		try {
			List<HashMap> hashMap = adoptPetService.queryAdoptApplyCheck(map);
			page.setHashMap(hashMap);
			request.setAttribute("adoptApplyList", page);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "adoptApplyRecordList";
	}
	
	
	/**
	 * 查询所有送养申请记录
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/querySendApplList")
	public String querySendApplList(
					@RequestParam(required = false,defaultValue="0")int currentPage,
					@RequestParam(required = false,defaultValue="5")int pageSize,
					HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String pName = request.getParameter("pName");
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("pName",pName);

		int count = petService.querySendApplyCount(map);

		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setCount(count);
		page.setPageSize(pageSize);
		int currentArticle = currentPage*pageSize;
		map.put("currentArticle",currentArticle);
		map.put("pageSize",pageSize);
		map.put("orderType","desc");
		try {
			List<HashMap> hashMap = petService.querySendApplyCheck(map);
			page.setHashMap(hashMap);
			request.setAttribute("sendApplyList", page);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "sendApplyRecordList";
	}
}
