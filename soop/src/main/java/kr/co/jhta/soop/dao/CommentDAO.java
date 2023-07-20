package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.CommentDTO;

@Repository
@Mapper
public interface CommentDAO {
	
	public List<CommentDTO> selectAll();
	
	public CommentDTO selectOne(int commentNo);

	public void insertOne(CommentDTO dto);

	public void updateOne(CommentDTO dto);

	public void deleteOne(int commentNo);
	
	

}
