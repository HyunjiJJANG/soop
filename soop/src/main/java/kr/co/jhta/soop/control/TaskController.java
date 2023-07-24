package kr.co.jhta.soop.control;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.soop.dto.TaskDTO;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.ProjectService;
import kr.co.jhta.soop.service.TaskService;

@Controller
@RequestMapping("/soop")
public class TaskController {

// 유효성 검사는 나중에..
//	@Autowired
//	FileValidator fileValidator;
	
	@Autowired
	TaskService taskService;

	@GetMapping("/task")
	public String register(Model model) {
		model.addAttribute("list", taskService.selectAll());
		return "task";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute TaskDTO dto) throws UnsupportedEncodingException {
		taskService.insertOne(dto);
		return "redirect:/soop/task";
	}
	
	@GetMapping("/update")
	public String update(@RequestParam("task_no")int task_no, Model model) {
		model.addAttribute("dto", taskService.selectOne(task_no));
		return "/update";
	}
	
	@PostMapping("/update")
	public String updateOk(@ModelAttribute TaskDTO dto, Model model) {
		taskService.updateOne(dto);
		return "redirect:/soop/task";
	}
	
	@GetMapping("/delete")
	public String delete(@ModelAttribute TaskDTO dto) {
		taskService.deleteOne(dto);
		return "redirect:/soop/task";
	}
	
	/*
	 * @PostMapping("/upload.do") public ModelAndView upload(HttpServletRequest req,
	 * 
	 * @ModelAttribute UploadFile file, BindingResult result) {
	 * 
	 * // 파일 유효성 검사 fileValidator.validate(file, result); // error가 생기면 result로 넘겨줌
	 * if (result.hasErrors()) { // 결과에 에러가 존재한다면 다시 돌아가 return new
	 * ModelAndView("task"); }
	 * 
	 * // 파일은 어디에 저장 ??????? // 서버에 저장할 실제 디렉토리 경로 구하기
	 * 
	 * return null; }
	 */
	
}
