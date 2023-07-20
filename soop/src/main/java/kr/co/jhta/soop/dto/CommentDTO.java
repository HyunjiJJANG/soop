package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommentDTO {
	
	private int commentNo;
	private int taskNo;
	private int memberNo;
	private int parentCommentNo;
	private int commentLevel;
	private int comentContent;
	private String comentRegisterDate;
	
	

}

