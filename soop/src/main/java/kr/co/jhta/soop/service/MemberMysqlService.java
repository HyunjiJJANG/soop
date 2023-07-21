package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.MemberDAO;
import kr.co.jhta.soop.dto.MemberDTO;

@Service
public class MemberMysqlService implements MemberService{

	
	@Autowired
	MemberDAO dao;
	@Override
	public List<MemberDTO> selectAll() {

		return dao.selectAll();
	}

	@Override
	public MemberDTO selectOne(int memberNo) {
		return dao.selectOne(memberNo);
	}

	@Override
	public void insertOne(MemberDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(MemberDTO dto) {
		dao.updateOne(dto);
		
	}

	@Override
	public void deleteOne(int memberNo) {
		dao.deleteOne(memberNo);
		
	}

}