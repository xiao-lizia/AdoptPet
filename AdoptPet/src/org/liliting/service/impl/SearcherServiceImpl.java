package org.liliting.service.impl;

import java.util.HashMap;
import java.util.List;

import org.liliting.entity.Searcher;
import org.liliting.mapper.SearcherMapper;
import org.liliting.service.SearcherService;

public class SearcherServiceImpl  implements SearcherService{
	
	SearcherMapper searcherMapper;
	
	public void setSearcherMapper(SearcherMapper searcherMapper) {
		this.searcherMapper = searcherMapper;
	}

	
	@Override
	public int querySearcherToCountByLike(Searcher searcher) {
		return searcherMapper.querySearcherToCountByLike(searcher);
	}

	@Override
	public List<HashMap> querySearchersAllByLike(HashMap<String, Object> map) {
		return searcherMapper.querySearchersAllByLike(map);
	}


	@Override
	public int addSearcher(Searcher searcher) {
		return searcherMapper.addSearcher(searcher);
	}


	@Override
	public int delSearcherBysId(int sId) {
		return searcherMapper.delSearcherBysId(sId);
	}
	

}
