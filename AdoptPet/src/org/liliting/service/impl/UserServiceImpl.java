package org.liliting.service.impl;

import java.util.HashMap;
import java.util.List;

import org.liliting.entity.Page;
import org.liliting.entity.User;
import org.liliting.mapper.UserMapper;
import org.liliting.service.UserService;

public class UserServiceImpl implements UserService{
	
	private UserMapper userMapper;
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public User userLogin(User user) {
		return userMapper.userLogin(user);
	}

	@Override
	public User queryUserByAccount(String account) {
		return userMapper.queryUserByAccount(account);
	}

	@Override
	public int addUser(User user) {
		return userMapper.addUser(user);
	}
	@Override
	public int isTrueByMibao(HashMap<String, Object> map) {
		return userMapper.isTrueByMibao(map);
	}

	@Override
	public int changePwd(HashMap<String, Object> map) {
		return userMapper.changePwd(map);
	}

	@Override
	public int updateUserInfo(User user) {
		return userMapper.updateUserInfo(user);
	}

	@Override
	public List<HashMap> queryUserAll(HashMap<String, Object> map) {
		return userMapper.queryUserAll(map);
	}

	@Override
	public int queryUserByAccountLike(String uAccount) {
		return userMapper.queryUserByAccountLike(uAccount);
	}

	@Override
	public int delUserByAccount(String uAccount) {
		return userMapper.delUserByAccount(uAccount);
	}

	@Override
	public int isTureByOldPwd(HashMap<String,Object> map) {
		return userMapper.isTureByOldPwd(map);
	}
	
}
