package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.service.FeedTaskService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.ProjectService;
import kr.co.jhta.soop.service.SignService;
import kr.co.jhta.soop.util.Criteria;
import kr.co.jhta.soop.util.Pagenation;

@Controller
public class FeedController {
	
	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	FeedTaskService feedTaskService;
	
	@Autowired
	SignService signService;
	
	// side nav에 프로젝트명 클릭하면 해당 프로젝트 업무 리스트가 있는 피드로 이동
    @GetMapping("/feed")
    public String list(@RequestParam("project_no")int project_no,
			 	 	   @RequestParam("member_no")int member_no,
			 	 	   @RequestParam(name="page",defaultValue="1")int page,
			 	 	   Model model, Criteria criteria) {
        
		// side nav에 해당 회원이 참여중인 프로젝트 리스트 보여주기
		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
		
		// 피드 페이지 상단에 프로젝트 제목 보여주기
		model.addAttribute("projectDTO", projectService.selectOne(project_no));
		
		// 오른쪽 퀵메뉴에 프로젝트에 참여중인 멤버 리스트 보여주기
		model.addAttribute("pjmemberList", projectProjectMemberMemberService.selectAllProjectMemberByPno(project_no));
    	
		// 메인 화면에 해당 프로젝트의 업무 리스트 보여주기
        Pagenation pageNation = new Pagenation();
        pageNation.setCriteria(criteria);
        pageNation.setTotalCount(feedTaskService.totalCount(project_no));       
        criteria.setProject_no(project_no);       
        model.addAttribute("pno", project_no);
        model.addAttribute("mno", member_no);
        model.addAttribute("feedListDTO", feedTaskService.selectAllTaskListByPno(criteria));
        model.addAttribute("pagenation", pageNation);
        
        return "feed";
    }
	
	// 업무 리스트에서 업무 제목 클릭하면 업무 상세 페이지로 이동
    @GetMapping("/taskDetail")
    public String taskDetail(@RequestParam("project_no")int project_no,
	 	 	   				 @RequestParam("member_no")int member_no,
	 	 	   				 @RequestParam("task_no")int task_no,
	 	 	   				 Model model) {
		// side nav에 해당 회원이 참여중인 프로젝트 리스트 보여주기
		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
		
		// 피드 페이지 상단에 프로젝트 제목 보여주기
		model.addAttribute("projectDTO", projectService.selectOne(project_no));
		
		// 오른쪽 퀵메뉴에 프로젝트에 참여중인 멤버 리스트 보여주기
		model.addAttribute("pjmemberList", projectProjectMemberMemberService.selectAllProjectMemberByPno(project_no));
		
    	// 메인 화면에 해당 업무 상세 보여주기
    	model.addAttribute("feedTaskDTO", feedTaskService.selectOneTaskDetailByTno(task_no));
    	model.addAttribute("signDTO", signService.selectAllSignByTno(task_no));
        model.addAttribute("pno", project_no);
        model.addAttribute("mno", member_no);
    	
    	return "taskDetail";
    	
    }

}
