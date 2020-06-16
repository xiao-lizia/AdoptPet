package org.liliting.service.impl;

import java.util.HashMap;
import java.util.List;

import org.liliting.entity.AdoptPet;
import org.liliting.mapper.AdoptPetMapper;
import org.liliting.service.AdoptPetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository 
public class AdoptPetServiceImpl implements AdoptPetService{

	private AdoptPetMapper adoptPetMapper;

	public void setAdoptPetMapper(AdoptPetMapper adoptPetMapper) {
		this.adoptPetMapper = adoptPetMapper;
	}


	@Override
	public int addAdoptApply(AdoptPet adoptPet) {
		return adoptPetMapper.addAdoptApply(adoptPet);
	}

	@Override
	public List<HashMap> queryApplyAdoptByUid(int uId) {
		// TODO Auto-generated method stub
		return adoptPetMapper.queryApplyAdoptByUid(uId);
	}


	@Override
	public int queryApplyCount(int pId) {
		return adoptPetMapper.queryApplyCount(pId);
	}


	@Override
	public List<HashMap> queryAdoptApplyCheck(HashMap<String, Object> map) {
		return adoptPetMapper.queryAdoptApplyCheck(map);
	}

	@Override
	public int queryAdoptApplyCount(HashMap<String, Object> map) {
		return adoptPetMapper.queryAdoptApplyCount(map);
	}


	@Override
	public int updateAdoptApplyTypeByAid(HashMap<String, Object> map) {
		return adoptPetMapper.updateAdoptApplyTypeByAid(map);
	}


	@Override
	public int updateAdoptApplyTypeByPid(HashMap<String, Object> map) {
		return adoptPetMapper.updateAdoptApplyTypeByPid(map);
	}

}
