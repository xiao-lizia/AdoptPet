package org.liliting.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.AjaxResult;
import org.liliting.entity.Page;
import org.liliting.entity.Searcher;
import org.liliting.service.SearcherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/searcher")
@Controller
public class QuerySearcherPageController extends HttpServlet{

	@Autowired
	SearcherService searcherService;

	public void setSearcherService(SearcherService searcherService) {
		this.searcherService = searcherService;
	}
	
	/****
	 * 用户查看所有帖子
	 * @param currentPage
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("/SearcherPage")
	public String searcherPage(@RequestParam(required = false,defaultValue="0")int currentPage,@RequestParam(required = false,defaultValue="5")int pageSize,HttpServletRequest request) {
		Searcher searcher = new Searcher();
		int count = 0;
		count = searcherService.querySearcherToCountByLike(searcher);
		if(count != 0) {
			Page page = new Page();
			page.setCurrentPage(currentPage);
			page.setCount(count);
			page.setPageSize(pageSize);
			HashMap<String,Object> map = new HashMap<String, Object>();
			int currentArticle = currentPage*pageSize;
			map.put("currentArticle",currentArticle);
			map.put("pageSize",pageSize);
			List<HashMap> hashMap = searcherService.querySearchersAllByLike(map);
			page.setHashMap(hashMap);
			request.setAttribute("searcherAll",page);
		}
		return "searcher";
	}
	
	/***
	 * 管理员查看所有帖子
	 * @param currentPage
	 * @param pageSize
	 * @param request
	 * @return String
	 */
	@RequestMapping("/SearcherPageBack")
	public String searcherPageBack(@RequestParam(required = false,defaultValue="0")int currentPage,@RequestParam(required = false,defaultValue="4")int pageSize,HttpServletRequest request) {

		int count = 0;
		Searcher searcher = new Searcher();
		Page page = new Page();
		try {
			String sIn = request.getParameter("sIn");
			if(sIn != null && sIn != "" && !"null".equals(sIn)) {
				searcher.setsTitle(sIn);
				searcher.setsDesc(sIn);
			}
			count = searcherService.querySearcherToCountByLike(searcher);
			if(count != 0) {
				page.setCurrentPage(currentPage);
				page.setCount(count);
				page.setPageSize(pageSize);
				HashMap<String,Object> map = new HashMap<String, Object>();
				int currentArticle = currentPage*pageSize;
				map.put("currentArticle",currentArticle);
				map.put("pageSize",pageSize);
				if(sIn!=null && sIn!="" && !"null".equals(sIn)) {
					map.put("sTitle",sIn);
					map.put("sDesc",sIn);
				}
				List<HashMap> hashMap = searcherService.querySearchersAllByLike(map);
				page.setHashMap(hashMap);
				request.setAttribute("searcherAll",page);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "searcherList";
	}
	
	/***
	 * 管理员删除帖子
	 * @param sId
	 * @param request
	 * @return
	 */
	@RequestMapping("/delSearcher")
	@ResponseBody
	public Object delSearcherBysId(@Param("sId")int sId,HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();;
		int result = 0;
		try {
			result = searcherService.delSearcherBysId(sId);
			if(result == 1) {
				ajaxResult.setMessage("帖子删除成功！");
				ajaxResult.setSuccess(true);
			}else {
				ajaxResult.setSuccess(false);
				ajaxResult.setMessage("帖子删除失败！");
			}
		}catch(Exception e) {
			e.printStackTrace();
			ajaxResult.setSuccess(false);
			ajaxResult.setMessage("帖子删除失败！");
		}
		return ajaxResult;
	}
}
