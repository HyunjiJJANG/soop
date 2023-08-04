package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.FeedTaskDAO;
import kr.co.jhta.soop.dto.FeedTaskDTO;

@Service
public class FeedTaskMysqlService implements FeedTaskService {
	@Autowired
	private FeedTaskDAO dao;

	@Override
	public List<FeedTaskDTO> selectAllFeedTaskByPno(int project_no) {
		return dao.selectAllFeedTaskByPno(project_no);
	}

}
