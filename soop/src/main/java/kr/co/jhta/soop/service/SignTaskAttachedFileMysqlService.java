package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.SignTaskAttachedFileDAO;
import kr.co.jhta.soop.dao.TaskAttachedFileDAO;
import kr.co.jhta.soop.dto.SignTaskAttachedFileDTO;
import kr.co.jhta.soop.dto.TaskAttachedFileDTO;

@Service
public class SignTaskAttachedFileMysqlService implements SignTaskAttachedFileService {

	
	@Autowired
	SignTaskAttachedFileDAO dao;
	
	public List<SignTaskAttachedFileDTO> selectAll() {
		return dao.selectAll();
	}
	
}
