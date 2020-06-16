package org.liliting.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.liliting.entity.Page;
import org.liliting.entity.User;

public interface UserMapper {
	
	//用户登录
	User userLogin(User user);
	
	//查询所有用户总数
	User queryUserByAccount(String account);
	
	//添加用户
	int addUser(User user);
	
	//密保是否存在
	int isTrueByMibao(HashMap<String,Object> map);
	
	//修改密码，用于忘记密码时的修改
	int changePwd(HashMap<String,Object> map);
	
	//更新用户信息
	int updateUserInfo(User user);
	
	//查询所有用户   、即可进行模糊匹配查询，也可查询所有
	List<HashMap> queryUserAll(HashMap<String, Object> map);
	
	//模糊匹配查询用户总数
	int queryUserByAccountLike(@Param("uAccount")String uAccount);
	
	//根据用户名删除用户
	int delUserByAccount(@Param("uAccount")String uAccount);
	
	//验证旧密码是否正确
	int isTureByOldPwd(HashMap<String,Object> map);
}
