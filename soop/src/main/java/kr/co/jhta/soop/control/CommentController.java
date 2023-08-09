package kr.co.jhta.soop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.soop.dto.CommentDTO;
import kr.co.jhta.soop.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;
	
//	@PostMapping("/comment/write")
//	public String write(@ModelAttribute CommentDTO dto) {
//		
//		commentService.insertOne(dto);
//		
//		return "redirect:taskDetail?=";
//	}
	
	@RequestMapping("/comment/list") //댓글 리스트
	@ResponseBody
	public List<CommentDTO> mCommentServiceList(@RequestParam("task_no")int task_no, Model model) throws Exception{
		return commentService.commentList(task_no);
	}
	    
	@RequestMapping("/comment/insert") //댓글 작성 
	@ResponseBody
	public int mCommentServiceInsert(@RequestParam("task_no")int task_no,
			@RequestParam("member_no")int member_no,
			@RequestParam("comment_content")String comment_content) throws Exception{
	        
	        CommentDTO dto = new CommentDTO();
	        dto.setTask_no(task_no);
	        dto.setMember_no(member_no);
	        dto.setComment_content(comment_content);
	        
	        return commentService.commentInsert(dto);
	    }
	    
//	    @RequestMapping("/update") //댓글 수정  
//	    @ResponseBody
//	    private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{
//	        
//	        CommentVO comment = new CommentVO();
//	        comment.setCno(cno);
//	        comment.setContent(content);
//	        
//	        return mCommentService.commentUpdateService(comment);
//	    }
//	    
//	    @RequestMapping("/delete/{cno}") //댓글 삭제  
//	    @ResponseBody
//	    private int mCommentServiceDelete(@PathVariable int cno) throws Exception{
//	        
//	        return mCommentService.commentDeleteService(cno);
//	    }
	
}
