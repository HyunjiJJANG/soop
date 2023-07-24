package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.TaskDAO;
import kr.co.jhta.soop.dto.TaskDTO;


@Service
public class TaskMysqlService implements TaskService{

	
	@Autowired 
	TaskDAO dao;
	
	@Override
	public List<TaskDTO> selectAll() {

		return dao.selectAll();
	}

	@Override
	public TaskDTO selectOne(int task_no) {
		return dao.selectOne(task_no);
	}

	@Override
	public void insertOne(TaskDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(TaskDTO dto) {
		dao.updateOne(dto);
		
	}

	@Override
	public void deleteOne(TaskDTO dto) {
		dao.deleteOne(dto);
	}

}
