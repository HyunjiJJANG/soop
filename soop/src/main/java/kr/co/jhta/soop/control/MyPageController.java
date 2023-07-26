package kr.co.jhta.soop.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyPageController {

	@GetMapping("/mypage")
	public String mypage() {

		return "mypage";
	}

}
