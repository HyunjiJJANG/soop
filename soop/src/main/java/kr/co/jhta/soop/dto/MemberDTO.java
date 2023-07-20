package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberDTO {
	
	
	private int memberNo;
	private String email;
	private String password;
	private String name;
	private String profileName;
	private String profilePath;
	
	

}


