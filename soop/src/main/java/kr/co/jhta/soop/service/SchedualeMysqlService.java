package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.ScheduleDAO;
import kr.co.jhta.soop.dto.ScheduleDTO;

@Service
public class SchedualeMysqlService implements ScheduleService{

	@Autowired
	ScheduleDAO dao;
	
	@Override
	public List<ScheduleDTO> selectAll(int member_no) {
		return dao.selectAll(member_no);
	}

	@Override
	public ScheduleDTO selectOne(int schedule_no) {
		return dao.selectOne(schedule_no);
	}

	@Override
	public void insertOne(ScheduleDTO dto) {
		dao.insertOne(dto);
	}

	@Override
	public void deleteOne(int schedule_no) {
		dao.deleteOne(schedule_no);
	}

}
