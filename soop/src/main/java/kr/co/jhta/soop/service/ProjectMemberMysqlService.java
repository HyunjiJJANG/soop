package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.ProjectMemberDAO;
import kr.co.jhta.soop.dto.ProjectMemberDTO;


@Service
public class ProjectMemberMysqlService implements ProjectMemberService {

	
	@Autowired
	ProjectMemberDAO dao;
	@Override
	public List<ProjectMemberDTO> selectAll() {

		return dao.selectAll();
	}

	@Override
	public ProjectMemberDTO selectOne(int memberNo) {
		return dao.selectOne(memberNo);
	}

	@Override
	public void insertOne(ProjectMemberDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(ProjectMemberDTO dto) {
		dao.updateOne(dto);
		
	}

	@Override
	public void deleteOne(int memberNo) {
		dao.deleteOne(memberNo);
		
	}

}
