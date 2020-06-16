package org.liliting.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.AdoptPet;

public interface AdoptPetService {

	int addAdoptApply(AdoptPet adoptPet);
	List<HashMap> queryApplyAdoptByUid(int uId);
	int queryApplyCount(int pId);
	List<HashMap> queryAdoptApplyCheck(HashMap<String, Object> map);
	int queryAdoptApplyCount(HashMap<String, Object> map);
	int updateAdoptApplyTypeByAid(HashMap<String, Object> map);
	int updateAdoptApplyTypeByPid(HashMap<String, Object> map);
}
