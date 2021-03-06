package com.vegitory.persistence;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.vegitory.domain.AttachDTO;
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
	
	public void delBoard(@Param("bno") int bno);
	
	public void replyCntUpdate(@Param("map") Map<String, Object> map);
	
	public void write(@Param("board")BoardDTO bDto);
	
	public void updateBoard(@Param("board")int bno, @Param("board")BoardDTO bDto);
	
	//게시글 답글 등록
	public void answer(BoardDTO bDto);
	
	//re_step 수정
	public void updateStep(BoardDTO bDto);
	
	public void addAttach(@Param("fullName")String fullName);
	
	public List<String> getAttach(int bno);
	
	public void deleteAttach(int bno);
	
	public void updateAttach(@Param("fullName") String fullName, @Param("bno") int bno);
	
	//하루전 첨부파일 목록 조회
	public List<AttachDTO> getOldFiles(@Param("ydate") String ydate);
	
}
