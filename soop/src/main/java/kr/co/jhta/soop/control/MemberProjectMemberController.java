package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.dto.MemberProjectMemberDTO;
import kr.co.jhta.soop.service.MemberProjectMemberService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MemberProjectMemberController {
	
	
	@Autowired
	MemberProjectMemberService memberProjectMemberService;

	@GetMapping("/contact")
	public String myContactList(@RequestParam("email")String email, @RequestParam("member_no")int member_no, Model model) {
		
		MemberProjectMemberDTO memberProjectMemberdto =  memberProjectMemberService.selectOne(member_no);
		memberProjectMemberdto.setMember_no(member_no);
		model.addAttribute("list", memberProjectMemberService.selectAll(memberProjectMemberdto));
		return "contact";
	}

}
