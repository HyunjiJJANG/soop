package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.service.ProjectTaskMemberService;

@Controller
public class KanbanController {
	
	@Autowired
	ProjectTaskMemberService kanban_PTMservice;

	@GetMapping("/kanban")
	public String myKanban(
			Model model,
			@RequestParam("member_no")int member_no) {
		
		model.addAttribute("dto", kanban_PTMservice.myproject_Select_task(member_no));
		
		return "kanban";
	}

}
