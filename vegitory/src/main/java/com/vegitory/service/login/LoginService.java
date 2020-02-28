package com.vegitory.service.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.vegitory.domain.MemberDTO;

@Service
public interface LoginService {
	//로그인
	public int login(MemberDTO mDto, HttpSession session);
	//로그아웃
	public void logout(HttpSession session);
}
