package kr.co.jhta.soop.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.dto.ProjectDTO;
import kr.co.jhta.soop.dto.ProjectMemberDTO;
import kr.co.jhta.soop.dto.ProjectMemberNo;
import kr.co.jhta.soop.service.FeedService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.FeedTaskService;
import kr.co.jhta.soop.service.ProjectMemberService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberMysqlService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.ProjectService;
import lombok.extern.slf4j.Slf4j;
import kr.co.jhta.soop.service.TaskService;

@Controller
public class ProjectController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProjectService projectService;

	@Autowired
	ProjectMemberService projectMemberService;

	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
//	
//	// home화면 들어가면 side nav에 프로젝트 목록 띄워주기
//	@GetMapping("/home")
//	public String getMyAllProject(@RequestParam("member_no")int member_no,
//								  Model model) {
//		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
//		return "home";
//	}
	
	// side nav의 프로젝트 생성 버튼 누르면 프로젝트 생성하기
	@PostMapping("/createProject")
	public String addProject(@RequestParam(value="project_no", defaultValue="10")int project_no,
						 	 @RequestParam("project_title")String project_title,
						 	 @RequestParam("project_description")String project_description,
						 	 @RequestParam("project_start_date")String project_start_date,
						 	 @RequestParam("project_end_date")String project_end_date,
						 	 @RequestParam("member_no")int member_no) {
		
		ProjectDTO projectDto = new ProjectDTO();
		projectDto.setProject_no(project_no);
		projectDto.setProject_title(project_title);
		projectDto.setProject_description(project_description);
		projectDto.setProject_start_date(project_start_date);
		projectDto.setProject_end_Date(project_end_date);
		projectService.insertOne(projectDto);
		
		ProjectMemberDTO projectMemberDto = new ProjectMemberDTO();
		projectMemberDto.setMember_no(member_no);
		projectMemberDto.setProject_no(project_no);
		projectMemberService.insertOne(projectMemberDto);
		
		return "feed"; // 생성 완료하면 해당 프로젝트의 피드로 이동
	}
	
	// 프로젝트에 멤버 강퇴 클릭시 멤버 삭제
	@GetMapping("/deleteMemberOne")
	public String deleteMemberOne(@RequestParam("project_no")int project_no,
			 					  @RequestParam("member_no")int member_no,
			 					  HttpSession session) {
		ProjectMemberNo pmno = new ProjectMemberNo();
		pmno.setMember_no(member_no);
		pmno.setProject_no(project_no);
		projectMemberService.deleteOne(pmno);
		int member_no2 = (int) session.getAttribute("member_no"); // 접속중인 프로젝트 멤버번호
		
		return "redirect:feed?project_no="+project_no+"&member_no="+member_no2;
	}
	
	// 프로젝트 관리자 변경 클릭시 관리자 변경
	@GetMapping("/changeAuthMember")
	public String changeAuthMember(@RequestParam("project_no") int project_no,
			@RequestParam("member_no") int member_no,
			HttpSession session) {
		
		ProjectMemberNo pmno = new ProjectMemberNo();
		pmno.setMember_no(member_no);
		pmno.setProject_no(project_no);
		projectMemberService.changeAuth1(project_no); // 전체 멤버 member_position 1로
		projectMemberService.changeAuth2(pmno); // 선택한 멤버 프로젝트 관리자로

		int member_no2 = (int) session.getAttribute("member_no"); // 프로젝트 관리자 번호
		
		return "redirect:feed?project_no=" + project_no + "&member_no=" + member_no2;
	}
	
}
