package kr.co.jhta.soop.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.dto.MemoDTO;
import kr.co.jhta.soop.service.MemoService;
import lombok.extern.slf4j.Slf4j;

@Controller
public class MemoController {
	@Autowired
	MemoService service;
	
	@GetMapping("/")
	public String showMemo(@RequestParam("member_no")int member_no, Model model) {
		MemoDTO dto = service.selectOne(member_no);
		model.addAttribute("memoDTO", dto);
		return "home";
	}
	
	// @PostMapping("")
}
