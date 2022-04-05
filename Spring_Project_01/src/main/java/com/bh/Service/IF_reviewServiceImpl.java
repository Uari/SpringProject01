package com.bh.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bh.DAO.IF_reviewDAO;
import com.bh.VO.PageVO;
import com.bh.VO.ReviewVO;

@Service
public class IF_reviewServiceImpl implements IF_reviewService{
	@Inject 
	private IF_reviewDAO reviewdao;
	
	@Override
	public void reviewInsert(ReviewVO reviewvo) throws Exception {
		reviewdao.reviewInsert(reviewvo);
	}

	@Override
	public List<ReviewVO> selectAll(PageVO pagevo) throws Exception {
		
		return reviewdao.reviewSelectAll(pagevo);
	}
	@Override
	public int reviewcnt() throws Exception {

		return reviewdao.reviewcnt();
	}

	@Override
	public void reviewDel(int no) throws Exception {
		reviewdao.reviewDel(no);
	}
}
