package kr.co.jhta.soop.control;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.soop.dto.MemberDTO;
import kr.co.jhta.soop.dto.MemberProjectMemberDTO;
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
	public String mypage(@RequestParam("member_no") int member_no, @RequestParam("email") String email, Model model) {
		String result = "";

		if (member_no == 0 || email == null) {

			return "redirect:/clogin";

		} else {

			MemberDTO memberDto = memberService.selectMemberByEmail(email);
			model.addAttribute("memberDto", memberDto);
			return "mypage";

		}

	}

	@GetMapping("/mypagePasswordCheck")
	@ResponseBody
	public String passwordCheck(@RequestParam("password") String password, @RequestParam("email") String email) {
		BCryptPasswordEncoder encoder2 = new BCryptPasswordEncoder();

		String result = "";
		if (password != null && email != null) {
			MemberDTO memberDto = memberService.selectMemberByEmail(email);
			String passwordCheck = memberDto.getPassword();
			log.info("마이페이지 비밀번호 확인 이메일 : " + email);
			log.info("마이페이지 비밀번호 확인 비밀번호 : " + password);
			log.info("마이페이지에서 회원정보 변경을 위해 받아온 패스워드 : " + passwordCheck);
			String passwordEncode = passwordEncoder.encode(password);
			log.info("마이페이지-받아온 패스워드 인코딩 한 값: " + passwordEncode);
			if (encoder2.matches(password, memberDto.getPassword())) {
				result = "OK";
				return result;
			} else {
				result = "matchesFalse";
				return result;
			}
		} else if (password == null || email == null) {
			result = "False";
			return result;
		} else

			return result;

	}

	@RequestMapping("/mypagePasswordCheckOk")
	public String mypageOk(@RequestParam("email") String email, @RequestParam("password") String password,
			Model model) {

		MemberDTO memberDto = memberService.selectMemberByEmail(email);
		model.addAttribute("memberDto", memberDto);

		return "mypagePasswordCheckOk";
	}

	@RequestMapping("/mypageOauth2")
	public String mypageOauth2Ok(@RequestParam("email") String email, @RequestParam("member_no") int member_no,
			Model model) {

		MemberDTO memberDto = memberService.selectMemberByEmail(email);
		model.addAttribute("memberOauth2Dto", memberDto);

		return "mypagePasswordCheckOk";
	}

	@GetMapping("/nameChange")
	@ResponseBody
	public String nameChangeOk(@RequestParam("name") String name, @RequestParam("nameView") String nameView,
			@RequestParam("email") String email) {
		String result = "";
		if (name == null) {
			result = "name input False";
			return result;
		} else {

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
	public String passwordChangeOk(@RequestParam("password") String password, @RequestParam("repeatPw") String repeatPw,
			@RequestParam("email") String email) {
		String result = "";
		if (password == null || repeatPw == null) {
			result = "passwrod input False";
			return result;
		} else {

			MemberDTO memberDto = memberService.selectMemberByEmail(email);
			int member_no = memberDto.getMember_no();
			memberDto.setPassword(passwordEncoder.encode(password));
			memberDto.setMember_no(member_no);
			memberService.updateOne(memberDto);
			result = "OK";
			return result;

		}

	}

	@RequestMapping("/uploadProfileImage")
	public ResponseEntity<String> uploadProfileImage(@RequestParam("profileImage") MultipartFile file, Model model,
			@ModelAttribute UploadFile uploadfile, HttpServletRequest req, // 파일 경로를 위한 @RequestParam("email") String email
			@RequestParam("email") String email
			) throws UnsupportedEncodingException {
		// 파일 업로드 및 데이터베이스 업데이트 로직 수행
		if (!file.isEmpty()) {
			try {

				HttpSession session = req.getSession();
				ServletContext application = session.getServletContext();

				String filePath = application.getRealPath("/data"); // 디렉토리경로
				 
				
				MemberDTO memberDto = memberService.selectMemberByEmail(email);

				
				
				
				// 파일명 저장
				
				log.info("파일명 : {} ",  file.getOriginalFilename()); // 파일명 받기 (=> 경로는 설정 파일에서 저장)
				memberDto.setProfile_name(file.getOriginalFilename());
				
				File f = new File(filePath + "/" + file.getOriginalFilename()); 
				// 임시 경로에 보관 중인 파일을 실제 위치에 저장
				try {
					file.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				
				
	         // 파일 경로 dto에 저장
	            memberDto.setProfile_path(filePath + "/"+ file.getOriginalFilename());

				// dto에 이메일 저장
				memberDto.setEmail(email);
				
				
				//member테이블 프로필 업로드 후 업데이트

				memberService.updateOneProfile(memberDto);
				return ResponseEntity.ok("프로필 사진이 성공적으로 업로드되었습니다!");
			} catch (Exception e) {
				e.printStackTrace();
				// 실패 시 에러 응답 반환
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("업로드에 실패하였습니다.");
			}
		} else {
			// 업로드된 파일이 없을 경우 에러 응답 반환
			return ResponseEntity.badRequest().body("업로드할 파일을 선택해주세요.");
		}
	}
	
	
}
