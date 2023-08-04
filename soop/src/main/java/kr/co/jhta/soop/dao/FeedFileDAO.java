package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.FeedFileDTO;

@Repository
@Mapper
public interface FeedFileDAO {

	List<FeedFileDTO> selectAllFeedFileByPno(int project_no);
	
}
