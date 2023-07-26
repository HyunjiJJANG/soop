package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.ProjectTaskMemberDAO;
import kr.co.jhta.soop.dto.ProjectTaskMemberDTO;

@Service
public class ProjectTaskMemberMysqlService implements ProjectTaskMemberService{

	@Autowired
	ProjectTaskMemberDAO PTMdao;
	
	@Override
	public List<ProjectTaskMemberDTO> myproject_SelectAll(int member_no) {
		
		return PTMdao.myproject_SelectAll(member_no);
	}

	@Override
	public List<ProjectTaskMemberDTO> projectByMemberName() {
		
		return PTMdao.projectByMemberName();
	}

}
