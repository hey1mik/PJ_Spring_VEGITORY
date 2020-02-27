package com.vegitory.persistence;

import com.vegitory.domain.MemberDTO;

public interface LoginDAO {
	// 로그인
	public MemberDTO loginUser(MemberDTO mDto);
	
}
