package com.vegitory.service.board;

import java.util.List;

import com.vegitory.domain.BoardDTO;

public interface BoardService {
	//페이지 목록 나누기 기능 포함
	public List<BoardDTO> freeBoardList(String sort_option, String search_option, String keyword, int start, int end);
	// 게시글 갯수 계산
	public int countArticle(String search_option, String keyword);
	
	public BoardDTO freeBoardView(int bno);
}
