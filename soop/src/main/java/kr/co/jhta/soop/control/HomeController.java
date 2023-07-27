package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/home")
	public String main(Model model) {
		return "home";
	}

	@GetMapping("/test")
	public String main1(Model model) {
		return "test";
	}
	
}
