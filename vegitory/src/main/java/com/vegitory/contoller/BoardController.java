package com.vegitory.contoller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vegitory.domain.BoardDTO;
import com.vegitory.service.board.BoardService;

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
	public String ViewFreeBoard(Model model){
		log.info(">>>>>>> GET: Board List Page");
		
		List<BoardDTO> list = bService.freeBoardList();
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		
		model.addAttribute("map", map);
		
		return "board/freelist";
	}
}
