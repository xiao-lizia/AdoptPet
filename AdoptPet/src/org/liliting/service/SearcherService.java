package org.liliting.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.Searcher;

public interface SearcherService {
	int querySearcherToCountByLike(Searcher searcher);
	List<HashMap> querySearchersAllByLike(HashMap<String,Object> map);
	int addSearcher(Searcher searcher);
	int delSearcherBysId(@Param("sId")int sId);
}
