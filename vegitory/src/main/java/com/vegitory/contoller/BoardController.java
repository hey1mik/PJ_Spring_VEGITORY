package com.vegitory.contoller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vegitory.domain.BoardDTO;
import com.vegitory.service.board.BoardService;
import com.vegitory.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String ViewBoard(){
		return "board/list";
	}
	@RequestMapping("/freelist")
	public String ViewFreeBoard(@RequestParam(defaultValue="1") int curPage, Model model){
		log.info(">>>>>>> GET: Board List Page");
		// 게시글 갯수 계산
		int count =  bService.countArticle();
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardDTO> list = bService.freeBoardList(start,end); // 게시물 목록 가져오기
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		
		model.addAttribute("map", map);
		
		return "board/freelist";
	}
}
