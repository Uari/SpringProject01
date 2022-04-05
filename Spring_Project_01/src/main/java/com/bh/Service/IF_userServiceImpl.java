package com.bh.Service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bh.DAO.IF_userDAO;
import com.bh.VO.UserVO;

@Service
public class IF_userServiceImpl implements IF_userService{
	@Inject
	private IF_userDAO userdao;

	@Override
	public void insert(UserVO uservo) throws Exception {
		userdao.insert(uservo);
	}

	@Override
	public UserVO userOne(String id) throws Exception{
		return userdao.userOne(id);
	}
}
