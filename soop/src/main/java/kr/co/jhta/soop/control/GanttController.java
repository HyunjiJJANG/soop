package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jhta.soop.service.ProjectService;

@Controller
public class GanttController {
	
	@Autowired
	ProjectService service;
	
	@GetMapping("/gantt")
	public String myProject(Model model) {
		model.addAttribute("list", service.selectAll());
		return "gantt";
	}
	
	

}
