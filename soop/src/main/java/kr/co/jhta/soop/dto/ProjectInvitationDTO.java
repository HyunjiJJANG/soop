package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProjectInvitationDTO {

	private int invitation_no;
	private int member_no;
	private int project_no;
	private String invitation_email;
	private int invitation_code;
	private String invitation_validTime;
	private int invitation_success;
	
	
}

