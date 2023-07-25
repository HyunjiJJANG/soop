package kr.co.jhta.soop.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.MemoMemberDTO;

@Repository
@Mapper
public interface MemoMemberDAO {
	public MemoMemberDTO selectOne(int member_no);
	public void insertOne(MemoMemberDTO dto);
	public void updateOne(MemoMemberDTO dto);
}
