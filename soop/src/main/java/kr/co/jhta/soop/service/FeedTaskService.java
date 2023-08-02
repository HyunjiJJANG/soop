package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.FeedTaskDTO;

public interface FeedTaskService {

	List<FeedTaskDTO> selectAllFeedTaskByPno(int project_no);

	List<FeedTaskDTO> selectAllTaskNoByPno(int project_no);
	
}
