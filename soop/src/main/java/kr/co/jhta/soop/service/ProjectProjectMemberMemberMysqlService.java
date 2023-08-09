package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.ProjectProjectMemberMemberDAO;
import kr.co.jhta.soop.dto.ProjectProjectMemberMemberDTO;

@Service
public class ProjectProjectMemberMemberMysqlService implements ProjectProjectMemberMemberService {
	@Autowired
	ProjectProjectMemberMemberDAO projectProjectMemberMemberDAO;
	
	@Override
	public List<ProjectProjectMemberMemberDTO> selectAllProjectTitle(int member_no) {
		return projectProjectMemberMemberDAO.selectAllProjectTitle(member_no);
	}

	@Override
	public List<ProjectProjectMemberMemberDTO> selectAllProjectMember(int project_no) {
		return projectProjectMemberMemberDAO.selectAllProjectMember(project_no);
	}

}
