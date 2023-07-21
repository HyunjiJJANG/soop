package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.SignDTO;

@Repository
@Mapper
public interface SignDAO {
	
	public List<SignDTO> selectAll();

	public SignDTO selectOne(int signNo);

	public void insertOne(SignDTO dto);

	public void updateOne(SignDTO dto);

	public void deleteOne(int signNo);

}