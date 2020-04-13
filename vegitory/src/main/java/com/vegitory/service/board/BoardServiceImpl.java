package com.vegitory.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vegitory.domain.BoardDTO;
import com.vegitory.domain.RecipeDTO;
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
	public List<RecipeDTO> RecipeList(String sort_option, String search_option, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		map.put("start",start);
		map.put("end", end);
		
		return bDao.RecipeList(map);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		return bDao.countArticle(map);
	}
	
	@Override
	public int rCountArticle(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword","%"+keyword+"%");
		return bDao.rCountArticle(map);
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

	@Override
	public int delBoard(int bno) {
		return bDao.delBoard(bno);
	}
	
	@Transactional
	@Override
	public void write(BoardDTO bDto) {
		//tbl_board에 게시글 등록(type, title, content, writer) 만 등록중. 즉, 첨부파일은 등록하지 않고 있다!!	
		bDao.write(bDto);
		//tbl_attach에 해당 게시글 첨부파일 등록
		String[] files = bDto.getFiles();
		if(files == null) {
			return;// 첨부파일 없음, 종료
		} else {
			for(String name : files) {
				// tbl_attach 테이블의 첨부파일 1건씩 등록
				bDao.addAttach(name);
			}
		}
	}

	@Override
	public void updateBoard(int bno, BoardDTO bDto) {
		bDao.updateBoard(bno, bDto);
	}

	@Override
	public void answer(BoardDTO bDto) {
		//답글 알고리즘
		//Current Status bDto:
		//answer: title, writer, type, content
		//main: bno, ref, re_level, re_step
		//1) re_step을 수정
		// : ref가 같은 row중에 메인 게시글의
		// re_step 보다 크기가 큰 값을 찾아
		// 전부 +1 => updateStep
		//답글을 등록하기 전에 같은 ref들의 re_step을 먼저 높여줘야함. 
		bDao.updateStep(bDto);
		
		//2) 답글 DB에 INSERT
		bDto.setRe_level(bDto.getRe_level()+1);
		bDto.setRe_step(bDto.getRe_step()+1);
		bDao.answer(bDto);
	}
	
	// 해당 게시글 첨부파일 목록 출력
	@Override
	public List<String> getAttach(int bno) {
		return bDao.getAttach(bno);
	}
	
}
