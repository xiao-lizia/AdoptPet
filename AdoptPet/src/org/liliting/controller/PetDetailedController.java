package org.liliting.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;


import org.liliting.service.AdoptPetService;
import org.liliting.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/petDetailed")
@Controller
public class PetDetailedController extends HttpServlet{
	
	@Autowired    //程序在ioc容器中自动找一个bean，类型是petServiceImpl，就将petService注入到controller中
	PetService petService;
	public void setPetService(PetService petService) {
		this.petService = petService;
	}


	@Autowired    //程序在ioc容器中自动找一个bean，类型是petServiceImpl，就将petService注入到controller中
	AdoptPetService adoptPetService;

	public void setAdoptPetService(AdoptPetService adoptPetService) {
		this.adoptPetService = adoptPetService;
	}


	/**
	 * 获取宠物的详细信息
	 * @param pId
	 * @param request
	 * @return
	 */
	@RequestMapping("/getPetDetailed/{pId}")
	public String getPetDetailed(@PathVariable("pId")int pId,HttpServletRequest request) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		try {
			int count = adoptPetService.queryApplyCount(pId);
			map = petService.queryPetByPid(pId);
			map.put("adoptApplyCount", count);
		}catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("petDetailed",map);
		return "petDetailed";
	}
	
}
