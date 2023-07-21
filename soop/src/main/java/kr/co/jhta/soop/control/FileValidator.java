package kr.co.jhta.soop.control;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

public class FileValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
//		// 검사의 대상 : target 
//		// 이 때, 발생하는 에러 : errors
//		UploadFile file = (UploadFile)target; // 형변환
//		
//		MultipartFile mf = file.getFile();
//		
//		int fileSize = 1024 * 1024 * 100; // 100MB
//		if(mf.getSize() == 0) {
//			errors.rejectValue("file", null, "파일을 선택해 주세요");
//		} else if (mf.getSize() > fileSize) {
//			errors.rejectValue("file", null, "100MB 이하의 파일만 전송 가능합니다.");
//		}
//		
	}

}
