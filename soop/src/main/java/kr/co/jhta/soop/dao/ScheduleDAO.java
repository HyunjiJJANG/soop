package kr.co.jhta.soop.dao;

import java.util.List;

import kr.co.jhta.soop.dto.ScheduleDTO;

public interface ScheduleDAO {
	
	public List<ScheduleDTO> selectAll(int member_no);
	
	public ScheduleDTO selectOne(int schedule_no);
	
	public void insertOne(ScheduleDTO dto);
	
	public void deleteOne(int schedule_no);
}
