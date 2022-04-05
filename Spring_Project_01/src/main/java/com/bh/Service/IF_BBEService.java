package com.bh.Service;

import java.util.List;

import com.bh.VO.BBEVO;
import com.bh.VO.JoinVO;

public interface IF_BBEService {

	public List<BBEVO> bbeselectAll() throws Exception;

	public BBEVO selectone(String no) throws Exception;

	public void reservationtaxi(BBEVO bbevo) throws Exception;

	public BBEVO bbeselectOne(String u_id) throws Exception;

	public void returntaxi(String u_id) throws Exception;
	
	public List<JoinVO> history(String u_id) throws Exception;
}
