package org.liliting.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.liliting.entity.AdoptPet;
import org.liliting.entity.AjaxResult;
import org.liliting.entity.Pet;
import org.liliting.entity.User;
import org.liliting.service.AdoptPetService;
import org.liliting.service.PetService;
import org.liliting.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/adoptPet")
@Controller
public class AdoptPetApplyController extends HttpServlet{
	
	@Autowired
	AdoptPetService adoptPetService;
	public void setAdoptPetService(AdoptPetService adoptPetService) {
		this.adoptPetService = adoptPetService;
	}
	
	@Autowired
	UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/***
	 * 申请收养宠物
	 * @param pId
	 * @param request
	 * @return
	 */
	@RequestMapping("/adoptPetApply")
	@ResponseBody
	public Object addAdoptApply(@RequestParam("pId")int pId,HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		String strUid = (String)request.getSession().getAttribute("uid");
		String struAaccount = (String) request.getSession().getAttribute("uAccount");
		User user = new User();
		if(struAaccount != null) {
			try {
				user = userService.queryUserByAccount(struAaccount);//查询用户信息，用来判断该用户的信息内容是否足够
			}catch(Exception e) {
				ajaxResult.setSuccess(false);
				ajaxResult.setMessage("收养申请提交失败，请重新提交！！");
			}
		}
		String userName = "";
		String userPhone = "";
		String userAddress = "";
		if(user != null) {
			userName = user.getuName();
			userPhone = user.getuPhone();
			userAddress = user.getuAddress();
		}
		if(userName == null || userPhone == null || userAddress == null) {
			ajaxResult.setSuccess(false);
			ajaxResult.setMessage("请至导航栏右上角下拉列表中完善个人信息！");
		}else {
			if(strUid != null) {
				int uId = Integer.parseInt(strUid);
				AdoptPet adoptPet = new AdoptPet();
				adoptPet.setpId(pId);
				adoptPet.setuId(uId);
				adoptPet.setaType(1);//1为等待审核
				int addResult = 0;
				try{
					addResult = adoptPetService.addAdoptApply(adoptPet);
				}catch(Exception e) {
					e.printStackTrace();
				}
				if(addResult == 1) {
						ajaxResult.setSuccess(true);
						ajaxResult.setMessage("申请已提交，请等待审核！！");
						
				}else {
					ajaxResult.setSuccess(false);
					ajaxResult.setMessage("收养申请提交失败，请重新提交！！");
				}
			}
		}
		return ajaxResult;
	}
}
