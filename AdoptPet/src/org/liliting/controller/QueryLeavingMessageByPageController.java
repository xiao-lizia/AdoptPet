package org.liliting.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.liliting.entity.Page;
import org.liliting.service.LeavingMessageService;
import org.liliting.util.GetSystemTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@RequestMapping("/lvMessage")
@Controller
public class QueryLeavingMessageByPageController extends HttpServlet{
	
	@Autowired
	LeavingMessageService leavingMessageService;
	
	public void setLeavingMessageService(LeavingMessageService leavingMessageService) {
		this.leavingMessageService = leavingMessageService;
	}


	/***
	 * 首页获取最新留言信息
	 * @param currentPage
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("/lvMessagePage")
	@ResponseBody
	public JSONArray leavingMessagePage(@RequestParam(required = false,defaultValue="0")int currentPage,@RequestParam(required = false,defaultValue="4")int pageSize,HttpServletRequest request) {
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
		List<HashMap> hashMap = leavingMessageService.queryLeavingMessageAll(map);
		if(hashMap.size() > 0) {
			for(HashMap<String,Object> hm : hashMap) {
				Timestamp time = (Timestamp) hm.get("lmTime");
				hm.put("lmTime", GetSystemTimeUtil.getSystemTimeByTimeStamp(time));
			}
		}
		page.setHashMap(hashMap);
		JSONArray jsonArray = net.sf.json.JSONArray.fromObject(hashMap);
		return jsonArray;
	}
	
}
