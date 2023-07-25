package kr.co.jhta.soop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.MemoMemberDAO;
import kr.co.jhta.soop.dto.MemoMemberDTO;

@Service
public class MemoMemberMysqlService implements MemoMemberService{
	@Autowired
	MemoMemberDAO dao;

	@Override
	public MemoMemberDTO selectOne(int member_no) {
		
		return dao.selectOne(member_no);
	}

	@Override
	public void insertOne(MemoMemberDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(MemoMemberDTO dto) {
		dao.updateOne(dto);
		
	}
	
	
}
