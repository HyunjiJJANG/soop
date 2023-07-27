package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.dto.MemberDTO;
import kr.co.jhta.soop.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyPageController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("/mypage")
	public String mypage(@RequestParam("member_no")int member_no, @RequestParam("email")String email,Model model) {
		String result = "";
		
		if(member_no == 0 || email == null) {
			
			return "redirect:/clogin";
			
		}else {
			
			MemberDTO memberDto =  memberService.selectMemberByEmail(email);
			model.addAttribute("memberDto",memberDto);
			return "mypage";

		}
		

		
	}

}
