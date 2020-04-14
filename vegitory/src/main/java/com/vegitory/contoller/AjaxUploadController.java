package com.vegitory.contoller;
import java.io.File;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.vegitory.service.board.BoardService;
import com.vegitory.util.MediaUtils;
import com.vegitory.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AjaxUploadController {
	
	//@Autowired랑 @Inject는 타입으로 가져오고 @Resource는 이름으로 가져옴
	@Autowired
	BoardService bService;
	
	//업로드 디렉토리 servlet-context.xml에 설정되어 있음.
	//의존성 주입 세가지중 하나. 
	@Resource(name = "uploadPath")
	String uploadPath;
	
	// Upload File 멀티파트파일에 save
	@ResponseBody
	@RequestMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8") //produces 이거 붙여주면 데이터 안깨짐
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception { //MutipartFile 객체의 file을 받은것임. 예외는 던져버리기.
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
		//UploadFileUtils라는 객체는 static 클래스이기때문에 객체생성을 안하고 바로 사용할 수 있음.
		// 스트림은 개별 바이트나 문자열인 데이터의 원천이다. 즉, file.getBytes()가 실질적인 데이터라고 볼 수 있다. 
		// 딱 한번만 쓰는거라 따로 변수에 안담고 new ResponseEntity처럼 객체생성한채로 사용.
		// <> 꺽쇠가 아니라 제네릭...  얘가 하는 역할은 타입을 체크하는 역할. 일종의 유효성 체크. 
		//객체 생성된 인스턴스에 뭔가 넣을려면 반드시 String 타입의 data만 들어올수있다.
		// HttpStatus.OK는 성공했다는 표시. 성공시에 200이라는 숫자를 보냄.
		// ResponseEntity(uploadFile, filename, byte, httpstatus); 이런애들 return 값으로 보내주세요. 
		
	}
	
	// 이미지 표시 기능
	@ResponseBody
	@RequestMapping("upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			//확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
//					if(mType != null) { // 이미지 파일이면
//						headers.setContentType(mType);
//					} else { // 이미지가 아니면
					fileName = fileName.substring(fileName.indexOf("_") + 1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition","attachment; filename=\"" + new String(fileName.getBytes("utf-8"),"iso-8859-1") + "\"");
				//}
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			} catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			} finally {
				if(in != null)
					in.close();
			}
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/upload/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		log.info("fileName: " + fileName);
		// fileName = /2020/04/10/98e664ce-1210-43f3-b1a9-d5a5b80e82d8_zz.txt
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		//txt
		MediaType mType = MediaUtils.getMediaType(formatName);
		if(mType != null) { // 이미지 파일이면 원본이미지 삭제
			String front = fileName.substring(0,12);
			//front : /2020/04/10/
			//end : 98e664ce-1210-43f3-b1a9-d5a5b80e82d8_zz.txt
			String end = fileName.substring(14);
			//File.separatorChar : 유닉스 / 윈도우즈 \
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
			//replace : c:\\upload\2020\04\10\98e664ce-1210-43f3-b1a9-d5a5b80e82d8_zz.txt
			//원본 이미지만 삭제
			
		} else {
			//원본파일삭제(이미지면 썸네일 삭제)
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
			//delete >> c:\\developer\ upload\2020\04\10\s_98e664ce-1210-43f3-b1a9-d5a5b80e82d8_zz.txt
			// 썸네일 이미지 삭제 or 이미지가 아닌 첨부파일 삭제
			
		}
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping("upload/deleteAllFile")
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
		log.info("delete all files: " + files);
		if(files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				
				new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
			}
			
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
			
		}
	
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	

}
