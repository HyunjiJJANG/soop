package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.service.FeedFileService;
import kr.co.jhta.soop.service.FeedTaskService;

@Controller
public class FeedController {
	@Autowired
	FeedTaskService feedTaskService;
	
//	@Autowired
//	FeedFileService feedFileService;
	
	// side nav에 프로젝트명 클릭하면 프로젝트 피드 화면으로 이동
	@GetMapping("/feed")
	public String goFeed(@RequestParam("project_no")int project_no,
						 Model model) {
		model.addAttribute("feedTaskDTO", feedTaskService.selectAllFeedTaskByPno(project_no));
//		model.addAttribute("feedTaskNo", feedTaskService.selectAllTaskNoByPno(project_no));
//		model.addAttribute("feedFileDTO", feedFileService.selectAllFeedFileByPno(project_no));
		return "feed";
	}
}
