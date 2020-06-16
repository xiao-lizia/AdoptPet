package org.liliting.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.liliting.entity.AjaxResult;
import org.liliting.entity.Page;
import org.liliting.entity.User;
import org.liliting.service.UserService;
import org.liliting.util.GetMd5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/user")
@Controller
public class QueryUserByPageController {

	@Autowired
	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/***
	 * 管理员查看所有用户信息
	 * @param currentPage
	 * @param pageSize
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/userAllByPage")
	public String getuserAllByPage(@RequestParam(required = false,defaultValue="0")int currentPage,
								   @RequestParam(required = false,defaultValue="5")int pageSize,
								   HttpServletRequest request) throws UnsupportedEncodingException {
		int count = 0;
		request.setCharacterEncoding("utf-8");
		String uAccount = request.getParameter("username");
		count = userService.queryUserByAccountLike(uAccount);
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("uAccount", uAccount);
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setCount(count);
		page.setPageSize(pageSize);
		int currentArticle = currentPage*pageSize;
		map.put("currentArticle",currentArticle);
		map.put("pageSize",pageSize);
		List<HashMap> hashMap = userService.queryUserAll(map);
		page.setHashMap(hashMap);
		request.setAttribute("userAll",page);
		return "userList";
	}
	
	/***
	 * 管理员删除用户
	 * @param uAccount
	 * @param request
	 * @return
	 */
	@RequestMapping("/delUserByAccount")
	@ResponseBody
	public Object delUserByAccount(String uAccount,HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();;
		int result = 0;
		result = userService.delUserByAccount(uAccount);
		if(result == 1) {
			ajaxResult.setMessage("用户删除成功！");
			ajaxResult.setSuccess(true);
		}else {
			ajaxResult.setSuccess(false);
			ajaxResult.setMessage("用户删除失败！");
		}
		return ajaxResult;
	}
	

}
