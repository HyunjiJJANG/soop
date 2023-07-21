package kr.co.jhta.soop.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GanttController {
	
	@GetMapping("/gantt")
	public String gantt() {
		return "gantt";
	}

}
