package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.service.FeedTaskService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.ProjectService;

@Controller
public class FeedController {
	
	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	FeedTaskService feedTaskService;
	
	// side nav에 프로젝트명 클릭하면 해당 프로젝트 피드 화면으로 이동
	@GetMapping("/feed")
	public String goFeed(@RequestParam("project_no")int project_no,
						 @RequestParam("member_no")int member_no,
						 Model model) {
		// side nav에 해당 회원이 참여중인 프로젝트 리스트 보여주기
		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
		
		// 피드 페이지 상단에 프로젝트 제목 보여주기
		model.addAttribute("projectDTO", projectService.selectOne(project_no));
		
		// 해당 프로젝트의 업무 관련 항목들을 카드 형식 리스트로 보여주기
		model.addAttribute("feedTaskDTO", feedTaskService.selectAllFeedTaskByPno(project_no));
		
		// 오른쪽 퀵메뉴에 프로젝트에 참여중인 멤버 리스트 보여주기
		model.addAttribute("pjmemberList", projectProjectMemberMemberService.selectAllProjectMemberByPno(project_no));
		
		return "feed";
	}
}
