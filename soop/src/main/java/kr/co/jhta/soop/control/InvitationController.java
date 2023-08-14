package kr.co.jhta.soop.control;

import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.soop.dto.MemberDTO;
import kr.co.jhta.soop.dto.ProjectInvitationDTO;
import kr.co.jhta.soop.dto.ProjectMemberDTO;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.ProjectInvitationService;
import kr.co.jhta.soop.service.ProjectMemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InvitationController {
	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	ProjectInvitationService projectInvitationService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProjectMemberService projectMemberService;
	
	// 해당 프로젝트에 파트너 초대하기를 클릭했을때 이메일 초대링크 보내기
	@GetMapping("/invite")
	@ResponseBody
	public void inviteSendMail(@RequestParam("email") String email,
			@RequestParam("name") String name,
			@RequestParam("project_no") int project_no,
			@RequestParam("inviteMessage") String inviteMessage) {

		log.info("초대 모달에서 초대버튼 누르면 가져올 email : " + email);
		log.info("project_no : " + project_no + ", name : " + name);

		// 초대코드 키
		UUID  uuidKey = UUID.randomUUID(); // 유니크한 키값 받아오기
		String key = uuidKey.toString(); // 문자열로 변환
		log.info("초대코드 : " + key);
		
		// 파트너 초대하기 버튼 클릭시 초대코드 테이블에 insert
		ProjectInvitationDTO projectInvitationDTO = new ProjectInvitationDTO();
		projectInvitationDTO.setProject_no(project_no);
		projectInvitationDTO.setInvitation_email(email);
		projectInvitationDTO.setInvitation_code(key);
		
		projectInvitationService.insertOne(projectInvitationDTO);
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		String htmlStr = "";
		StringBuffer sb = new StringBuffer("");

		try {
			// 메일제목
			message.setSubject("[SOOP] " + name + "님이 SOOP으로 초대했습니다.");
			
			// 메일내용
			sb.append("<br>아래 링크를 들어가셔서 초대코드를 입력해주세요.<br><br>"
					+ "<div>http://localhost:8081/inviteMailCheck</div>"
					+ "<br><br><div style='font-size: 18px; font-weight: bold; color: #FF0000;'>초대코드 : "+ key +"</div>"
					+ "<br><div style='font-size: 18px; font-weight: bold;'>" + inviteMessage + "</div>");
			
			htmlStr = sb.toString();

			// 내용설정
			message.setText(htmlStr, "UTF-8", "html");

			// To 설정
			message.addRecipient(RecipientType.TO, new InternetAddress(email, "UTF-8"));
			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	} // 이메일 초대링크 보내기 end

	// 이메일 초대링크 클릭시 로그인 페이지로 이동
//	@GetMapping("/inviteMailLogin")
//	public String inviteMailLogin(HttpSession session, Model model) {
//		String inviteMember = "inviteMember";
//		model.addAttribute("inviteMember", inviteMember);
//		
//		return "redirect:/clogin";
//	}
	
	// 초대링크 클릭시 초대코드 인증하는 페이지로 이동
	@GetMapping("/inviteMailCheck")
	public String mailcheckOk(@RequestParam(name = "isOk", required = false, defaultValue = "0")int code, 
			Model model) {
		
		if(code ==  3) { // 인증코드가 일치하지 않는 경우
			model.addAttribute("error", "코드가 일치하지 않습니다. 다시 입력해주세요."); 
		}
		
		return "inviteMailCheck"; 
	}
	
	// 초대코드 인증 후 초대코드테이블 초대코드성공여부 '성공'으로 변경 및
	// 초대받은 이메일 멤버테이블에 있으면 프로젝트멤버 테이블에 insert
	@GetMapping("/inviteMailcheckOk")
	public String inviteMailcheckOk(@RequestParam("invitation_code")String invitation_code){
		
		ProjectInvitationDTO piDto = projectInvitationService.findByKey(invitation_code);
		log.info("초대정보 : "+piDto);
		
		String checkKey ="";
		int project_no =0;
		
		if(piDto != null) {
			checkKey = piDto.getInvitation_code();
			project_no = piDto.getProject_no();
		
		// 초대테이블 이메일과 일치하는 이메일 멤버테이블에서 꺼내오기
		MemberDTO mDto = memberService.selectMemberByEmail(piDto.getInvitation_email());
				
			// 입력한 초대코드와 프로젝트 초대코드 테이블에 들어있는 초대코드가 일치하면
			if(invitation_code.equals(piDto.getInvitation_code())){
		       // 초대테이블에 있는 이메일이 멤버테이블에 있으면 로그인 화면이동
				if(mDto != null) {
					// 초대코드 입력후 확인버튼 클릭하면 초대코드 테이블에 있는 상태값을 성공으로 변경
					projectInvitationService.updateSuccess(checkKey);
					
					// 프로젝트 멤버 테이블에 insert			 			 
					ProjectMemberDTO pmdto = new ProjectMemberDTO();
					pmdto.setMember_no(mDto.getMember_no());
					pmdto.setProject_no(project_no);
					projectMemberService.insertOne(pmdto);
					
					return "redirect:/";
					
				}else {
					
					return "redirect:/register";
				}
			}else { //입력한 초대코드와 프로젝트 초대코드 테이블에 들어있는 초대코드가 일치하지 않으면 회원가입 페이지로
				
				return "redirect:/register";
			}
		}
		
		return "redirect:inviteMailCheck?isOk=3"; // 초대코드가 불일치하면 "일치하지 않습니다" 문구
		
	} // inviteMailcheckOk() end

	
} // class end
