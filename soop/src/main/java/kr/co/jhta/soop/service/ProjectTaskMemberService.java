package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.ProjectTaskMemberDTO;

public interface ProjectTaskMemberService {
	
	// 간트차트에 들어갈 데이터 기입용
	public List<ProjectTaskMemberDTO> projectByMemberName();
	
	// 로그인 시 내가 참여하는 프로젝트 모두 보여주는 용도
	public List<ProjectTaskMemberDTO> myproject_SelectAll(int member_no);

}
