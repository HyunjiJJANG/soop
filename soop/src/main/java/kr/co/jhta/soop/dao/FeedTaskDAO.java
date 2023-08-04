package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.FeedTaskDTO;

@Repository
@Mapper
public interface FeedTaskDAO {

	List<FeedTaskDTO> selectAllFeedTaskByPno(int project_no);

	List<FeedTaskDTO> selectAllTaskNoByPno(int project_no);

}
