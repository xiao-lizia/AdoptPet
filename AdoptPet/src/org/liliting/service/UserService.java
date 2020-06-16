package org.liliting.service;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.Page;
import org.liliting.entity.User;

public interface UserService {
	User userLogin(User user);
	User queryUserByAccount(String account);
	int addUser(User user);
	int isTrueByMibao(HashMap<String,Object> map);
	int changePwd(HashMap<String,Object> map);
	int updateUserInfo(User user);
	List<HashMap> queryUserAll(HashMap<String, Object> map);
	int queryUserByAccountLike(@Param("uAccount")String uAccount);
	int delUserByAccount(@Param("uAccount")String uAccount);
	int isTureByOldPwd(HashMap<String,Object> map);
}
