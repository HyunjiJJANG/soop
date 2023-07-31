package kr.co.jhta.soop.control;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jdk.internal.org.jline.utils.Log;
import kr.co.jhta.soop.dto.AttachedFileDTO;
import kr.co.jhta.soop.dto.MemberDTO;
import kr.co.jhta.soop.dto.MemberProjectProjectmemberDTO;
import kr.co.jhta.soop.dto.TaskAttachedFileDTO;
import kr.co.jhta.soop.dto.TaskDTO;
import kr.co.jhta.soop.service.AttachedFileService;
import kr.co.jhta.soop.service.MemberProjectProjectmemberService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.ProjectService;
import kr.co.jhta.soop.service.TaskAttachedFileService;
import kr.co.jhta.soop.service.TaskService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/soop")
public class TaskController {

	
//	@Autowired
//	FileValidator fileValidator;

	@Autowired
	TaskService taskService;

	@Autowired
	AttachedFileService attachedfileService;
	
	@Autowired
	TaskAttachedFileService taskAttachedFileService;
	
	
	@Autowired
	MemberService memberService;
//	
	@Autowired
	MemberProjectProjectmemberService memberProjectProjectmemberService;
	
	@GetMapping("/task")
	public String register(Model model) {
		// model.addAttribute("list", taskService.selectAll()); // task.jsp의 c:foreach list에 넘겨줌
		
		// JOIN한 service로 교체 
		model.addAttribute("list", taskAttachedFileService.selectAll()); // task.jsp의 c:foreach list에 넘겨줌 
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
			HttpServletRequest req,  // 파일 경로를 위한 
			@RequestParam("project_no") int project_no) // 결재라인에서 프로젝트 넘버로 결재자 리스트(member) 띄우기 위해
			throws UnsupportedEncodingException {
		
		// ** task 생성(insert) **
		Taskdto.setTask_status(task_status); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅
		taskService.insertOne(Taskdto);
		
		
		
		
		// ** 결재라인 **
		List<MemberProjectProjectmemberDTO> members = memberProjectProjectmemberService.selectAllbyprojectno(project_no);
		model.addAttribute("members", members);
//		 List<MemberDTO> members = memberService.selectAll();
//	     model.addAttribute("members", members);

		// 로그를 통해 프로젝트 멤버를 확인 (이 코드가 정확한 결과를 가져올 수 있도록 project_no에 해당하는 값을 지정해야 합니다.)
		log.info("members : {}", members);

		
		
		// ** 파일 첨부 **
		
		// 파일은 어디에 저장  /data <== (현재 임시 파일은 properties에 c:\\temp\\data 로 지정됨)
		// 서버에 저장할 실제 디렉토리 경로 구하기
		HttpSession session = req.getSession(); // http 객체 얻어오기
		ServletContext application = session.getServletContext(); // session으로부터 servlet context 얻어오기
		
		String filePath = application.getRealPath("/data"); // 데이터의 실제 경로
		log.info("파일이 저장될 실제 경로 : {} " + filePath); // 해당 경로로 탐색기에서 테스트 했을 때, data 폴더에 밀어넣은 이미지 나옴
		
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 현재날짜를받아옴
		Date date = new Date();
		String fileDate = sdf.format(date);
		log.info("파일 날짜 : {} ", fileDate);
		Filedto.setFile_register_date(fileDate);
		
		// 파일 경로 받아서 Filedto에 저장
		Filedto.setFile_path(filePath + "\\" + file.getOriginalFilename());

		attachedfileService.insertOne(Filedto);
		
		return "redirect:/soop/task";
	}

	@GetMapping("/update")
	public String update(@RequestParam("task_no") int task_no, Model model,
			@RequestParam("file_no") int file_no,
			@ModelAttribute AttachedFileDTO filedto) {
		
		TaskDTO taskDTO = taskService.selectOne(task_no);
		model.addAttribute("dtoTask", taskDTO);

		AttachedFileDTO attachedFileDTO = attachedfileService.selectOne(file_no);
		model.addAttribute("dtoAttachedFile", attachedFileDTO);
		return "/update";
	}
	
	// 파일 다운로드
		@RequestMapping("/download")
		@ResponseBody // 사용자에게 전달
		public byte[] download(HttpServletRequest req, 
				@RequestParam("fileName")String fileName, // 파라미터값으로 파일 이름을(aa.PNG) 받아서 fileName이라는 String 변수에 담아주기
				HttpServletResponse resp) { 
			// /data 디렉토리에 저장되어 있다.
					
			String filePath = req.getSession().getServletContext().getRealPath("/data");
			
			// 파일의 절대 경로를 구할 수 있다.
			System.out.println("/data 디렉토리의 절대 경로 : " + filePath);
			
			// 다운로드 받을 파일의 절대 경로
			String absFilePath = filePath + "/" + fileName;
			
			System.out.println("다운로드 받을 파일의 절대 경로 : " + absFilePath);
			
			// 파일 객체 생성
			File f = new File(absFilePath);
			// 전송할 파일을 byte[] 형태로 형변환을 시켜준다.
			byte[] b = null;
			try {
				b = FileCopyUtils.copyToByteArray(f); // 이 메서드가 byte 배열을 리턴해줌
				
				// 내가 보내는 파일이 무엇인지, 어떻게 처리할지 브라우저에 알려줌
				String fn = new String(f.getName().getBytes(), "iso_8859_1"); // 파일 이름 한글이면 깨지니까 알 수 있도록 파일명 바꿔주고,
				// 파일의 이름
				resp.setHeader("Content-Disposition", "attachment;filename=\""+fn+"\""); // 매개변수로 httpservletresponse 추가
				// 파일의 길이
				resp.setContentLength(b.length);
				// 파일의 종류
				resp.setContentType("image/jpeg");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			return b; // b를 리턴해주면서 파일이 전송됨
			
		} // download() end
	

	@RequestMapping("/update")
	public String updateOk(@ModelAttribute TaskDTO taskdto, 
			@ModelAttribute AttachedFileDTO filedto, 
			@RequestParam("task_status") int task_status, Model model,
			HttpServletRequest req,
			@RequestParam(name = "file", required = false) MultipartFile file,
			@ModelAttribute UploadFile uploadfile) {
		
		taskdto.setTask_status(task_status); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅
		taskService.updateOne(taskdto);

		
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
				filedto.setFile_name(file.getOriginalFilename());
				
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
				filedto.setFile_type(file.getContentType());
				
				// 오늘 날짜 담아서 Filedto에 저장
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				// 현재날짜를받아옴
				Date date = new Date();
				String fileDate = sdf.format(date);
				log.info("파일 날짜 : {} ", fileDate);
				filedto.setFile_register_date(fileDate);
				
				// 파일 경로 받아서 Filedto에 저장
				filedto.setFile_path(filePath + "\\" + file.getOriginalFilename());

				// 파일 넘버를 task_no로 셋팅 (230728 11:18)
				filedto.setFile_no(taskdto.getTask_no());
				
				log.debug("업데이트 쿼리 실행 전: {}", filedto);
				attachedfileService.updateOne(filedto);
				log.debug("업데이트 쿼리 실행 후: {}", filedto);
		
				
		return "redirect:/soop/task";
	}

	@GetMapping("/delete")
	public String delete(@ModelAttribute TaskDTO dto,
			@ModelAttribute AttachedFileDTO filedto) {
		
		taskService.deleteOne(dto);
		
		// 첨부파일 삭제
	    int fileNo = filedto.getFile_no();
	    log.info("삭제 파일 넘버 : " + Integer.toString(fileNo));
	    attachedfileService.deleteOne(dto.getTask_no());
	    
		return "redirect:/soop/task";
	}

	

}
