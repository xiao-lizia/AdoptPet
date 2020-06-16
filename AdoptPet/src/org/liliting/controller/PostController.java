package org.liliting.controller;

import java.io.File;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.liliting.entity.AdoptPet;
import org.liliting.entity.AjaxResult;
import org.liliting.entity.Pet;
import org.liliting.entity.Searcher;
import org.liliting.service.AdoptPetService;
import org.liliting.service.PetService;
import org.liliting.service.SearcherService;
import org.liliting.util.GetSystemTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/post")
@Controller
public class PostController extends HttpServlet{
	
	@Autowired
	SearcherService searcherService;

	public void setSearcherService(SearcherService searcherService) {
		this.searcherService = searcherService;
	}


	/***
	 * 用户发布寻物贴子
	 * @param sTitle
	 * @param sType
	 * @param sDesc
	 * @param sPic
	 * @param hidden
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping("/postByUid")
	@ResponseBody
	public Object postByUid(@RequestParam(value = "sTitle")String sTitle,
							@RequestParam(value = "sType")int sType,
							@RequestParam(value = "sDesc")String sDesc,
							@RequestParam(value = "sPic", required = false)String sPic,
							@RequestParam(value = "hidden")int hidden,
							@RequestParam(value = "picFile", required = false)MultipartFile file,
							HttpServletRequest request) {
		AjaxResult ajaxResult = new AjaxResult();
		String strUid = (String)request.getSession().getAttribute("uid");
		int uId = Integer.parseInt(strUid);
		Searcher searcher = new Searcher();
		searcher.setuId(uId);
		searcher.setsTitle(sTitle);
		searcher.setsDesc(sDesc);
		searcher.setsType(sType);
		File dest = null;
		if(hidden != 0) {
			if(!file.isEmpty()) {
				String fileName = file.getOriginalFilename();//获取文件名
				try {
					String url = "D:\\apache-tomcat-8.5.50\\photo\\upload\\";
					String headPath = "/AdoptPet/photo/upload/";
					dest = new File(url + GetSystemTimeUtil.getSystemTime() + fileName);
					searcher.setsPic(headPath + GetSystemTimeUtil.getSystemTime() + fileName);	
					file.transferTo(dest);
				}catch(Exception e) {
					ajaxResult.setSuccess(false);
					ajaxResult.setMessage("发布贴子提交失败！！");
				}
			}
		}
		try{
			int postResult = searcherService.addSearcher(searcher);
			if(postResult == 1) {
				ajaxResult.setSuccess(true);
				ajaxResult.setMessage("发布贴子成功！");
			}else {
				if(searcher.getsPic() != null) {
					String filename = searcher.getsPic().substring(searcher.getsPic().lastIndexOf("/")+1);;
					File delFile = new File("D:\\apache-tomcat-8.5.50\\photo\\head\\" + filename);
					if(delFile.exists()) {
						delFile.delete();
					}
				}
				ajaxResult.setSuccess(false);
				ajaxResult.setMessage("发布贴子失败！");
			}
		}catch(Exception e) {
			e.printStackTrace();
			ajaxResult.setSuccess(false);
			ajaxResult.setMessage("发布贴子提交失败！！");
		}
		
		return ajaxResult;
	}
}
