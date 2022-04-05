package com.bh.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bh.VO.PageVO;
import com.bh.VO.ReviewVO;

@Repository
public class IF_reviewDAOImpl implements IF_reviewDAO{
	@Inject 
	private SqlSession session;
	private static String mapperquery = "com.bh.DAO.IF_reviewDAO";

	@Override
	public void reviewInsert(ReviewVO reviewvo) throws Exception {
		session.insert(mapperquery+".reviewInsert", reviewvo);
	}

	@Override
	public List<ReviewVO> reviewSelectAll(PageVO pagevo) throws Exception {
		
		return session.selectList(mapperquery+".reviewSelectAll", pagevo);
	}
	@Override
	public int reviewcnt() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(mapperquery+".reviewcnt");
	}

	@Override
	public void reviewDel(int no) throws Exception {
		session.delete(mapperquery+".reviewDel", no);
	}
}
