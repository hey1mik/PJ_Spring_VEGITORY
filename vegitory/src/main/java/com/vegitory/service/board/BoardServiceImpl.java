package com.vegitory.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public List<BoardDTO> freeBoardList(String sort_option, String search_option, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		map.put("start",start);
		map.put("end", end);
		
		return bDao.freeBoardList(map);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		return bDao.countArticle(map);
	}

	@Override
	public BoardDTO freeBoardView(int bno) {
		
		return bDao.freeBoardView(bno);
	}

	@Override
	public void increaseViewCnt(HttpSession session, int bno) {
		// now_time: 현재시간
		// plus_time: 조회수 + 1 시간
		// now_time - plus_time = 조회수 +1 한 뒤 지난 시간
		
		long update_time = 0; // 조회수 +1 증가한 시간
		if(session.getAttribute("update_time_"+bno) != null) {
			//최근에 조회수를 올린 시간
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		// 현재시간
		long current_time = System.currentTimeMillis();
		
		// 일정시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 24 * 60 * 60 * 1000) {
			bDao.increaseViewCnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		
		}
		
	}

}
