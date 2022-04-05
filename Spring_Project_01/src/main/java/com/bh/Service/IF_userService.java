package com.bh.Service;

import com.bh.VO.UserVO;

public interface IF_userService {

	public void insert(UserVO uservo) throws Exception;

	public UserVO userOne(String id)throws Exception;

}
