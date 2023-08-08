package kr.co.jhta.soop.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommentController {
	
	
	@GetMapping("/comment")
	public String comment() {
		return "comment";
	}
	
}
