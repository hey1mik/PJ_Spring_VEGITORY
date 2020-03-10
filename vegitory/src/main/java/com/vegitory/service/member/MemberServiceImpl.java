package com.vegitory.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.vegitory.domain.MemberDTO;
import com.vegitory.persistence.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	private MemberDAO mDao;
	
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	@Override
	public int idOverlap(String id) {
		return mDao.idOverLap(id);
	}

	@Override
	public int memInsert(MemberDTO mDto) {
		return mDao.memInsert(mDto);
	}

	@Override
	public MemberDTO userView(String id) {
		return mDao.userView(id);
	}

	@Override
	public void memUpdate(MemberDTO mDto, HttpSession session) {
		int result = mDao.memUpdate(mDto);
		
		if(result > 0) { // 수정 성공
			session.removeAttribute("name"); 
			session.setAttribute("name", mDto.getName());
		}
		
	}

	@Override
	public int pwCheck(String id, String pw) {
		
		String encPw = mDao.pwCheck(id);
		log.info("DB에 들어간 비밀번호: "+encPw);
		int result = 0;
		if(passwordEncoder.matches(pw, encPw)) {
			result = 1;
		}
		return result;
	}

	@Override
	public int pwUpdate(MemberDTO mDto) {
		int result = 0;
		result = mDao.pwUpdate(mDto);
		return result;
	}
}
