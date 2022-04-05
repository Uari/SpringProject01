package com.bh.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bh.DAO.IF_BBEDAO;
import com.bh.VO.BBEVO;
import com.bh.VO.JoinVO;

@Service
public class IF_BBEServiceImpl implements IF_BBEService{

	@Inject
	private IF_BBEDAO bbedao;
	
	@Override
	public List<BBEVO> bbeselectAll() throws Exception {

		return bbedao.bbeselectALL(); 
	}

	@Override
	public BBEVO selectone(String no) throws Exception {
		return bbedao.select_one(no);
	}

	@Override
	public void reservationtaxi(BBEVO bbevo) throws Exception {
		bbedao.reservationtaxi(bbevo);
	}

	@Override
	public BBEVO bbeselectOne(String u_id) throws Exception {
		return bbedao.bbeselectOne(u_id);
	}

	@Override
	public void returntaxi(String u_id) throws Exception {
		bbedao.returntaxi(u_id);
	}

	@Override
	public List<JoinVO> history(String u_id) throws Exception {
		return bbedao.history(u_id);
	}
}
