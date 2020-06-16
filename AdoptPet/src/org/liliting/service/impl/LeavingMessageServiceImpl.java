package org.liliting.service.impl;

import java.util.HashMap;
import java.util.List;

import org.liliting.entity.LeavingMessage;
import org.liliting.mapper.LeavingMessageMapper;
import org.liliting.service.LeavingMessageService;

public class LeavingMessageServiceImpl implements LeavingMessageService{

	LeavingMessageMapper leavingMessageMapper;
	

	public void setLeavingMessageMapper(LeavingMessageMapper leavingMessageMapper) {
		this.leavingMessageMapper = leavingMessageMapper;
	}

	@Override
	public int queryLeavingMessagetoCount() {
		return leavingMessageMapper.queryLeavingMessagetoCount();
	}

	@Override
	public List<HashMap> queryLeavingMessageAll(HashMap<String, Object> map) {
		return leavingMessageMapper.queryLeavingMessageAll(map);
	}

	@Override
	public int addLeavingMessage(LeavingMessage lm) {
		return leavingMessageMapper.addLeavingMessage(lm);
	}

}
