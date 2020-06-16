package org.liliting.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.Searcher;

public interface SearcherMapper {
	
	//获取帖子总数
	int querySearcherToCountByLike(Searcher searcher);
	
	//查询所有帖子
	List<HashMap> querySearchersAllByLike(HashMap<String,Object> map);
	
	//用户发布帖子
	int addSearcher(Searcher searcher);
	
	//管理员删除帖子
	int delSearcherBysId(@Param("sId")int sId);
}
