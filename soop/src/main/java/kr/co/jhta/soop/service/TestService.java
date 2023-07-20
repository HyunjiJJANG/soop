package kr.co.jhta.soop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.TestDAO;
import kr.co.jhta.soop.dto.TestDTO;

@Service
public class TestService implements TService{
	
	@Autowired
	private TestDAO dao;
	
	public TestDTO getOne() {
		
		return dao.getOne();
	}

}
