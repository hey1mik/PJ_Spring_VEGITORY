package com.vegitory.persistence;

import com.vegitory.domain.MemberDTO;

public interface MemberDAO {
	public int idOverLap(String id);	
	public int memInsert(MemberDTO mDto);
}
