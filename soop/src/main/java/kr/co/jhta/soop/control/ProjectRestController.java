package kr.co.jhta.soop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.soop.dto.ProjectProjectMemberMemberDTO;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;

// localhost:8081/home/selectStatus?member_no=1

@RestController
public class ProjectRestController {
	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
	@GetMapping(value="/home/selectStatus/{member_no}", produces= MediaType.APPLICATION_JSON_VALUE)
	public List<ProjectProjectMemberMemberDTO> projectShow(@PathVariable("member_no") int member_no) {
		
		List<ProjectProjectMemberMemberDTO> list  = 
				projectProjectMemberMemberService.selectAllProjectTitle(member_no);
		
		return list ;
	}
	
	
}
