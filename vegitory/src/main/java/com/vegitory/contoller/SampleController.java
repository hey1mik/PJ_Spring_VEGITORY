package com.vegitory.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vegitory.domain.SampleDTO;

import lombok.extern.slf4j.Slf4j;

// lombok라이브러리의 log기능을 사용
@Slf4j

// Spring이 동작시 DispatcherServlet 생성과정에서
// servlet-context.xml의 환경설정을 읽어들이는데
// servlet-context.xml 내의 component-scan이
// 설정된 경로를 돌아다니며 @Controller가 붙어있는
// Class들을 전부 Spring Context에 Beans로 등록시켜주기 위해서 사용
// Spring Context에 Beans로 등록되어있어야
// DispatcherServlet이 Handler Mapping과
// Handler Adapter를 통해 요청처리를 시킬 수 있음
// Spring Context에 Beans로 등록되었다! = Spring이 객체의 제어권을 개발자로부터 넘겨받았다.(IOC패턴)
// Spring Context에 Beans로 등록되어있는 객체들만
// 의존성 주입 가능(DI패턴)
@RequestMapping("/sample")
@Controller
public class SampleController {
		
	// smaple.jsp 출력!
	//그냥 @RequestMapping은 GET/POST 둘다 탄다.
		@RequestMapping("/")
		public String print() {
			return "sample";
		}
	//@RequestMapping(value="/sample/view", method=RequestMethod.GET)
		@GetMapping("/view")
		public String view(String user, String pass) {
			log.info(user + " GET 방식 호출!! "+ pass);
			return "result";
		}
		
		//(과거) view 단으로부터 데이터를 받는 방법, POJO 방식
		//public String view(HttpServletRequest request) 
		// String user = request.getParameter("user");
		// String pass = request.getParameter("pass");
		// request.getParameter(""); 값을 모두 String 타입으로 받음
		// 개발자가 받아서 형변환하는 작업이 필수!
		// 추가로 값을 view단에서 넘겨주지 않으면 null값이 들어가
		// 하단에 매개변수를 사용하는 부분에서 전부 error 발생
		// null 체크 해주는 코드 필수!
		
		//@RequestMapping(value="/sample/view", method=RequestMethod.POST)
		@PostMapping("/view")
		public String view(SampleDTO sDto) {
			//input 2개의 값을 전달(name 속성값)
			//name=user, name=pass
			log.info("POST 방식 호출");
			//log.info(user + "," + pass);
			log.info(sDto.toString());
			return "result";
		}
}
