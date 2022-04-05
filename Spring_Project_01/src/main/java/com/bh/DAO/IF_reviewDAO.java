package com.bh.DAO;

import java.util.List;

import com.bh.VO.PageVO;
import com.bh.VO.ReviewVO;

public interface IF_reviewDAO {

	public void reviewInsert(ReviewVO reviewvo) throws Exception;

	public List<ReviewVO> reviewSelectAll(PageVO pagevo) throws Exception;

	public int reviewcnt() throws Exception;

	public void reviewDel(int no) throws Exception;

}
