package org.liliting.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.AdoptPet;

public interface AdoptPetMapper {

	//添加领养申请，用户申请领养宠物，用于： AdoptPetApplyController
	int addAdoptApply(AdoptPet adoptPet);
	
	//根据用户id查询领养申请记录，用于：  PetApplyRecordController
	List<HashMap> queryApplyAdoptByUid(int uId);
	
	//查询某个宠物被多少用户申请领养，用于：PetDetailedController
	int queryApplyCount(int pId);
	
	//查询待审核的领养申请记录，用于：ApplyCheckByPageController
	List<HashMap> queryAdoptApplyCheck(HashMap<String, Object> map);
	
	//查询待审核的领养申请总记录数，用于：ApplyCheckByPageController
	int queryAdoptApplyCount(HashMap<String,Object> map);
	
	//根据领养申请id来更新领养申请的状态，用于：ApplyCheckByPageController
	int updateAdoptApplyTypeByAid(HashMap<String, Object> map);
	
	//根据宠物id来更新领养申请的状态，目的在于当通过某用户的某个领养申请时，这只被领养的宠物的其他用户领养申请更新为不通过,用于：ApplyCheckByPageController
	int updateAdoptApplyTypeByPid(HashMap<String, Object> map);
}
