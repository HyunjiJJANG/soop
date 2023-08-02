package kr.co.jhta.soop.control;

import java.io.UnsupportedEncodingException;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	ProjectMemberService projectMemberService;
	
	// 해당 프로젝트에 파트너 초대하기를 클릭했을때 이메일 초대링크 보내기
	@GetMapping("/invite")
	@ResponseBody
	public void sendMail(@RequestParam("email") String email,
			@RequestParam("name") String name,
			@RequestParam("project_no") int project_no,
			@RequestParam("inviteMessage") String inviteMessage, HttpSession session) {
		
		log.info("초대 모달에서 초대버튼 누르면 가져올 email : " + email);
		log.info("project_no : " + project_no);
		// db에 초대받은 멤버가 초대 insert
		// 초대코드 테이블에 인서트 
		
		
		//  프로젝트번호 이름   초대자   랜덤키      상태 
		//                 aaa   sfes23ds          1  (미확인) 
		
		
		// 링크      /invite?key=sfes23ds 
		// /inviteOk?key=XXXXXX 
		// 메일에서 링크 클릭하면 프로젝트 멤버 insert
		
		
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		String htmlStr = "";
		StringBuffer sb = new StringBuffer("");

		try {
			// 메일제목
			message.setSubject("[SOOP] " + name + "님이 SOOP으로 초대했습니다.");

			// 메일내용(초대수락하기 버튼 클릭시 로그인 화면으로 이동되게)
			sb.append("<br><br><a href='http://localhost:8081/inviteOk?key=q232342&no=321' >"
					+ "<button style='background-color:#1abc9c; border-radius:20px; "
					+ "border:none; width:150px; height:50px; color:#ffffff; " + "font-size:15px; cursor:pointer;' >"
					+ "초대 수락하기</button></a>" + "<br><br>" + inviteMessage);
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
		

	} // sendMail() end

//	@GetMapping("/inviteOk")  // inviteOk?key=q232342&no=321
//	public String checkMember(@RequestParam("key") String key, @RequestParam("no")int no) {
//		
//		
//		MemberDTO m = dao.findByKey(key);
//		int projetno = dao.findNoByKey(key);
//		
//		if(m != null ) {
//			mdao.insert(m.getId, 이름, ); 
//		}
//		return "rediect://invitok?no="+no;
//		
//	}
	
	// 초대수락하기 버튼 클릭후 로그인 페이지에서 로그인 하면 
	// 로그인 페이지로 이동시 프로젝트멤버 테이블에 insert??? 초대받은 멤버번호와 프로젝트번호 담아야됨
	@GetMapping("/inviteLogin")
	public String inviteLogin(){
		
		// projectMemberService.insertOne(dto);
		return "login";
	}
	
} // class end
