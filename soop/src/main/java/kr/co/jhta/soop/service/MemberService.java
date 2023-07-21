package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.MemberDTO;

public interface MemberService {

	public List<MemberDTO> selectAll();

	public MemberDTO selectOne(int memberNo);

	public void insertOne(MemberDTO dto);

	public void updateOne(MemberDTO dto);

	public void deleteOne(int memberNo);

}
