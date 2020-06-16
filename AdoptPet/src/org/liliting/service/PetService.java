package org.liliting.service;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.Pet;

public interface PetService {
	int queryPetToCount(@Param("uId")int uId);
	List<HashMap> queryPetsAll(HashMap<String, Object> map);

	int addPetApplyByUser(Pet pet);
	int addPetApplyByAdmin(Pet pet);
	List<HashMap> querySendPetByUid(int uId);
	HashMap<String,Object> queryPetByPid(int pId);
	
	List<HashMap> queryPetsAllByLike(HashMap<String, Object> map);
	int queryPetByAccountLike(@Param("uAccount")String uAccount);
	int delPetByPid(@Param("pId")int pId);
	int updatePetByPid(Pet pet);

	int querySendApplyCount(HashMap<String, Object> map);
	List<HashMap> querySendApplyCheck(HashMap<String, Object> map);
	
	int updateSendPetApplyTypeByPid(HashMap<String, Object> map);
}
