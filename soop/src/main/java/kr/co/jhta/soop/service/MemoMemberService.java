package kr.co.jhta.soop.service;

import kr.co.jhta.soop.dto.MemoMemberDTO;

public interface MemoMemberService {
	public MemoMemberDTO selectOne(int member_no);
	public void insertOne(MemoMemberDTO dto);
	public void updateOne(MemoMemberDTO dto);
}
