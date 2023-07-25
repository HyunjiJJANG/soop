package kr.co.jhta.soop.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	
	@GetMapping("/home")
	public String main(Model model) {
		return "home";
	}
<<<<<<< HEAD
	
	@GetMapping("/feed")
	public String main2(Model model) {
		return "feed";
=======

	@GetMapping("/test")
	public String main1(Model model) {
		return "test";
>>>>>>> refs/remotes/origin/seulki
	}
	
}
