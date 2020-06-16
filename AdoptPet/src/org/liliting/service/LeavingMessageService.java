package org.liliting.service;

import java.util.HashMap;
import java.util.List;

import org.liliting.entity.LeavingMessage;

public interface LeavingMessageService {

	int queryLeavingMessagetoCount();
	List<HashMap> queryLeavingMessageAll(HashMap<String, Object> map);
	int addLeavingMessage(LeavingMessage lm);
}
