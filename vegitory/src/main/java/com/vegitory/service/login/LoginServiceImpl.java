package com.vegitory.service.login;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.vegitory.domain.MemberDTO;
import com.vegitory.persistence.LoginDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService {
	
	private LoginDAO lDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	public void newLoginDAO() {
		lDao = sqlSession.getMapper(LoginDAO.class);
	}

	@Override
	public int login(MemberDTO mDto, HttpSession session) {
		// 비즈니스로직 처리
		// 1.DB에가서 회원인지 아닌지 유무 체크
			MemberDTO loginDto = lDao.loginUser(mDto);
		
		
		// 로그인 결과값
			int result = 0;
		// result 결과
		// 0: 등록된 회원이 아닙니다. 회원가입을 진행해주세요.
		// 2: 이메일 인증을 하셔야만 로그인할 수 있습니다.
		// 1: 로그인 성공
		// 3: 아이디 또는 비밀번호가 잘못되었습니다. 다시 확인해주세요.	
			
		// 회원 정보가 없는 경우
			if(loginDto == null) {
				result = 0;
				return result;
			}
			
			//탈퇴한 회원인 경우
			if(loginDto.getUseyn().equals("d")) {
				result = 3;
				return result;
			}
			
			// 인증을 안했을 경우
			if(!(loginDto.getUseyn().equals("y"))) {
				result = 2;
				return result;
			}
			// 회원정보가 있고 인증을 한 경우
			if(loginDto != null) {
				// 아이디와 패스워드가 같은 지 체크
				if(passwordEncoder.matches(mDto.getPw(), loginDto.getPw())) {
					// 로그인 진행~
					result = 1;
					session.removeAttribute("userid"); // 초기화해주는 개념. 안써도 되긴하는데 웬만하면 쓰는게좋다.
					session.removeAttribute("name"); // 여기도! 웬만하면 써주자.
					session.setAttribute("userid", loginDto.getId());
					session.setAttribute("name", loginDto.getName());
				
					// session에서 userid 값을 달라고 했는데 나한테 null값을 준다?
					// 그것은 login이 안됐다는 뜻이다.
					
				} else {
					result = 3;
				}
			}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
}
