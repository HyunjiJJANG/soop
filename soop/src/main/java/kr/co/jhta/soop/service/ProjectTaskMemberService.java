package kr.co.jhta.soop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.jhta.soop.dto.ProjectTaskMemberDTO;

public interface ProjectTaskMemberService {
	
	// 로그인 시 내가 참여하는 프로젝트의 업무생선된거 간단하게 보여주는 용도
	public List<ProjectTaskMemberDTO> myproject_Select_task(int member_no);
	
	public List<ProjectTaskMemberDTO> myproject_Select_task(HashMap<String, Integer> map);

	public void myprojectUpdateTaskStatus(HashMap<String, Integer> map);		

}
