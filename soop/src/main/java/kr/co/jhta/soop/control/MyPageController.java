package kr.co.jhta.soop.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
		
	@GetMapping("/mypagePasswordCheck")
	@ResponseBody
	public String passwordCheck(@RequestParam("password")String password, @RequestParam("email")String email) {
		BCryptPasswordEncoder encoder2 = new BCryptPasswordEncoder();
        
		String result="";
		if(password != null && email != null) {
			MemberDTO memberDto =  memberService.selectMemberByEmail(email);
			String passwordCheck = memberDto.getPassword();
			log.info("마이페이지 비밀번호 확인 이메일 : "+ email);
			log.info("마이페이지 비밀번호 확인 비밀번호 : "+ password);
			log.info("마이페이지에서 회원정보 변경을 위해 받아온 패스워드 : "+ passwordCheck);
			String passwordEncode =  passwordEncoder.encode(password);
			log.info("마이페이지-받아온 패스워드 인코딩 한 값: "+ passwordEncode);
			if(encoder2.matches(password, memberDto.getPassword())) {
				result = "OK";
				return result;
			}else {
				result = "matchesFalse";
				return result;
			}
		}else if(password == null || email == null){
			result = "False";
			return result;
		}
		else
			
			return result;
		
	}
	
	@RequestMapping("/mypagePasswordCheckOk")
	public String mypageOk(@RequestParam("email")String email, @RequestParam("password")String password, Model model){
	
		MemberDTO memberDto = memberService.selectMemberByEmail(email);
		model.addAttribute("memberDto",memberDto);
		
		
		
		
		return "mypagePasswordCheckOk";
	}
	
	
	@GetMapping("/nameChange")
	@ResponseBody
	public String nameChangeOk(@RequestParam("name")String name, @RequestParam("nameView")String nameView,@RequestParam("email")String email ) {
		String result = "";
		if(name == null) {
			result = "name input False";
			return result;
		}else {
			
			MemberDTO memberDto = memberService.selectMemberByEmail(email);
			memberDto.setName(name);
			memberDto.setEmail(email);
			memberService.updateOneName(memberDto);
			result = "OK";
			return result;
			
		}
		
		
		
	}
	
	
	@GetMapping("/passwordChange")
	@ResponseBody
	public String passwordChangeOk(@RequestParam("password")String password, @RequestParam("repeatPw")String repeatPw,@RequestParam("email")String email ) {
		String result = "";
		if(password == null || repeatPw==null ) {
			result = "passwrod input False";
			return result;
		}else {
			
			MemberDTO memberDto = memberService.selectMemberByEmail(email);
			int member_no = memberDto.getMember_no();
			memberDto.setPassword(passwordEncoder.encode(password));
			memberDto.setMember_no(member_no);
			memberService.updateOne(memberDto);
			result = "OK";
			return result;
			
		}
		
		
		
	}
	
	

}
