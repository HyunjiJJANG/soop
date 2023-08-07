package kr.co.jhta.soop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.soop.dto.SignDTO;
import kr.co.jhta.soop.service.SignService;

@RestController
public class SignRestController {
	@Autowired
	SignService signService;
	
	@GetMapping(value="feed/sign/{task_no}", produces= MediaType.APPLICATION_JSON_VALUE)
	public List<SignDTO> showSign(@RequestParam("task_no") int task_no) {
		List<SignDTO> list = signService.selectAllByTno(task_no);
		return list;
	}
}
