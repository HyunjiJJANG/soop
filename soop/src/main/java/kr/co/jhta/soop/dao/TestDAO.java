package kr.co.jhta.soop.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.TestDTO;

@Repository
@Mapper
public interface TestDAO {
	
	public TestDTO getOne();

}
