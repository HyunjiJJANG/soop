package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.service.FeedTaskService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;

@Controller
public class FeedController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	FeedTaskService feedTaskService;
	
	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
//	@Autowired
//	FeedFileService feedFileService;
	
	// side nav에 프로젝트명 클릭하면 프로젝트 피드 화면으로 이동
	@GetMapping("/feed")
	public String goFeed(@RequestParam("project_no")int project_no,
						 @RequestParam("member_no")int member_no,
						 Model model) {
		model.addAttribute("feedTaskDTO", feedTaskService.selectAllFeedTaskByPno(project_no));
		
		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
		model.addAttribute("project_no", project_no);
		model.addAttribute("name", memberService.selectOneByName(member_no));
		
		return "feed";
	}
}
