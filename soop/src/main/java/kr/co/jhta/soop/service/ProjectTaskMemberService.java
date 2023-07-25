package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.ProjectTaskMemberDTO;

public interface ProjectTaskMemberService {
	
	public List<ProjectTaskMemberDTO> myproject_SelectAll(int member_no);

}
