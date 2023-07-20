package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.ProjectDTO;

public interface ProjectService {
	public List<ProjectDTO> selectAll();

	public ProjectDTO selectOne(int projectNo);

	public void insertOne(ProjectDTO dto);

	public void updateOne(ProjectDTO dto);

	public void deleteOne(int projectNo);
}
