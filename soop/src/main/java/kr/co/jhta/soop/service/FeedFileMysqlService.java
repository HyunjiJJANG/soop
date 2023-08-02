package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.FeedFileDAO;
import kr.co.jhta.soop.dto.FeedFileDTO;

@Service
public class FeedFileMysqlService implements FeedFileService{

	@Autowired
	private FeedFileDAO dao; 
	
	@Override
	public List<FeedFileDTO> selectAllFeedFileByPno(int project_no) {
		return dao.selectAllFeedFileByPno(project_no);
	}

}
