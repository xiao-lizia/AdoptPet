package org.liliting.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.AjaxResult;
import org.liliting.entity.User;
import org.liliting.service.UserService;
import org.liliting.util.GetMd5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@RequestMapping("/regist")
@Controller
public class UserRegisterController extends HttpServlet{
	
	@Autowired    //程序在ioc容器中自动找一个bean，类型是userServiceImpl，就将userService注入到controller中
	UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/**
	 * 用户注册
	 * @param username
	 * @param password
	 * @param verPassword
	 * @param inputCode
	 * @param request
	 * @return object
	 */
	@RequestMapping(value = "/userRegist", method = RequestMethod.POST)
	@ResponseBody
	public Object userRegist(@Param("username")String username,
			                 @Param("password")String password,
							 @Param("verPassword")String verPassword,
							 @Param("inputCode")String inputCode,
							 HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		String  pwdRules = "([a-z|A-Z][1-9])|([1-9][a-z|A-Z])";
		Pattern pt = Pattern.compile(pwdRules);
		Matcher mt = pt.matcher(password);
		
		String vcode = (String)request.getSession().getAttribute("verCode");
		if(StringUtils.isEmpty(username)){
			ajaxResult.setMessage("用户名不能为空!");
            ajaxResult.setSuccess(false);
        }else if(StringUtils.isEmpty(password)){
        	ajaxResult.setMessage("密码不能为空!");
            ajaxResult.setSuccess(false);
        }else if(StringUtils.isEmpty(verPassword)){
        	ajaxResult.setMessage("确认密码不能为空!");
            ajaxResult.setSuccess(false);
        }else if(StringUtils.isEmpty(inputCode)){
        	ajaxResult.setMessage("验证码不能为空!");
            ajaxResult.setSuccess(false);
        }else if(!password.equals(verPassword)){
        	ajaxResult.setMessage("两次密码不一致！");
            ajaxResult.setSuccess(false);
        }else if(!inputCode.equalsIgnoreCase(vcode)){
        	ajaxResult.setMessage("验证码错误！");
            ajaxResult.setSuccess(false);
        }else if(password.length() < 6 && password.length() > 16) {
        	ajaxResult.setMessage("密码长度要在6~16位之间！");
            ajaxResult.setSuccess(false);
        }else if(mt.groupCount() <= 0) {
        	ajaxResult.setMessage("密码要包括数字和字母！");
            ajaxResult.setSuccess(false);
        }else{
        	User user = new User();
        	User userExist = new User();
        	int result = -1;
        	try {
	        	user.setuAccount(username);
				user.setuPwd(GetMd5Util.GetMd5(password));
				user.setuIdentify(0);
				user.setuPic("/AdoptPet/photo/head/default.jpg");
				userExist = userService.queryUserByAccount(username);
	    		if(userExist!=null) {
	    			ajaxResult.setMessage("该用户已存在！");
	                ajaxResult.setSuccess(false);
	    		}else {
    				result = userService.addUser(user);
	        		if(result == 1) {
	        			ajaxResult.setSuccess(true);
	        		}else {
	        			ajaxResult.setMessage("用户添加失败！");
	        			ajaxResult.setSuccess(false);
	        		}
	    		}
        	} catch(Exception e) {
    			result = -1;
    		}
        }
		request.getSession().removeAttribute("verCode");
		return ajaxResult;
	}
	
	/**
	 * 添加用户用户注册
	 * @param username
	 * @param password
	 * @param request
	 * @return object
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@ResponseBody
	public Object addUser(@Param("username")String username,@Param("password")String password,HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		String  pwdRules = "([a-z|A-Z][1-9])|([1-9][a-z|A-Z])";
		Pattern pt = Pattern.compile(pwdRules);
		Matcher mt = pt.matcher(password);
		
		if(StringUtils.isEmpty(username)){
			ajaxResult.setMessage("用户名不能为空!");
            ajaxResult.setSuccess(false);
        }else if(StringUtils.isEmpty(password)){
        	ajaxResult.setMessage("密码不能为空!");
            ajaxResult.setSuccess(false);
        }else if(password.length() < 6 && password.length() > 16) {
        	ajaxResult.setMessage("密码长度要在6~16位之间！");
            ajaxResult.setSuccess(false);
        }else if(mt.groupCount() <= 0) {
        	ajaxResult.setMessage("密码要包括数字和字母！");
            ajaxResult.setSuccess(false);
        }else{
        	User user = new User();
        	User userExist = new User();
        	int result = -1;
        	try {
	        	user.setuAccount(username);
				user.setuPwd(GetMd5Util.GetMd5(password));
				user.setuIdentify(0);
				user.setuPic("/AdoptPet/photo/head/default.jpg");
				userExist = userService.queryUserByAccount(username);
	    		if(userExist!=null) {
	    			ajaxResult.setMessage("该用户已存在！");
	                ajaxResult.setSuccess(false);
	    		}else {
    				result = userService.addUser(user);
	        		if(result == 1) {
	        			ajaxResult.setMessage("用户注册成功！");
	        			ajaxResult.setSuccess(true);
	        		}else {
	        			ajaxResult.setMessage("用户添加失败！");
	        			ajaxResult.setSuccess(false);
	        		}
	    		}
        	} catch(Exception e) {
    			result = -1;
    		}
        }
		return ajaxResult;
	}

}
