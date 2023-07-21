package kr.co.jhta.soop.control;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.jhta.soop.dto.MemberDTO;
import kr.co.jhta.soop.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/clogin")
	public String login() {
		
		return "login/login";
	}
	
	
	@GetMapping("/clogout")
	public String logout() {
		
		return "login/logout";
	}
	
	
	@GetMapping("/register")
	public String registerForm() {
		
		return "login/register";
	}
	
	@PostMapping("/registerOk")
	public String registerOk(Model model, HttpServletRequest req, @ModelAttribute MemberDTO memberDto) {
		
		memberService.insertOne(memberDto);
		
		
		return "redirect:/clogin";
	}
	
	
//	@GetMapping("/idCheck")
//	public String idCheck() {
//		
//		
//		
//	}

}
