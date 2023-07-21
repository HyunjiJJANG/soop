package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.SignDAO;
import kr.co.jhta.soop.dto.SignDTO;

@Service
public class SignMysqlService implements SignService {

	
	@Autowired
	SignDAO dao;
	
	@Override
	public List<SignDTO> selectAll() {

		return dao.selectAll();
	}

	@Override
	public SignDTO selectOne(int signNo) {
		return dao.selectOne(signNo);
	}

	@Override
	public void insertOne(SignDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(SignDTO dto) {
		dao.updateOne(dto);
		
	}

	@Override
	public void deleteOne(int signNo) {
		dao.deleteOne(signNo);
		
	}

}