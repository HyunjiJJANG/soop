package kr.co.jhta.soop.control;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;



import kr.co.jhta.soop.dto.AttachedFileDTO;

import kr.co.jhta.soop.dto.MemberProjectProjectmemberDTO;
import kr.co.jhta.soop.dto.SignDTO;
import kr.co.jhta.soop.dto.SignTaskAttachedFileDTO;
import kr.co.jhta.soop.dto.TaskAttachedFileDTO;
import kr.co.jhta.soop.dto.TaskDTO;
import kr.co.jhta.soop.service.AttachedFileService;
import kr.co.jhta.soop.service.MemberProjectProjectmemberService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.SignService;
import kr.co.jhta.soop.service.SignTaskAttachedFileService;
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
	SignTaskAttachedFileService signTaskAttachedFileService;
	
	@Autowired
	MemberService memberService;
//	
	@Autowired
	MemberProjectProjectmemberService memberProjectProjectmemberService;
	
	@Autowired
	SignService signservice;
	
	@RequestMapping("/task")
	public String register(Model model) { 
		
		// model.addAttribute("list", taskService.selectAll()); // task.jsp의 c:foreach list에 넘겨줌
		
		// JOIN한 service로 교체 
		model.addAttribute("list",  taskAttachedFileService.selectAll()); // task.jsp의 c:foreach list에 넘겨줌 
		
		// 이제 SIGN까지 조인한 SERVICE로 교체
		// model.addAttribute("list",  signTaskAttachedFileService.selectAll());
		
		// 임의로 project_no 1로 설정하기 => 로그인 후에 수정
		int project_no = 1;
		
		// 생성 모달에 값을 넘기기 위한
		List<MemberProjectProjectmemberDTO> members = memberProjectProjectmemberService.selectAllbyprojectno(project_no);
		model.addAttribute("members", members);
		return "task";
	}
	
//	@PostMapping("/selectOk")
//	public String selectOk(
//			Model model,
//			@RequestParam("member_no")int member_no,
//			@RequestParam("sign_approver")String sign_approver,
//			@RequestParam("sign_step")int sign_step) {
//		
//		log.info("teskController selectOk 실행 됨 ---------------" );
//		log.info("member_no : " + member_no);
//		log.info("sign_approver : " + sign_approver);
//		log.info("sign_step : " + sign_step);
//		
//		
//		return "";
//	}
	
	@Transactional
	@RequestMapping("/insert")
	public String insert(
			@ModelAttribute TaskDTO Taskdto, 
			// projectno, memberno를 숫자로 전달하기 위해.. (링크로 주니까 자꾸 문자로 받음)
//		    @RequestParam("project_no") String project_no,
//		    @RequestParam("member_no") String member_no,
			@RequestParam(name = "file", required = false) MultipartFile file, // file이라는 이름의 파라미터값을 가져와서 MultipartFile 형식의 file로 받기
																			   // required = false :: 필수가 아님 (없어도 데이터 들어가게)
			Model model,
			@ModelAttribute AttachedFileDTO Filedto,
			@ModelAttribute UploadFile uploadfile, // task.jsp의 업무 생성 모달 폼에서 uploadfile 받아오기
			BindingResult result, // 유효성 검사를 위한
			HttpServletRequest req,  // 파일 경로를 위한 
			@RequestParam( name = "sign_member_no")String sign_member_no,
			@RequestParam( name = "sign_approver", required=true) String sign_approver, // required=true 반드시 요청에 포함되도록
			@RequestParam("sign_step")int sign_step
			)
			throws UnsupportedEncodingException {
		
		// ** task 생성(insert) **
//		Taskdto.setTask_status(task_status); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅
		taskService.insertOne(Taskdto);
		
		
		// ** 결재 라인 **
		
		log.info(""+sign_member_no);
		log.info(""+sign_approver);
		log.info(""+sign_step);

	    // 결재 라인에 데이터 넣기
	    int signMemberNo = Integer.parseInt(sign_member_no);
	    SignDTO signdto = new SignDTO();
	    signdto.setSign_member_no(signMemberNo);
	    signdto.setSign_approver(sign_approver);
	    signdto.setSign_step(sign_step);
	    signdto.setSign_status(0); // 일단 0으로 설정
		
	    signservice.insertOne(signdto); // => 이걸 살리면 첨부파일이 추가가 안되고..... 이걸 죽이면 그때 첨부파일이 추가됨 왜지?

	    // 확인용
//	    List<TaskAttachedFileDTO> taskList = taskAttachedFileService.selectAll(); // 데이터 가져오기
//	    model.addAttribute("list", taskList);
//	    log.info("Number of tasks in the list: " + taskList.size()); // 로그로 출력
		

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
	 		
	 		try {
	 			// 파일 객체로 만들기 => 파일 경로에 / 와 파일 이름을 붙여서 객체로 만듦
	 			// 저장될 경로 + "/" + 파일명
	 			File f = new File(filePath + "/" + file.getOriginalFilename()); 
	 			// 임시 경로에 보관 중인 파일을 실제 위치에 저장
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
	 		
	    return "redirect:/soop/task"; // 새로고침을 위한 URL로 리다이렉트
	}

//	@RequestMapping("/refresh")
//	public String refreshTaskList(Model model) {
//		
//		model.addAttribute("list", taskAttachedFileService.selectAll());
//
//	    return "redirect:/soop/task"; // task.jsp를 다시 보여주는 뷰 이름
//	}
//	
//	@PostMapping("/insertsign")
//	@ResponseBody
//	public String insertsign(
//			
//																		   // required = false :: 필수가 아님 (없어도 데이터 들어가게)
////			@RequestParam("task_status") int task_status, 
//			Model model,
//			@ModelAttribute SignDTO signdto
//			)
//			throws UnsupportedEncodingException {
//		
//		
//		signservice.insertOne(signdto);	// 추가
//		// ** 결재 라인 **
//
//		log.info(""+signdto);
//		
//		log.info("결재자 memberno : " + signdto.getSign_member_no()); // 현재 1로 기본 설정해놔서 잘 받는 것 같음
////
////		
//		log.info("결재자 sign_approver : " + signdto.getSign_approver()); // 여기부터 안받아짐..
////
////		
//		log.info("결재자 sign_step : " + signdto.getSign_step());
//
//	
//		return "";
//	}
	

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