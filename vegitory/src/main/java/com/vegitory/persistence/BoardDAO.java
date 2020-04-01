package com.vegitory.persistence;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.vegitory.domain.BoardDTO;
import com.vegitory.domain.RecipeDTO;
import com.vegitory.domain.ReplyDTO;


public interface BoardDAO {
	//db연동해서 게시글 가져오기
	public List<BoardDTO> freeBoardList(@Param("map") Map<String, Object> map);
	//게시글 갯수 계산
	public List<RecipeDTO> RecipeList(@Param("map") Map<String, Object> map);
	
	public int countArticle(@Param("map") Map<String, Object> map);
	
	public int rCountArticle(@Param("map") Map<String, Object> map);
	
	public BoardDTO freeBoardView(int bno);
	
	public int increaseViewCnt(@Param("bno") int bno);
	
	public int delBoard(@Param("bno") int bno);
	
	public void replyCntUpdate(@Param("map") Map<String, Object> map);
	
	public void write(@Param("board")BoardDTO bDto);
	
}
