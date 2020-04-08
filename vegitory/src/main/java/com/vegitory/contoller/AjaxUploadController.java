package com.vegitory.contoller;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.vegitory.service.board.BoardService;
import com.vegitory.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AjaxUploadController {
	
	//@Autowired랑 @Inject는 타입으로 가져오고 @Resource는 이름으로 가져옴
	@Autowired
	BoardService bService;
	
	//업로드 디렉토리 servlet-context.xml에 설정되어 있음.
	@Resource(name = "uploadPath")
	String uploadPath;
	
	//파일첨부 페이지로 이동
	@GetMapping("upload/uploadAjax")
	public String uploadAjax() {
		return "/upload/uploadAjax";
	}
	
	// Upload File 멀티파트파일에 save
	@ResponseBody
	@PostMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8") //produces 이거 붙여주면 데이터 안깨짐
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception { //MutipartFile 객체의 file을 받은것임. 예외는 던져버리기.
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
		// 딱 한번만 쓰는거라 따로 변수에 안담고 new ResponseEntity처럼 객체생성한채로 사용.
		// <> 꺽쇠가 아니라 제네릭...  얘가 하는 역할은 타입을 체크하는 역할. 일종의 유효성 체크. 
		//객체 생성된 인스턴스에 뭔가 넣을려면 반드시 String 타입의 data만 들어올수있다.
		// HttpStatus.OK는 성공했다는 표시. 성공시에 200이라는 숫자를 보냄.
		// ResponseEntity(uploadFile, filename, byte, httpstatus); 이런애들 return 값으로 보내주세요. 
		
	}
	
	
}
