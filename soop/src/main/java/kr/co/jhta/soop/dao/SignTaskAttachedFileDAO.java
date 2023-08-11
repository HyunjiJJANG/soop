package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.SignTaskAttachedFileDTO;

@Repository
@Mapper
public interface SignTaskAttachedFileDAO {
	
	public List<SignTaskAttachedFileDTO> selectAll();
	
}
