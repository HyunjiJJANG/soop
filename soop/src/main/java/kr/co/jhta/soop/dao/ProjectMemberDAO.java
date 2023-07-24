package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.ProjectMemberDTO;

@Repository
@Mapper
public interface ProjectMemberDAO {

	public List<ProjectMemberDTO> selectAll();

	public ProjectMemberDTO selectOne(int member_no);

	public void insertOne(ProjectMemberDTO dto);

	public void updateOne(ProjectMemberDTO dto);

	public void deleteOne(int member_no);

}
