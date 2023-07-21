package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.AttachedFileDTO;

public interface AttachedFileService {
	
public List<AttachedFileDTO> selectAll();
	
	public AttachedFileDTO selectOne(int fileNo);
	
	public void insertOne(AttachedFileDTO dto);
	
	public void updateOne(AttachedFileDTO dto);
	
	public void deleteOne(int fileNo);

}