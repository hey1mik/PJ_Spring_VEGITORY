package com.vegitory.contoller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vegitory.domain.MemberDTO;
import com.vegitory.service.mail.MailService;
import com.vegitory.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private MailService mailService;
	
	/*SessionAttributes로 설정된 변수는
	 * response를 하기 전에 서버의 기억장소 어딘가에 임시로 보관을 해둔다
	 * web browser와 server간에 한 번이라도 연결이 이루어졌으면
	 * session에 등록된 변수는 서버가 중단될때까지 그 값이 그대로 유지된다.
	 * web은 클라이언트의 request를 서버가 받아서
	 * response를 수행하고 나면 모든 정보가 사라지는 특성이 있다.
	 * 이런 특성과는 달리 Spring기반의 web은 일부 데이터들을
	 * 메모리에 보관했다가 재사용하는 기법이 있다.
	 * 그 중 SessionAttributes라는 기능이 있다.
	 * 
	 * sessionAttributes()에 설정하는 문자열(이름)은
	 * 클래스의 표준 객체생성 패턴에 의해 만들어진 이름
	 * MemoDTO memoDTO
	 */
	
	@Autowired
	MemberService mService;
	
	
	/*
	 * SessionAttributes를 사용하기 위해서는
	 * 반드시 해당 변수를 생성하는 method가 controller에 있어야하고
	 * 해당 메서드에는 @ModelAttribute("변수명")가 있어야 한다. => 초기화 작업,변수선언같은거
	 */
	@GetMapping("/constract")
	public String viewConstract() {
		log.info(">>>>>>>> MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
	}
	
	/*
	 * SessionAttributes에서 설정한 변수(객체)에는 
	 * @ModelAttribute를 설정해두어야한다.
	 * 단, 5.x 이하에서는 필수 5.x 이상에서는 선택
	 * 
	 * 만약 Attributes의 이름을 표준패턴이 아닌 임의의 이름으로 사용할 경우
	 * @ModelAttribute("객체이름")을 필수로 지정해주어야한다.
	 */
	
	@GetMapping("/join")
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, 
					   @RequestParam(value="flag", defaultValue="0") String flag, Model model) {
		log.info("GET방식");
		log.info(mDto.toString());
		log.info(flag);
		model.addAttribute("flag",flag);
		
		return "member/join";
	}
	
	@GetMapping("/drop")
	public String viewDrop() {
		log.info(">>>>>>>> MEMBER/CONSTRACT PAGE 출력");
		return "member/drop";
	}
	
	
	// 회원가입 ID 중복체크
	@ResponseBody
	@PostMapping("/idoverlap")
	public String idOverlap(String id) {
		log.info(">>>> ID OVERLAP CHECK");
		log.info("아이디: "+id);
		
		int cnt = mService.idOverlap(id);
		
		String flag = "1";
		if(cnt == 0) {
			flag = "0";
		}
		
		return flag;
	}
	/*
	 * join POST가 mDto를 수신할 때
	 * 입력 form에서 사용자가 입력한 값들이 있으면
	 * 그 값들을 mDto의 필드변수에 setting을 하고
	 * 
	 * 만약 없으면
	 * 메모리 어딘가에 보관 중인 SessionAttributes로 설정된
	 * mDto변수에서 값을 가져와서 비어있는
	 * 필드변수를 채워서 매개변수에 주입한다.
	 * 
	 * 따라서 form에서 보이지 않아도 되는 값들은
	 * 별도의 코딩을 하지 않아도
	 * 자동으로 join POST로 전송되는 효과를 낸다.
	 * 단, 이 기능을 효율적으로 사용하려면
	 * jsp 코드에서 Spring-form tag로 input을 코딩해야 한다.
	 */
	@PostMapping("/join")
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, 
						SessionStatus sessionStatus, 
						HttpServletRequest request,
						RedirectAttributes rttr) {
		//view단에서 controller단으로 이동	
		log.info(">>>>>>> MEMBER/JOIN POST출력");
		//view단에서 전송된 데이터가 잘 전달됐는지 확인
		log.info(mDto.toString());
			
			log.info("password: " + mDto.getPw());// 사용자 입력 pw값
			//1. 사용자 암호 hash 변환
			String encPw = passwordEncoder.encode(mDto.getPw());
			mDto.setPw(encPw);
			log.info("Password(+Hash): " + mDto.getPw());
			
			//DB에 회원 등록
			int result = mService.memInsert(mDto);
			
			//3. 회원 등록 결과
			if(result > 0) {
				log.info(">>>>>>>" + mDto.getId() + "님 회원가입되셨습니다~ 축하합니다♪");
			}
		
			
			
			//SessionAttributes를 사용할 때 insert, update가 완료되고
			//view로 보내기 전 반드시 setComplete()를 실행하여
			//session에 담긴 값을 clear해주어야 한다.
			
			//4. 회원가입 인증메일 보내기
			mailService.mailSendUser(mDto.getEmail(), mDto.getId(), request);
			sessionStatus.setComplete();
			
			// 회원가입 후 메시지 출력을 위한 값 전달
			rttr.addFlashAttribute("id", mDto.getId());
			rttr.addFlashAttribute("email", mDto.getEmail());
			rttr.addFlashAttribute("key", "join");
			
		return "redirect:/";
	}
	
	//회원가입 후 email 인증
	@GetMapping("/keyauth") 
	public String KeyAuth(String id, String key, RedirectAttributes rttr) {
		mailService.keyAuth(id, key);
		
		// 인증 후 메시지 출력을 위한 값 전달
		rttr.addFlashAttribute("id", id);
		rttr.addFlashAttribute("key", "auth");
		
		 return "redirect:/";
	}

	
}
