package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.SignDTO;

public interface SignMemberService {
	
	public List<SignDTO> selectAllSignByTno(int task_no);
	
}
