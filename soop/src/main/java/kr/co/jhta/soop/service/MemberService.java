package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.MemberDTO;

public interface MemberService {

	public List<MemberDTO> selectAll();

	public MemberDTO selectOne(int member_no);
	
	public String selectOneByEmail(String email);
	
	public MemberDTO selectMemberByEmail(String email);
	
	
	public void insertOne(MemberDTO dto);

	public void updateOne(MemberDTO dto);
	
	public void updateOneName(MemberDTO dto);
	
	public void updateOneProfile(MemberDTO dto);

	public void deleteOne(int member_no);
	
	public void insertRole(String email);
	
	

}
