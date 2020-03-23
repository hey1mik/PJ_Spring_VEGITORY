package com.vegitory.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.vegitory.domain.BoardDTO;


public interface BoardDAO {
	//db연동해서 게시글 가져오기
	public List<BoardDTO> freeBoardList(@Param("map") Map<String, Object> map);
	//게시글 갯수 계산
	public int countArticle(@Param("map") Map<String, Object> map);
	
	public BoardDTO freeBoardView(int bno);
}
