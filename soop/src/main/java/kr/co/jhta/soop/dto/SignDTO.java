package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class SignDTO {
	
	private int signNo;
	private int taskNo;
	private int memberNo;
	private int signStep;
	private String signApprover;
	private int signStatus;
	private String signDate;
	
	

}
