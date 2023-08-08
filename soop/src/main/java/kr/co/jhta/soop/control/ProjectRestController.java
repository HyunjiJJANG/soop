package kr.co.jhta.soop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.soop.dto.FeedDTO;
import kr.co.jhta.soop.dto.ProjectProjectMemberMemberDTO;
import kr.co.jhta.soop.service.FeedService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;

@RestController
public class ProjectRestController {
	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
	@Autowired
	FeedService feedService;
	
	// 메인페이지 대시보드에 참여 중인 프로젝트 리스트
	@GetMapping(value="/home/selectStatus/{member_no}", produces= MediaType.APPLICATION_JSON_VALUE)
	public List<ProjectProjectMemberMemberDTO> projectShow(@PathVariable("member_no") int member_no) {
		
		List<ProjectProjectMemberMemberDTO> list  = projectProjectMemberMemberService.selectAllProjectTitle(member_no);
		
		return list ;
	}
	
	// 메인페이지 대시보드에 파일함 리스트
	@GetMapping(value="/home/selectFile/{member_no}", produces= MediaType.APPLICATION_JSON_VALUE)
	public List<FeedDTO> fileShow(@PathVariable("member_no") int member_no) {
		
		List<FeedDTO> flist  = feedService.selectAllProjectFile(member_no);

		return flist ;
	}
}
