package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.dto.MemoDTO;
import kr.co.jhta.soop.service.FeedService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.MemoService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.TaskMemberFileService;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MemoService memoService;

	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
	@Autowired
	FeedService feedService;
	
	@Autowired
	TaskMemberFileService taskMemberFileService;
	
	// 홈화면 처음 들어갈 때 프로젝트,파일함,메모,캘린더,관심업무 보여주기
	@GetMapping("/home")
	public String showHome(@RequestParam("member_no")int member_no, Model model) {
		model.addAttribute("memberDTO", memberService.selectOne(member_no));
		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
		model.addAttribute("memoDTO", memoService.selectOne(member_no));
		model.addAttribute("fileList", taskMemberFileService.selectAllProjectFile(member_no));
		return "home";
	}
	
	// 메모 수정
	@PostMapping("/home")
	public String saveMemo(@RequestParam("member_no")int member_no,
							@RequestParam("memo_content")String memo_content) {
		System.out.println(member_no);
		
		// 입력한 메모 내용 메모 테이블에 담기
		MemoDTO dto = new MemoDTO();
		dto.setMember_no(member_no);
		dto.setMemo_content(memo_content);
		
		// 메모 테이블에 멤버번호로 조회하기
		MemoDTO dto2 = memoService.selectOne(member_no);
		
		if(dto2 == null) { // 메모 테이블에 해당 멤버번호에 데이터가 없으면 insert
			memoService.insertOne(dto);
		}else { // 메모 테이블에 해당 멤버번호에 데이터가 있으면 update
			memoService.updateOne(dto);
		}
		
		return "home";
	}
	
	// 고객센터
	@GetMapping("/faq")
	public String faq(@RequestParam("member_no")int member_no,
					 Model model) {
		
		model.addAttribute("memberDTO", memberService.selectOne(member_no)); // nav에 name 들어갈 수 있게
		
		return "faq";
	}
	
	
}
