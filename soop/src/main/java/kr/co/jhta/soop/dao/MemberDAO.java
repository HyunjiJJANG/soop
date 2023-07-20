package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.MemberDTO;

@Repository
@Mapper
public interface MemberDAO {
	

public List<MemberDTO> selectAll();

public  MemberDTO selectOne(int memberNo);

public void insertOne(MemberDTO dto);

public void updateOne(MemberDTO dto);

public void deleteOne(int memberNo);
	

}
