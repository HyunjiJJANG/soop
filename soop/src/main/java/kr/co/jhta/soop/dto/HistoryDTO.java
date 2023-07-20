package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data

public class HistoryDTO {
	
	
	private int historyNo;
	private int taskNo;
	private String historyType;
	private String historyRegisterDate;
	private String historyContent;
	

}
