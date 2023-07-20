package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.soop.service.TestService;

@Controller
@RequestMapping("/soop")
public class TestController {
	
	
	@Autowired
	TestService service;
	
	@GetMapping("/test")
	public String test(Model model) {
		
		model.addAttribute("list", service.getOne());
		return "test";
	}
	

}
