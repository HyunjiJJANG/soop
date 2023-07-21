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
	
	private int comment_no;
	private int task_no;
	private int member_no;
	private int parent_comment_no;
	private int comment_level;
	private int coment_content;
	private String coment_register_date;
	
	

}

