package org.liliting.mapper;

import java.util.HashMap;
import java.util.List;

import org.liliting.entity.LeavingMessage;

public interface LeavingMessageMapper {
	
	int queryLeavingMessagetoCount();
	List<HashMap> queryLeavingMessageAll(HashMap<String, Object> map);
	int addLeavingMessage(LeavingMessage lm);
}
