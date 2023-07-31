package kr.co.jhta.soop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.soop.dto.MemberProjectProject_MemberDTO;
import kr.co.jhta.soop.dto.ProjectDTO;
import kr.co.jhta.soop.dto.ProjectTaskMemberDTO;
import kr.co.jhta.soop.service.MemberProjectProject_MemberService;
import kr.co.jhta.soop.service.ProjectService;
import kr.co.jhta.soop.service.ProjectTaskMemberService;
import lombok.extern.slf4j.Slf4j;

@Controller
public class GanttController {
	
	@Autowired
	ProjectService PJservice;
	
	@Autowired	
	MemberProjectProject_MemberService MPPservice;
	
	@Autowired
	ProjectTaskMemberService PTMservice;
	
	@GetMapping("/gantt")
	public String myProject(
			Model model,
			@RequestParam("member_no")int member_no) { // @RequestParam("member_no")int member_no 추가하기 -1
				
		model.addAttribute("no", member_no); // test 후 member_no 로변경하기 -2
		
		return "gantt";
	}
		
	@GetMapping("/data")
	@ResponseBody	// 직접 브라우저에 출력해 
	public List<MemberProjectProject_MemberDTO> getData(
			Model model,
			@RequestParam("member_no")int member_no) {
		
//		model.addAttribute("list", PJservice.selectAll());
//		List<ProjectDTO>  list = PJservice.selectAll();
//		System.out.println("list : " + list);
		
		model.addAttribute("no", member_no);
		
		
		model.addAttribute("list", MPPservice.myproject_SelectAll(member_no));
		List<MemberProjectProject_MemberDTO> list = MPPservice.myproject_SelectAll(member_no);
		System.out.println("list : " + list);

		return MPPservice.myproject_SelectAll(member_no);

	}
	
	@GetMapping("/taskdata")
	@ResponseBody
	public List<ProjectTaskMemberDTO> getTaskData(
			Model model,
			@RequestParam("member_no")int member_no){
		
		model.addAttribute("list", PTMservice.myproject_Select_task(member_no));
		
		
		return PTMservice.myproject_Select_task(member_no);
	}
	
	

}
