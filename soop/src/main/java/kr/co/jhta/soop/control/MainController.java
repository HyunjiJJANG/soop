package kr.co.jhta.soop.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/soop")
public class MainController {

	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	
}
