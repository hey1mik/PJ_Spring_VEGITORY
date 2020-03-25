package com.vegitory.contoller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	BoardDTO bDto = new BoardDTO();
	
	
	@GetMapping("/list")
	public String ViewBoard(){
		return "board/list";
	}
	@GetMapping("/freelist")
	public String ViewFreeBoard(@RequestParam(defaultValue="1") int curPage,
								@RequestParam(defaultValue="new") String sort_option, 
								@RequestParam(defaultValue="all") String search_option,
								@RequestParam(defaultValue="") String keyword,
								Model model){//model 안에 curpage=1, sort_option="new"가 담겨있는 것.
		
		log.info(">>>>>>> GET: Board List Page");

		
		// 게시글 갯수 계산
		int count =  bService.countArticle(search_option, keyword);
		log.info(">>>>>>> GET: Board List 게시물 갯수를 셌음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		// 페이지 관련 설정
		//new Pager = 생성자 메서드, 생성자 메서드 안에 매개변수가 들어있다?! 
		// 객체생성됐네 ㅎㅎ 하고 끝나는게 아니라 무슨 일이 일어나는지 호출한 클래스를 가봐야함
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardDTO> list = bService.freeBoardList(sort_option, search_option, keyword, start,end); // 게시물 목록 가져오기
		//sort_option이 있어야 매퍼에 가서 키워드 검색 후 최신순, 추천순 등등으로 정렬할 수 있음. 
		log.info(">>>>>>> GET: Board List 게시물을 가져왔음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		model.addAttribute("map", map);
		
		return "board/freelist";
	}
	
	
	@GetMapping("/view")
	public String ViewFreeBoardView(@RequestParam int bno,
									HttpSession session,
									//PathVariable은 옵션이 value 하나밖에 없음!
									Model model){
		log.info(">>>>>>>>>> GET: BOARD DETAIL PAGE");
		
		//1. 해당 bno의 조회수+1 증가
		bService.increaseViewCnt(session, bno);
		//2. DB에서 해당 bno정보를 get해서 view단으로 전송하는 과정
		bDto = bService.freeBoardView(bno);
		model.addAttribute("view", bDto);
		model.addAttribute("key", "dropBoard");
		
		return "board/view";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int bno) {
		log.info(">>>>>>>>>>GET: Board delete Action");
		bService.delBoard(bno);
	
		return "redirect:/board/freelist";
	}
	
}
