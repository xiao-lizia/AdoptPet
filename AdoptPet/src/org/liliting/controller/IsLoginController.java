package org.liliting.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/showLogin")
@Controller
public class IsLoginController extends HttpServlet{
	
	/**
	 * 判断用户是否登录
	 * @param request
	 * @return
	 */
	@RequestMapping("/isLogin")
	@ResponseBody
	public int islogin(HttpServletRequest request) {
		int result = 1;
		if(request.getSession().getAttribute("uid")==null) {
			result = 0;
		}
		return result;
	}

}
