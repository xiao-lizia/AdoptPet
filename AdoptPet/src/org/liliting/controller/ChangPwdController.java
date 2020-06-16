package org.liliting.controller;

import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.User;
import org.liliting.service.UserService;
import org.liliting.util.GetMd5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/pwd")
@Controller
public class ChangPwdController {

	@Autowired
	UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/***
	 * 用户是否存在
	 * @param uAccount
	 * @return
	 */
	@RequestMapping("/isExistMibao")
	@ResponseBody
	public String[] isExistMibao(String uAccount) {
		User user = new User();
		user = userService.queryUserByAccount(uAccount);
		String result[] = new String[2];
		String isExist = "0";
		if(user != null) {
			if(user.getuQuestion() != null && user.getuQuestion() != "") {
				result[1] = user.getuQuestion();
				isExist = "1";
			}else {
				isExist = "2";
				System.out.println(222);
			}
		}
		result[0] = isExist;
		return result;
	}
	
	/***
	 * 用户是否设置密保
	 * @param uAccount
	 * @param uQuestion
	 * @param uAnswer
	 * @return
	 */
	@RequestMapping("/isTrueByMibao")
	@ResponseBody
	public int isTrueByMibao(String uAccount,String uQuestion,String uAnswer) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("uAccount", uAccount);
		map.put("uQuestion", uQuestion);
		map.put("uAnswer", uAnswer);
		int isTrue = 0;
		isTrue = userService.isTrueByMibao(map);
		return isTrue;
	}
	
	/***
	 * 忘记密码修改
	 * @param uAccount
	 * @param pwd
	 * @return 
	 */
	@RequestMapping("/changePwd")
	@ResponseBody
	public int changePwd(String uAccount,String newPwd,String rePwd) {
		
		String  pwdRules = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}";
		int result = 0;
		HashMap<String,Object> map = new HashMap<String, Object>();
		if(!newPwd.equals(rePwd)) {
			result = 2;
		}else if(!newPwd.matches(pwdRules)) {
        	result = 3;
        }else {
        	map.put("uAccount", uAccount);
    		String uPwd = GetMd5Util.GetMd5(newPwd);
    		map.put("uPwd", uPwd);
    		try {
        		result = userService.changePwd(map);
    		}catch(Exception e) {
    			result = 0;
    		}
        }
		return result;
	}
	
	/***
	 * 密码修改
	 * @param uAccount
	 * @param pwd
	 * @return 
	 */
	@RequestMapping("/changePassword")
	@ResponseBody
	public int changePassword(String uAccount,String oldPwd,String newPwd,String rePwd) {

		String old_uPwd = GetMd5Util.GetMd5(oldPwd);
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("uAccount",uAccount);
		map.put("uPwd",old_uPwd);
		int isTrue = 0,result = 0;
		try {
			//验证旧密码是否正确
			isTrue = userService.isTureByOldPwd(map);
			if(isTrue == 1) {
				String  pwdRules = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}";
				if(!newPwd.equals(rePwd)) {
					result = 2;
				}else if(!newPwd.matches(pwdRules)) {
					result = 3;
				}else {
		    		String uPwd = GetMd5Util.GetMd5(newPwd);
		    		map.put("uPwd", uPwd);
		    		try {
		        		result = userService.changePwd(map);
		    		}catch(Exception e) {
		    			e.printStackTrace();
		    			result = 0;
		    		}
		        }
			}else {
				result = 4;//旧密码错误
			}
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	

	/***
	 * 密码重置
	 * @param uAccount
	 * @param pwd
	 * @return 
	 */
	@RequestMapping("/resetPwd")
	@ResponseBody
	public int resetPwd(@Param("uAccount")String uAccount) {
		String old_uPwd = GetMd5Util.GetMd5("123456");
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("uAccount",uAccount);
		map.put("uPwd",old_uPwd);
		int result = 0;
		try {
			result = userService.changePwd(map);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
}
