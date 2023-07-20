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
	
	private int fileNo;
	private int taskNo;
	private String fileType;
	private String fileName;
	private String filePath;
	private String fileRegisterDate;
	

}

