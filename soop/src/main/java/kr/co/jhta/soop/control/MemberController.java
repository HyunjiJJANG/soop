package kr.co.jhta.soop.control;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	
	 @Autowired
	 JavaMailSender javaMailSender;
	 

	@GetMapping("/clogin")
	public String login() {

		return "login/login";
	}
	
	@PostMapping("/clogin")
	public String loginOk() {
		
		
		return "main";
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
    @ResponseBody
	public String SendMail(@RequestParam("email")String email, HttpSession session) {
		
		System.out.println("이메일 인증번호 버튼 눌르고 오는 email "+ email);

		Random random = new Random();
		String key = "";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}
		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
		key += numIndex;
		message.setSubject("[SOOP]이메일 계정을 인증해주세요");
		message.setText("안녕하세요.\n 이메일 계정을 인증받으시려면 아래 인증 번호를 확인해주세요. \n 인증 번호 : "+key);
		javaMailSender.send(message);
		System.out.println(key);
		session.setAttribute("key", key);
		return key;
	}
	
	@GetMapping("/emailCheckOk")
	 @ResponseBody
	 public String emailCheckOk(@RequestParam("authCode")String authCode,HttpSession session ) {
		String result = "";
		Object obj = session.getAttribute("key");
		if(obj != null){
			String key = (String)obj;
			System.out.println("인증 버튼을 누른 후 컨트롤러로 넘어온 key : "+ key);
			if(authCode.equals(key)) {
				result = "OK";
			}
			return result;
			
		}else {
			result = "False";
			return result;
		}
		
		
		
	}
	
	
}
