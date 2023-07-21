package kr.co.jhta.soop.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.soop.dto.MemberDTO;
import kr.co.jhta.soop.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	 @Autowired
	 private JavaMailSender javaMailSender;
	 

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

	@GetMapping("/emailCheck")
	public @ResponseBody String emailCheck(@RequestParam("email")String email) {
		System.out.println("ajax로 넘어온 email : "+ email);
		String result = memberService.selectOneByEmail(email);	
		System.out.println("db에서 넘어온 result 메세지 : "+ result);
		return result;

	}
	@GetMapping("/mailCheck")
	public @ResponseBody String mailCheck(@RequestParam("email")String email) {
		
		String result = "";
		
		return result;
	}

}
