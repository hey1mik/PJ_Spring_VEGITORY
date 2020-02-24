package com.vegitory.service.member;

import com.vegitory.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입 id중복체크(AJAX)
	public int idOverlap(String id);
	
	public int memInsert(MemberDTO mDto);

}
