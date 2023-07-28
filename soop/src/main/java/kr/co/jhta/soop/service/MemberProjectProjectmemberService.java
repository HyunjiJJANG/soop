package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dto.MemberProjectProjectmemberDTO;

public interface MemberProjectProjectmemberService {

	List<MemberProjectProjectmemberDTO> selectAllbyprojectno(int project_no);

}
