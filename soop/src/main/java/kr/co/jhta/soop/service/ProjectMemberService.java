package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.ProjectMemberDTO;

public interface ProjectMemberService {

	public List<ProjectMemberDTO> selectAll();

	public ProjectMemberDTO selectOne(int member_no);

	public void insertOne(ProjectMemberDTO dto);

	public void updateOne(ProjectMemberDTO dto);

	public void deleteOne(int member_no);

}
