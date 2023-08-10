package kr.co.jhta.soop.control;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.soop.service.ProjectTaskMemberService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class KanbanController {
	
	@Autowired
	ProjectTaskMemberService kanban_PTMservice;

	@GetMapping("/kanban")
	public String myKanban(
			Model model,
			@RequestParam("member_no")int member_no 
//			@RequestParam("project_no")int project_no
			) {
//		HashMap<String, Integer> map  = new HashMap<String, Integer>();
//		
//		map.put("member_no", member_no);
//		map.put("project_no", project_no); 
//		
//		model.addAttribute("dto", 
//				kanban_PTMservice.myproject_Select_task(map));
		
		model.addAttribute("dto", kanban_PTMservice.myproject_Select_task(member_no));
		
		
		return "kanban";
	}
	
	@GetMapping("/chageTaskStatus")
	@ResponseBody
	public void changeTask(
			Model model,
			@RequestParam("task_status")int task_status,
			@RequestParam("member_no")int member_no,
			@RequestParam("task_no")int task_no){
						
		log.info("=========================");
		
		log.info(""+task_status);
		
		HashMap<String, Integer> map  = new HashMap<String, Integer>();
						
		map.put("member_no", member_no);
		map.put("task_status", task_status); 
		map.put("task_no", task_no); 
		
		kanban_PTMservice.myprojectUpdateTaskStatus(map);
		
	}
	

}
