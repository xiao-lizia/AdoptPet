package org.liliting.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.liliting.service.AdoptPetService;
import org.liliting.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/petAdopt")
@Controller
public class PetApplyRecordController extends HttpServlet{

	@Autowired
	PetService petSerice;
	public void setPetSerice(PetService petSerice) {
		this.petSerice = petSerice;
	}
	
	@Autowired
	AdoptPetService adoptPetService;
	public void setAdoptPetService(AdoptPetService adoptPetService) {
		this.adoptPetService = adoptPetService;
	}


	/***
	 * 获取用户的宠物申请记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/petApplyRecord")
	public String getPetApplyRecord(HttpServletRequest request) {
		int uId = 0;
		HttpSession session = request.getSession();
		String strUid = (String) session.getAttribute("uid");
		uId = Integer.parseInt(strUid);
		List<HashMap> adoptPetHashMap = null;
		List<HashMap> sendPetHashMap = null;
		try {
			adoptPetHashMap = adoptPetService.queryApplyAdoptByUid(uId);
			sendPetHashMap = petSerice.querySendPetByUid(uId);
			request.setAttribute("adoptPetHashMap", adoptPetHashMap);
			request.setAttribute("sendPetHashMap", sendPetHashMap);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "applyRecord";
	}
}
