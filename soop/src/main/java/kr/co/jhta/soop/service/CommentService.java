package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.CommentDTO;

public interface CommentService {

	public List<CommentDTO> selectAll();

	public CommentDTO selectOne(int commentNo);

	public void insertOne(CommentDTO dto);

	public void updateOne(CommentDTO dto);

	public void deleteOne(int commentNo);
}
