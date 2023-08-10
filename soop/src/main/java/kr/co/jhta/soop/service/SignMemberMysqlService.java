package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.SignMemberDAO;
import kr.co.jhta.soop.dto.SignDTO;

@Service
public class SignMemberMysqlService implements SignMemberService {
	
	@Autowired
	SignMemberDAO dao;
	
	@Override
	public List<SignDTO> selectAllSignByTno(int task_no) {
		return dao.selectAllSignByTno(task_no);
	}

}
