package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data

// 로그인시 자신의 프로젝트만 보이게하기 위해 만듬
public class ProjectTaskMemberDTO {
	
	// project 테이블
	private int project_no;
	private String project_title;
	private String project_description;
	private	String project_start_date;
	private String project_end_Date;
	private int project_status;
	private String color;
	
	// task 테이블
	private int task_no;
	private int member_no;
	private String task_title;
	private String task_register_date;
	private String task_content;
	private int task_status;
	private String task_start_date;
	private String task_end_date;
	
	// member 테이블
	private String email;
	private String password;
	private String name;
	private String profile_name;
	private String profile_path;
	
	
	
}
