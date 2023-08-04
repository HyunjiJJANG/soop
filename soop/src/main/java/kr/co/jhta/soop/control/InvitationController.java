package kr.co.jhta.soop.control;

import java.io.UnsupportedEncodingException;
import java.util.Random;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.soop.dto.ProjectInvitationDTO;
import kr.co.jhta.soop.service.ProjectInvitationService;
import kr.co.jhta.soop.service.ProjectMemberService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InvitationController {
	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	ProjectInvitationService projectInvitationService;
	
	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
	@Autowired
	ProjectMemberService projectMemberService;
	
	// 해당 프로젝트에 파트너 초대하기를 클릭했을때 이메일 초대링크 보내기
	@GetMapping("/invite")
	@ResponseBody
	public void sendMail(@RequestParam("email") String email,
			@RequestParam("name") String name,
			@RequestParam("project_no") int project_no,
			@RequestParam("inviteMessage") String inviteMessage) {

		log.info("초대 모달에서 초대버튼 누르면 가져올 email : " + email);
		log.info("project_no : " + project_no + ", name : " + name);

		// 초대코드 키
		UUID  uuidKey =   UUID.randomUUID(); // 유니크한 키값 받아오기
		String key = uuidKey.toString(); // 문자열로 변환
		log.info("key : " + key);
		
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

			// 메일내용(링크 : inviteOk?key=232342)
			sb.append("<br><br><a href='http://localhost:8081/inviteOk?key='"+key+" >"
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

	// 초대수락하기 버튼 클릭시 key와 초대코드 일치하면 프로젝트멤버 테이블에 추가하고 로그인 화면으로 이동
	@GetMapping("/inviteOk")
	public String checkMember(@RequestParam("key")String key) {
//    
//	ProjectInvitationDTO projectInvitationDTO = dao.findByKey(key);
//	// 링크 /invite?key=2134 키값과 db에 있는 key 값이 일치하면 상태여부 값을 변경할수있게
//	// 메일에서 링크 클릭하면 (key가 일치하면) 프로젝트 멤버 insert	
//
//	if(key == equ)
//		MemberDTO m = dao.findByKey(key);
//		int projetno = dao.findNoByKey(key);
//		
//		if(m != null ) { // 조인???
//			mdao.insert(m.getId, 이름, ); 
//		}
		// return "rediect://feed?project_no="+project_no+"&member_no="+member_no;
		return null;
		
	} // checkMember() end
	
} // class end
