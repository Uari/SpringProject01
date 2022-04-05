package com.bh.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bh.VO.UserVO;

@Repository
public class IF_userDAOImpl implements IF_userDAO {

	@Inject
	private SqlSession sqlSession;
	private static String mapperquery = "com.bh.DAO.IF_userDAO";
	
	@Override
	public void insert(UserVO uservo) throws Exception {
		sqlSession.insert(mapperquery+".insert", uservo);
	}

	@Override
	public UserVO userOne(String id) throws Exception {
		return sqlSession.selectOne(mapperquery+".userOne", id);
	}
}
