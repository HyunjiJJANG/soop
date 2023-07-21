package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class TaskDTO {
	
	private int taskNo;
	private int projectNo;
	private int memberNo;
	private String taskTitle;
	private String taskRegisterDate;
	private String taskContent;
	private int taskStatus;
	private String taskStartDate;
	private String taskEndDate;

}


