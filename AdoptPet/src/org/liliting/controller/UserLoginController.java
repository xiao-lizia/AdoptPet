package org.liliting.controller;




import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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


@RequestMapping("/login")
@Controller
public class UserLoginController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired    //程序在ioc容器中自动找一个bean，类型是userServiceImpl，就将userService注入到controller中
	UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @param identify
	 * @param inputCode
	 * @param request
	 * @return  object
	 */
	@RequestMapping(value = "/userLoign", method = RequestMethod.POST)
	@ResponseBody
	public Object userLogin(@Param("username")String username,@Param("password")String password,@Param("identify")int identify,@Param("inputCode")String inputCode,HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		HttpSession session = request.getSession();
		String vcode = (String)session.getAttribute("verCode");
	  //  System.out.println(vcode + "----" + inputCode);
		if(StringUtils.isEmpty(username)){
			ajaxResult.setMessage("用户名不能为空!");
            ajaxResult.setSuccess(false);
        }else if(StringUtils.isEmpty(password)){
        	ajaxResult.setMessage("密码不能为空!");
            ajaxResult.setSuccess(false);
        }else if(StringUtils.isEmpty(inputCode)){
        	ajaxResult.setMessage("验证码不能为空!");
            ajaxResult.setSuccess(false);
        }else if(!inputCode.equalsIgnoreCase(vcode)){
        	ajaxResult.setMessage("验证码错误！");
            ajaxResult.setSuccess(false);
        }else{
        	int result = -1;
    		User user = new User();
    		User resultUser = new User();
    		try {
    			user.setuAccount(username);
    			user.setuPwd(GetMd5Util.GetMd5(password));
    			user.setuIdentify(identify);
    			resultUser = userService.userLogin(user);
    		} catch(Exception e) {
    			resultUser = null;
    		}
    		if(resultUser!=null) {
    			ajaxResult.setSuccess(true);
    			ajaxResult.setIdentify(identify);
    			String uid = String.valueOf(resultUser.getuId());
    			session.setAttribute("uid", uid);
    			if(identify == 1) {
        			session.setAttribute("isAdmin", true);
    			}else {
        			session.setAttribute("isAdmin", false);
    			}
    			session.setAttribute("uAccount", resultUser.getuAccount());
    			session.setAttribute("userHead", resultUser.getuPic());
    		}else {
    			ajaxResult.setMessage("用户名或密码有误！");
    			ajaxResult.setSuccess(false);
    		}
        }
		session.removeAttribute("verCode");//避免页面没有重新提交就一直保存的是旧验证码
        return ajaxResult;
	}
}
