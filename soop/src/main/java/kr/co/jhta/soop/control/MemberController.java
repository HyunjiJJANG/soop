package kr.co.jhta.soop.control;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@Autowired
	private PasswordEncoder passwordEncoder;

	//커스텀 로그인
	@GetMapping("/clogin")
	public String login() {
		
		

		return "login";
	}
	
	
	
	
	@GetMapping("/loginOkIndex")
	public String loginOk(Model model, Authentication auth) {
		String email =  auth.getName();
		MemberDTO memberDto =  memberService.selectMemberByEmail(email);
		log.info("memberDto 이메일:"+memberDto.getEmail());
		log.info("memberDto:이름 "+memberDto.getName());
		model.addAttribute("memberDto",memberDto);
		return "loginOkIndex";
	}
	//비밀번호 찾기 폼으로 이동
	@GetMapping("/searchPassword")
	public String searchPassword() {

		return "serachPassword";
	}

	
	//비밀번호 찾기 이메일 인증 완료 후 비밀번호 변경 폼으로 이동
	@RequestMapping("/searchPasswordOk")
	public String searchPasswordOk(@RequestParam("email") String email, Model model,
			@RequestParam("authCode") String authCode, HttpSession session) {
		
		
		log.info("비밀번호 찾기 후 이메일 인증 하고 넘어온 회원의 이메일 : " + email);
		
		String result = "";

		if (email == null || authCode == null) {
			return "redirect:/clogin";
			
		} else if (email != null && authCode != null ) {

				Object obj = session.getAttribute("key");
				if (obj != null) {
					String key = (String) obj;
					log.info("비밀번호 찾기 후 넘어온 key : " + key);

					if (authCode.equals(key)) {
						// 이메일로 멤버 정보 가져와서 memberDto에 저장하기
						MemberDTO memberDto = memberService.selectMemberByEmail(email);
						model.addAttribute("memberDto",memberDto);
						result = "searchPasswordOk";
						
					} else {
						return "redirect:/clogin";
						
					}

				} else {
					return "redirect:/clogin";
					
				}
				
				
			}
		return result;
	}
	
	
	
	
	
	//비밀번호 변경 완료 후 login페이지로 리다이렉트 시키기
	@RequestMapping("/passwordChange")
	public String passwordChange(@ModelAttribute MemberDTO memberDto, @RequestParam("password")String password) {
		
		
		memberDto.setPassword(passwordEncoder.encode(password));
		memberService.updateOne(memberDto);
		
		
		return "redirect:/clogin";
	}
	
	//커스텀 로그아웃
	@GetMapping("/clogout")
	public String logout() {

		return "logout";
	}
	//회원가입
	@GetMapping("/register")
	public String registerForm() {

		return "register";
	}

	
	//회원가입 완료
	@RequestMapping("/registerOk")
	public String registerOk(Model model, HttpServletRequest req, @ModelAttribute MemberDTO memberDto,
			@RequestParam("email") String email, @RequestParam("password") String password) {

		memberService.insertRole(email);
		memberDto.setPassword(passwordEncoder.encode(password));
		memberService.insertOne(memberDto);

		return "redirect:/clogin";
	}

	// 회원 가입시 이메일 중복체크를 위한 mapping
	@GetMapping("/emailCheck")
	public @ResponseBody String emailCheck(@RequestParam("email") String email) {

		log.info("ajax로 넘어온 email : " + email);

		String result = memberService.selectOneByEmail(email);
		log.info("db에서 넘어온 result 메세지 : " + result);

		return result;

	}

	// 이메일 인증 코드 일치 여부를 위한 mapping
	@GetMapping("/mailCheck")
	@ResponseBody
	public String SendMail(@RequestParam("email") String email, HttpSession session) {
		log.info("이메일 인증번호 버튼 눌르고 오는 email " + email);

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
		message.setText("안녕하세요.\n 이메일 계정을 인증받으시려면 아래 인증 번호를 확인해주세요. \n 인증 번호 : " + key);
		javaMailSender.send(message);
		log.info("key : " + key);

		session.setAttribute("key", key);
		return key;
	}
	//이메일 인증 코드 일치 여부 확인
	@GetMapping("/emailCheckOk")
	@ResponseBody
	public String emailCheckOk(@RequestParam("authCode") String authCode, HttpSession session) {
		String result = "";
		Object obj = session.getAttribute("key");
		if (obj != null) {
			String key = (String) obj;
			log.info("인증 버튼을 누른 후 컨트롤러로 넘어온 key : " + key);

			if (authCode.equals(key)) {
				result = "OK";
			}
			return result;

		} else {
			result = "False";
			return result;
		}

	}

}
