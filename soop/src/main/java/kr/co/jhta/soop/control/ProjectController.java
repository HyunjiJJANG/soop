package kr.co.jhta.soop.control;

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
import kr.co.jhta.soop.service.FeedTaskService;
import kr.co.jhta.soop.service.ProjectMemberService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.ProjectService;
import kr.co.jhta.soop.service.TaskService;

@Controller
public class ProjectController {
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
	

	
}
