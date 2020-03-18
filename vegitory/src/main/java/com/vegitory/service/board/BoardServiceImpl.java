package com.vegitory.service.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegitory.domain.BoardDTO;
import com.vegitory.persistence.BoardDAO;
import com.vegitory.persistence.ProductDAO;
import com.vegitory.service.index.IndexServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;
	
	BoardDAO bDao; // 전역변수
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	@Override
	public List<BoardDTO> freeBoardList() {
		
		return bDao.freeBoardList();
	}

}
