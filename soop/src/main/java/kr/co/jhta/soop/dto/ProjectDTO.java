package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProjectDTO {
	
	private int projectNo;
	private String projectTitle;
	private String projectDescription;
	private	String projectStartDate;
	private String projectEndDate;
	private int projectStatus;
	private String color;

}
