package org.liliting.service.impl;

import java.util.HashMap;
import java.util.List;

import org.liliting.entity.Pet;
import org.liliting.mapper.PetMapper;
import org.liliting.service.PetService;

public class PetServiceImpl implements PetService{
	private PetMapper petMapper;
	public void setPetMapper(PetMapper petMapper) {
		this.petMapper = petMapper;
	}

	@Override
	public int queryPetToCount(int uId) {
		return petMapper.queryPetToCount(uId);
	}

	@Override
	public List<HashMap> queryPetsAll(HashMap<String, Object> map) {
		return petMapper.queryPetsAll(map);
	}
	
	@Override
	public int addPetApplyByUser(Pet pet) {
		return petMapper.addPetApplyByUser(pet);
	}

	@Override
	public int addPetApplyByAdmin(Pet pet) {
		return petMapper.addPetApplyByAdmin(pet);
	}
	
	@Override
	public List<HashMap> querySendPetByUid(int uId) {
		return petMapper.querySendPetByUid(uId);
	}

	@Override
	public HashMap<String, Object> queryPetByPid(int pId) {
		return petMapper.queryPetByPid(pId);
	}

	@Override
	public List<HashMap> queryPetsAllByLike(HashMap<String, Object> map) {
		return petMapper.queryPetsAllByLike(map);
	}

	@Override
	public int queryPetByAccountLike(String uAccount) {
		return petMapper.queryPetByAccountLike(uAccount);
	}

	@Override
	public int delPetByPid(int pId) {
		return petMapper.delPetByPid(pId);
	}

	@Override
	public int updatePetByPid(Pet pet) {
		return petMapper.updatePetByPid(pet);
	}

	@Override
	public List<HashMap> querySendApplyCheck(HashMap<String, Object> map) {
		return petMapper.querySendApplyCheck(map);
	}

	@Override
	public int querySendApplyCount(HashMap<String, Object> map) {
		return petMapper.querySendApplyCount(map);
	}

	@Override
	public int updateSendPetApplyTypeByPid(HashMap<String, Object> map) {
		return petMapper.updateSendPetApplyTypeByPid(map);
	}

	

}
