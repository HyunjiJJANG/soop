package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class AttachedFileDTO {
	
	private int file_no;
	private int task_no;
	private String fileType;
	private String fileName;
	private String filePath;
	private String fileRegisterDate;
	

}

