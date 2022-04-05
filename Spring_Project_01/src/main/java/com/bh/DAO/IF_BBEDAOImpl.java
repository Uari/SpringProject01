package com.bh.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bh.VO.BBEVO;
import com.bh.VO.JoinVO;

@Repository
public class IF_BBEDAOImpl implements IF_BBEDAO{

	@Inject
	private SqlSession sqlsession;
	private static String mapperquery = "com.bh.DAO.IF_BBEDAO";
	
	@Override
	public List<BBEVO> bbeselectALL() throws Exception {
		return sqlsession.selectList(mapperquery+".bbeselectAll");
	}

	@Override
	public BBEVO select_one(String no) throws Exception {
		return sqlsession.selectOne(mapperquery+".selectOne", no);
	}

	@Override
	public void reservationtaxi(BBEVO bbevo) throws Exception {
		sqlsession.update(mapperquery+".reservationtaxi", bbevo);
	}

	@Override
	public BBEVO bbeselectOne(String u_id) throws Exception {
		return sqlsession.selectOne(mapperquery+".bbeselectOne", u_id);
	}

	@Override
	public void returntaxi(String u_id) throws Exception {
		sqlsession.update(mapperquery+".returntaxi", u_id);
	}

	@Override
	public List<JoinVO> history(String u_id) throws Exception {
		return sqlsession.selectList(mapperquery+".history", u_id);
	}
}
