package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.SignDTO;

public interface SignService {

	public List<SignDTO> selectAll();

	public SignDTO selectOne(int sign_no);

	public void insertOne(SignDTO dto);

	public void updateOne(SignDTO dto);

	public void deleteOne(int sign_no);
	
	public List<SignDTO> selectAllSignByTno(int task_no);

}
