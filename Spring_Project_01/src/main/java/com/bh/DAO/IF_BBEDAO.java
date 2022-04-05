package com.bh.DAO;

import java.util.List;

import com.bh.VO.BBEVO;
import com.bh.VO.JoinVO;

public interface IF_BBEDAO {

	public List<BBEVO> bbeselectALL() throws Exception;

	public BBEVO select_one(String no) throws Exception;

	public void reservationtaxi(BBEVO bbevo) throws Exception;

	public BBEVO bbeselectOne(String u_id) throws Exception;

	public void returntaxi(String u_id) throws Exception;

	public List<JoinVO> history(String u_id) throws Exception;
}
