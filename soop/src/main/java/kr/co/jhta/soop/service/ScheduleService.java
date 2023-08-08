package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.ScheduleDTO;

public interface ScheduleService {
	
	public List<ScheduleDTO> selectAll(int member_no);
	
	public ScheduleDTO selectOne(int schedule_no);
	
	public void insertOne(ScheduleDTO dto);
	
	public void deleteOne(int schedule_no);
}
