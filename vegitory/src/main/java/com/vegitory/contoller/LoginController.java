package com.vegitory.contoller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.vegitory.domain.MemberDTO;
import com.vegitory.service.login.LoginService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/login")
@RestController 
public class LoginController {
		@Autowired
		LoginService lService;
		
//@RestController는 @ResponseBody를 default로 붙게해주는 것.	
//Controller내의 모든 메서드들이 @ResponseBody를 사용해야할 때(ajax작업을 할 때) 쓰면 편하다 		
		@PostMapping("/in")
		public Integer logIn(MemberDTO mDto, HttpSession session) {
			log.info(">>>>>> POST: LOGIN/LOGIN ACTION");
			log.info(mDto.toString());
			
			
			// 로그인
			int result = lService.login(mDto, session);
			
			return result;
		}
		
	
		@PostMapping("/out")
		public void logOut(HttpSession session) {
			log.info(">>>>>> POST: LOGOUT/LOGOUT ACTION");
			lService.logout(session);
		}
}
