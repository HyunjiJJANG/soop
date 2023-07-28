package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.ProjectInvitationDTO;
import kr.co.jhta.soop.dto.MemberProjectProjectmemberDTO;

@Repository
@Mapper
public interface MemberProjectProjectmemberDAO {
	
	public List<MemberProjectProjectmemberDTO> selectAllbyprojectno(int project_no);
	
}
