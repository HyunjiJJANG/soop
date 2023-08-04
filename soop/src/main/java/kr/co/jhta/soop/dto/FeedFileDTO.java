package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FeedFileDTO {
	// project 테이블
	private int project_no;
	
	// task 테이블
	private int task_no;
	
	// attached_file 테이블
	private int file_no;
	private String file_type;
	private String file_name;
	private String file_path;
}
