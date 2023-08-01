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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InvitationController {
	@Autowired
	JavaMailSender javaMailSender;
	
	// 해당 프로젝트에 파트너 초대하기를 클릭했을때 이메일 초대링크 보내기
		@GetMapping("/invite")
		@ResponseBody
		public void SendMail(@RequestParam("email") String email,
							   @RequestParam("name") String name,
							   @RequestParam("inviteMessage") String inviteMessage,
							   HttpSession session) {
			log.info("초대 모달에서 초대버튼 누르면 가져올 email : " + email);

			MimeMessage message = javaMailSender.createMimeMessage();
			
			String htmlStr="";
			StringBuffer sb = new StringBuffer("");
			
			try {
				// 메일제목
				message.setSubject("[SOOP] " + name + "님이 SOOP으로 초대했습니다.");
				
				// 메일내용
				sb.append("<br><br><a href='http://localhost:8081/feed?project_no=1&member_no=1' >"
						+ "<button style='background-color:#1abc9c; border-radius:20px; "
						+ "border:none; width:150px; height:50px; color:#ffffff; "
						+ "font-size:15px; cursor:pointer;' >"
						+ "초대 수락하기</button></a>"
						+ "<br><br>"+inviteMessage);
						
				htmlStr = sb.toString();
				
				// 내용설정
				message.setText(htmlStr, "UTF-8", "html"); 
				
				// To 설정
				message.addRecipient(RecipientType.TO, new InternetAddress(email,"UTF-8"));
				javaMailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			
		}
}
