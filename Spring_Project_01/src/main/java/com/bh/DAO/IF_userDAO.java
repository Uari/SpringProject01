package com.bh.DAO;

import com.bh.VO.UserVO;

public interface IF_userDAO {

	public void insert(UserVO uservo) throws Exception;

	public UserVO userOne(String id) throws Exception;

}
