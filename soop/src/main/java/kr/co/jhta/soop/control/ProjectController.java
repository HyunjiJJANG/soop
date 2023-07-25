package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.dto.ProjectDTO;
import kr.co.jhta.soop.service.ProjectService;

@Controller
@RequestMapping("/soop")
public class ProjectController {
	@Autowired
	ProjectService service;
	
	@PostMapping("/insertProject")
	public String insert(@RequestParam("project_no")int project_no,
						 @RequestParam("project_title")String project_title,
						 @RequestParam("project_description")String project_description,
						 @RequestParam("project_start_date")String project_start_date,
						 @RequestParam("project_end_date")String project_end_date) {
		ProjectDTO dto = new ProjectDTO();
		dto.setProject_no(project_no);
		dto.setProject_title(project_title);
		dto.setProject_description(project_description);
		dto.setProject_start_date(project_start_date);
		dto.setProject_end_Date(project_end_date);
		dto.setProject_status(0);
		dto.setColor("#1ABC9C");
		service.insertOne(dto);
		return "feed"; // 생성 완료하면 해당 프로젝트의 피드로 이동
	}
	
}
