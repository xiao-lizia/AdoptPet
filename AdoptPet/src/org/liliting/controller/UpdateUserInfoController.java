package org.liliting.controller;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.liliting.entity.AjaxResult;
import org.liliting.entity.User;
import org.liliting.service.UserService;
import org.liliting.util.GetSystemTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/userInfo")
@Controller
public class UpdateUserInfoController extends HttpServlet{

	@Autowired
	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/***
	 * 根据用户账号查询用户信息
	 * @param request
	 * @return user
	 */
	@RequestMapping("/queryUserInfo")
	public String queryUserInfo(HttpServletRequest request) {
		String uAccount = (String)request.getSession().getAttribute("uAccount");
		User user = null;
		try {
			user = userService.queryUserByAccount(uAccount);
		}catch(Exception e) {
			user = null;
		}
		request.setAttribute("user", user);
		return "userInfo";
	}
	
	/***
	 * 管理员根据某用户账号查询某用户的个人信息
	 * @param uAccount
	 * @param request
	 * @return user
	 */
	@RequestMapping("/queryUserByAccountToAdmin/{uAccount}")
	public Object queryUserByAccountToAdmin(@PathVariable("uAccount")String uAccount,HttpServletRequest request) {
		User user = null;
		try {
			user = userService.queryUserByAccount(uAccount);
		}catch(Exception e) {
			user = null;
			e.printStackTrace();
		}
		request.setAttribute("user", user);
		return "userInfoBack";
	}
	
	/***
	 * 根据管理员用户账号查询管理员个人用户信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryUserInfoByAdmin")
	public String queryUserInfoByAdmin(HttpServletRequest request) {
		String uAccount = (String)request.getSession().getAttribute("uAccount");
		User user = null;
		try {
			user = userService.queryUserByAccount(uAccount);
		}catch(Exception e) {
			user = null;
		}
		request.setAttribute("user", user);
		return "userInfoBack";
	}
	
	/***
	 * 更新用户信息
	 * @param hidden
	 * @param uName
	 * @param uId
	 * @param uPic
	 * @param file
	 * @param uQuestion
	 * @param uAnswer
	 * @param uPhone
	 * @param uSex
	 * @param uAddress
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateUserInfo")
	@ResponseBody
	public Object updateUserInfo(@RequestParam(value="hidden",required=false)int hidden,
								@RequestParam(value="uName",required=false)String uName,
								@RequestParam(value="uId",required=false)int uId,
								@RequestParam(value="uPic",required=false)String uPic,
								@RequestParam(value = "picFile", required = false)MultipartFile file,
								@RequestParam(value="uQuestion", required=false)String uQuestion,
								@RequestParam(value="uAnswer", required=false)String uAnswer,
								@RequestParam(value="uPhone", required=false)String uPhone,
								@RequestParam(value="uSex", required=false)int uSex,
								@RequestParam(value="uAddress", required=false)String uAddress,HttpServletRequest request) {
		
		String strUid = (String)request.getSession().getAttribute("uid");
		int seuId = Integer.parseInt(strUid);
		User user = new User();
		user.setuId(uId);
		user.setuName(uName);
		user.setuQuestion(uQuestion);
		user.setuAnswer(uAnswer);
		user.setuPhone(uPhone);
		user.setuAddress(uAddress);
		user.setuSex(uSex);
		AjaxResult ajaxResult = new AjaxResult();
		int result = 0;
		if(hidden == 0) {
			try {
				user.setuPic("/AdoptPet/photo/head/default.jpg");
				result = userService.updateUserInfo(user);
				if(result == 1) {
					ajaxResult.setSuccess(true);
					ajaxResult.setMessage("修改成功！");
				}else {
					ajaxResult.setSuccess(false);
					ajaxResult.setMessage("修改失败！");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				ajaxResult.setSuccess(false);
				ajaxResult.setMessage("修改个人信息提交失败！！");
			}
		}else {
			if(!file.isEmpty()) {
				if(!"/AdoptPet/photo/head/default.jpg".equals(uPic)) {
					String filename = uPic.substring(uPic.lastIndexOf("/")+1);
					File delFile = new File("D:\\apache-tomcat-8.5.50\\photo\\head\\" + filename);
					if(delFile.exists()) {
						delFile.delete();
					}
				}
				String fileName = file.getOriginalFilename();//获取文件名
				try {
					String url = "D:\\apache-tomcat-8.5.50\\photo\\head\\";
					String headPath = "/AdoptPet/photo/head/";
					File dest = new File(url + GetSystemTimeUtil.getSystemTime() + fileName);
					user.setuPic(headPath + GetSystemTimeUtil.getSystemTime() + fileName);
					result = userService.updateUserInfo(user);
					if(result == 1) {
						file.transferTo(dest);
						if(uId != seuId) {//如果修改的用户id不和保存在session中的用户id一致，则标记为管理员编辑用户信息类，用于跳转至查询所有用户信息界面
							ajaxResult.setIdentify(3);
						}else {
							request.getSession().setAttribute("userHead", user.getuPic());
						}
						ajaxResult.setSuccess(true);
						ajaxResult.setMessage("修改成功！");
					}else {
						ajaxResult.setSuccess(false);
						ajaxResult.setMessage("修改失败！");
					}
					
				}catch(Exception e) {
					e.printStackTrace();
					ajaxResult.setSuccess(false);
					ajaxResult.setMessage("修改个人信息提交失败！！");
				}
			}
		}
		
		return ajaxResult;
	}


}
