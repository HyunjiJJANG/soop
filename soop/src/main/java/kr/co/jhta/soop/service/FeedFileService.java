package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.FeedFileDTO;

public interface FeedFileService {
	
	List<FeedFileDTO> selectAllFeedFileByPno(int project_no);
	
}
