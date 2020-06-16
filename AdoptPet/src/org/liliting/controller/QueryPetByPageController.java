package org.liliting.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.liliting.entity.Page;
import org.liliting.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/pet")
@Controller
public class QueryPetByPageController extends HttpServlet{
	
	@Autowired    //程序在ioc容器中自动找一个bean，类型是petServiceImpl，就将petService注入到controller中
	PetService petService;
	
	public void setPetService(PetService petService) {
		this.petService = petService;
	}

	/****
	 * 获取所有待领养的宠物
	 * @param currentPage
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("/petPageByUnAdopt")
	public String petPageByUnAdopt(@RequestParam(required = false,defaultValue="0")int currentPage,
									@RequestParam(required = false,defaultValue="3")int pageSize,HttpServletRequest request) {
		int petCount = 0;
		int uId = 0;
		String strUid = (String)request.getSession().getAttribute("uid");
		if(strUid != null) {
			uId = Integer.parseInt(strUid);
		}
		petCount = petService.queryPetToCount(uId);

		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("uId",uId);
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setCount(petCount);
		page.setPageSize(pageSize);
		int currentArticle = currentPage*pageSize;
		map.put("currentArticle",currentArticle);
		map.put("pageSize",pageSize);
		
		List<HashMap> hashMap = petService.queryPetsAll(map);
		page.setHashMap(hashMap);
		request.setAttribute("petsByUnAdopt",page);
		//out.println();
		return "adoptPet";
	}
	
}
