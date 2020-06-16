package org.liliting.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.AjaxResult;
import org.liliting.entity.LeavingMessage;
import org.liliting.entity.Page;
import org.liliting.service.LeavingMessageService;
import org.liliting.util.GetSystemTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;

@RequestMapping("/leaving")
@Controller
public class UserLeavingMessageController extends HttpServlet{
	
	@Autowired
	LeavingMessageService leavingMessageService;

	public void setLeavingMessageService(LeavingMessageService leavingMessageService) {
		this.leavingMessageService = leavingMessageService;
	}
	
	/****
	 * 用户进行网站留言
	 * @param uId
	 * @param lmContent
	 * @return Object
	 */
	@RequestMapping("/leavingMessage")
	@ResponseBody
	public Object userLeavingMessage(@Param("uId")int uId,@Param("lmContent")String lmContent) {
		AjaxResult ajaxResult = new AjaxResult();
		LeavingMessage leavingMessage = new LeavingMessage();
		leavingMessage.setuId(uId);
		leavingMessage.setLmContent(lmContent);
		try {
			int result = leavingMessageService.addLeavingMessage(leavingMessage);
			if(result == 1) {
				ajaxResult.setSuccess(true);
				ajaxResult.setMessage("留言成功！");
			}else {
				ajaxResult.setSuccess(false);
				ajaxResult.setMessage("留言失败，请重试！");
			}
		}catch(Exception e) {
			ajaxResult.setSuccess(false);
			ajaxResult.setMessage("哦哦~，留言失败了，请刷新页面重试一下！");
			e.printStackTrace();
		}
		return ajaxResult;
	}
	
	/**
	 * 查询所有用户留言
	 * @param currentPage
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("/getLeavingMessage")
	public String leavingMessagePage(
									 @RequestParam(required = false,defaultValue="0")int currentPage,
									 @RequestParam(required = false,defaultValue="3")int pageSize,
									 HttpServletRequest request) {
		int Count = 0;
		Count = leavingMessageService.queryLeavingMessagetoCount();
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setCount(Count);
		page.setPageSize(pageSize);
		HashMap<String,Object> map = new HashMap<String, Object>();
		int currentArticle = currentPage*pageSize;
		map.put("currentArticle",currentArticle);
		map.put("pageSize",pageSize);
		try{
			List<HashMap> hashMap = leavingMessageService.queryLeavingMessageAll(map);
			if(hashMap.size() > 0) {
				for(HashMap<String,Object> hm : hashMap) {
					Timestamp time = (Timestamp) hm.get("lmTime");
					hm.put("lmTime", GetSystemTimeUtil.getSystemTimeByTimeStamp(time));
				}
			}
			if(hashMap != null) page.setHashMap(hashMap);
		}catch(Exception e) {
			
		}
		if(page != null) request.setAttribute("lmPage", page);
		return "leavingMessage";
	}

}
