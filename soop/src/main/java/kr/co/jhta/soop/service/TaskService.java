package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.TaskDTO;

public interface TaskService {
	
	public List<TaskDTO> selectAll(int project_no);

	public TaskDTO selectOne(int task_no);

	public void insertOne(TaskDTO dto);

	public void updateOne(TaskDTO dto);

	public void deleteOne(int task_no);

	

}
