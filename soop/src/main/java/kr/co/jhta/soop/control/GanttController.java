package kr.co.jhta.soop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.soop.dto.ProjectDTO;
import kr.co.jhta.soop.dto.ProjectTaskMemberDTO;
import kr.co.jhta.soop.service.ProjectService;
import kr.co.jhta.soop.service.ProjectTaskMemberService;
import lombok.extern.slf4j.Slf4j;

@Controller
public class GanttController {
	
	@Autowired
	ProjectService PJservice;
	
	@Autowired
	ProjectTaskMemberService PTMservice;
	
	@GetMapping("/gantt")
	public String myProject(Model model) {
		//model.addAttribute("list", PJservice.selectAll());
		return "gantt";
	}
	
	@GetMapping("/data")
	@ResponseBody	
	public List<ProjectDTO> getData(Model model) {
//		model.addAttribute("list", PJservice.selectAll());
		List<ProjectDTO>  list = PJservice.selectAll();
		System.out.println("list : " + list);
		model.addAttribute("list", PTMservice.projectByMemberName());

		return PJservice.selectAll();

	}
	
	
	

}
