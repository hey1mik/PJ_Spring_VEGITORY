package com.vegitory.service.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegitory.domain.MemberDTO;
import com.vegitory.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	private MemberDAO mDao;
	
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
}
