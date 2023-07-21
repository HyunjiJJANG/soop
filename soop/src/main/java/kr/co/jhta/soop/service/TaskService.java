package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.TaskDTO;

public interface TaskService {
	
	public List<TaskDTO> selectAll();

	public TaskDTO selectOne(int taskNo);

	public void insertOne(TaskDTO dto);

	public void updateOne(TaskDTO dto);

	public void deleteOne(int taskNo);

	

}