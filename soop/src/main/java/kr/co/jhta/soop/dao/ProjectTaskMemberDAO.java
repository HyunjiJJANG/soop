package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.ProjectTaskMemberDTO;

@Repository
@Mapper

public interface ProjectTaskMemberDAO {

	// 로그인 시 내가 참여하는 프로젝트 모두 보여주는 용도
	public List<ProjectTaskMemberDTO> myproject_SelectAll(int member_no);
	
}