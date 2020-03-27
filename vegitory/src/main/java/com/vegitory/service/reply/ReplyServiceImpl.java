package com.vegitory.service.reply;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vegitory.domain.ReplyDTO;
import com.vegitory.persistence.BoardDAO;
import com.vegitory.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	ReplyDAO rDao; // 전역변수
	BoardDAO bDao;
	
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	@Autowired
	public void newReplyDAO() {
		rDao = sqlSession.getMapper(ReplyDAO.class);
	}
	
	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}

	@Override
	public void insert(ReplyDTO rDto) {
		//비즈니스 로직
		//해당 게시글에 댓글을 등록하고
		//해당 게시글의 reply_cnt를 +1함
		//1. 댓글등록
		rDao.insert(rDto);
		
		String type = "plus";
		HashMap<String,Object> map = new HashMap<>();
		map.put("bno", rDto.getBno());
		map.put("type", type);
		bDao.replyCntUpdate(map);
		
		
	}

	@Override
	public void delete(int rno, int bno) {
		rDao.delete(rno);
		
		String type = "minus";
		HashMap<String,Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("type", type);
		bDao.replyCntUpdate(map);
		
	}

}
