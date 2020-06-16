package org.liliting.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.Pet;

public interface PetMapper {
	
	//查询除当前用户送养的宠物外的所有宠物个数，用于：QueryPetByPageController
	int queryPetToCount(@Param("uId")int uId);
	
	//查询除当前用户外的所有宠物信息，用于：QueryPetByPageController
	List<HashMap> queryPetsAll(HashMap<String, Object> map);
	
	//用户申请送养宠物，用于：AddPetController
	int addPetApplyByUser(Pet pet);
	
	//用户申请送养宠物，用于：AddPetController
	int addPetApplyByAdmin(Pet pet);

	//根据用户id查询该用户的送养记录，用于：PetApplyRecordController
	List<HashMap> querySendPetByUid(int uId);
	
	//根据宠物id查询宠物信息，用于：PetDetailedController
	HashMap<String,Object> queryPetByPid(int pId);

	//查询所有的宠物信息，可支持用户名模糊搜索，用于：queryPetListByPageController
	List<HashMap> queryPetsAllByLike(HashMap<String, Object> map);
	
	//查询所有的宠物总数，，可支持用户名模糊匹配。用于：queryPetListByPageController
	int queryPetByAccountLike(@Param("uAccount")String uAccount);
	
	//根据宠物id删除宠物记录，用于：queryPetListByPageController
	int delPetByPid(@Param("pId")int pId);
	
	//更新宠物信息，用于：queryPetListByPageController
	int updatePetByPid(Pet pet);
	
	//查询待审核的送养申请总数量，用于：ApplyCheckByPageController
	int querySendApplyCount(HashMap<String, Object> map);
	
	//查询待审核的送养申请数据信息，用于：ApplyCheckByPageController
	List<HashMap> querySendApplyCheck(HashMap<String, Object> map);
	
	//更新送养申请的状态，用于：ApplyCheckByPageController（已领养）
	int updateSendPetApplyTypeByPid(HashMap<String, Object> map);
	
}
