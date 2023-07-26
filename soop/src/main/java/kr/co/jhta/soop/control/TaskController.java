package kr.co.jhta.soop.control;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jdk.internal.org.jline.utils.Log;
import kr.co.jhta.soop.dto.AttachedFileDTO;
import kr.co.jhta.soop.dto.TaskDTO;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.ProjectService;
import kr.co.jhta.soop.service.TaskService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/soop")
public class TaskController {

	@Autowired
	FileValidator fileValidator;

	@Autowired
	TaskService taskService;

	@GetMapping("/task")
	public String register(Model model) {
		model.addAttribute("list", taskService.selectAll());
		return "task";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute TaskDTO Taskdto, 
			@RequestParam(name = "file", required = false) MultipartFile file, // file이라는 이름의 파라미터값을 가져와서 MultipartFile 형식의 file로 받기
																			   // required = false :: 필수가 아님 (없어도 데이터 들어가게)
			@RequestParam("task_status") int task_status, Model model,
			@ModelAttribute AttachedFileDTO Filedto,
			@ModelAttribute UploadFile uploadfile, // task.jsp의 업무 생성 모달 폼에서 uploadfile 받아오기
			BindingResult result, // 유효성 검사를 위한
			HttpServletRequest req) // 파일 경로를 위한 
			throws UnsupportedEncodingException {
		
		// task 생성(insert)
		Taskdto.setTask_status(task_status); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅
		taskService.insertOne(Taskdto);
		
		// 파일 유효성 검사 후 성공하면 작업을 계속하고,
		// 실패하면 중단시키도록
		fileValidator.validate(file, result); // error가 생기면 result로 넘겨줌
		if (result.hasErrors()) {
			// 결과에 에러가 존재한다면
			// 다시 돌아가
			return "redirect:/soop/task";
		}

		
		// 파일은 어디에 저장  /data <== (현재 임시 파일은 properties에 c:\\temp\\data 로 지정됨)
		// 서버에 저장할 실제 디렉토리 경로 구하기
		HttpSession session = req.getSession(); // http 객체 얻어오기
		ServletContext application = session.getServletContext(); // session으로부터 servlet context 얻어오기
		
		String filePath = application.getRealPath("/data"); // 데이터의 실제 경로
		log.info("파일이 저장될 실제 경로 : {} " + filePath); // 해당 경로로 탐색기에서 테스트 했을 때, data 폴더에 밀어넣은 이미지 나옴
		
		// 매개변수로 전달 받은 파일 객체
		/*
		 * log.info(("file : {} " + file)); log.info(("file.getFile() : {} " +
		 * file.getOriginalFilename()));
		 */
		
		
		// 파일명 받아서 Filedto에 저장
		log.info("파일명 : {} ",  file.getOriginalFilename()); // 파일명 받기 (=> 경로는 설정 파일에서 저장)
		Filedto.setFile_name(file.getOriginalFilename());
		
		// 파일 객체로 만들기 => 파일 경로에 / 와 파일 이름을 붙여서 객체로 만듦
		// 저장될 경로 + "/" + 파일명
		File f = new File(filePath + "/" + file.getOriginalFilename()); 
		// 임시 경로에 보관 중인 파일을 실제 위치에 저장
		try {
			file.transferTo(f);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 파일 타입 받아서 Filedto에 저장
		log.info("파일 타입 : {} " , file.getContentType());
		Filedto.setFile_type(file.getContentType());
		
		// 오늘 날짜 담아서 Filedto에 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		// 현재날짜를받아옴
		Date date = new Date();
		String fileDate = sdf.format(date);
		log.info("파일 날짜 : {} ", date);
		Filedto.setFile_register_date(fileDate);
	
		
		
		return "redirect:/soop/task";
	}

	@GetMapping("/update")
	public String update(@RequestParam("task_no") int task_no, Model model) {
		model.addAttribute("dto", taskService.selectOne(task_no));
		return "/update";
	}

	@RequestMapping("/update")
	public String updateOk(@ModelAttribute TaskDTO dto, @RequestParam("task_status") int task_status, Model model) {
		dto.setTask_status(task_status); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅
		taskService.updateOne(dto);
		return "redirect:/soop/task";
	}

	@GetMapping("/delete")
	public String delete(@ModelAttribute TaskDTO dto) {
		taskService.deleteOne(dto);
		return "redirect:/soop/task";
	}

	

}
