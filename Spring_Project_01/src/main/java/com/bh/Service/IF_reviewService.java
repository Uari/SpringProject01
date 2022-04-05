package com.bh.Service;


import java.util.List;

import com.bh.VO.PageVO;
import com.bh.VO.ReviewVO;

public interface IF_reviewService {

	public void reviewInsert(ReviewVO reviewvo) throws Exception;

	public List<ReviewVO> selectAll(PageVO pagevo) throws Exception;

	public int reviewcnt() throws Exception;

	public void reviewDel(int no) throws Exception;

}
