package com.vegitory.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.vegitory.domain.BoardDTO;
import com.vegitory.domain.RecipeDTO;

public interface BoardService {
	//페이지 목록 나누기 기능 포함
	public List<BoardDTO> freeBoardList(String sort_option, String search_option, String keyword, int start, int end);
	
	public List<RecipeDTO> RecipeList(String sort_option, String search_option, String keyword, int start, int end);
	// 게시글 갯수 계산
	public int countArticle(String search_option, String keyword);
	
	public int rCountArticle(String search_option, String keyword);
	
	public BoardDTO freeBoardView(int bno);
	
	public void increaseViewCnt(HttpSession session, int bno);
	
	public void delBoard(int bno);
	
	public void write(BoardDTO bDto);
	
	public void updateBoard(int bno, BoardDTO bDto);
	
	public void answer(BoardDTO bDto);

	public List<String> getAttach(int bno);
	
}
