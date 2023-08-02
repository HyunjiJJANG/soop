package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.ScheduleDTO;


@Repository
@Mapper
public interface ScheduleDAO {
	
	public List<ScheduleDTO> selectAll(int member_no);
	
	public ScheduleDTO selectOne(int schedule_no);
	
	public void insertOne(ScheduleDTO dto);
	
	public void deleteOne(int schedule_no);
}
