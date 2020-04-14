package com.vegitory.contoller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vegitory.domain.BoardDTO;
import com.vegitory.domain.RecipeDTO;
import com.vegitory.domain.ReplyDTO;
import com.vegitory.service.board.BoardService;
import com.vegitory.service.board.Pager;
import com.vegitory.service.board.RecipePager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService bService;
	
	BoardDTO bDto = new BoardDTO();
	
	@GetMapping("/write")
	public String ViewWrite(){
		return "board/write";
	}
	
	@PostMapping("/write")
	public String RegisterwWrite(BoardDTO bDto){
		log.info(">>>>>>>>>>POST:BOARD WRITE ACTION");
	
		
		
		if(bDto.getFiles() == null) {
			bDto.setFilecnt(0);
		} else {
			bDto.setFilecnt(bDto.getFiles().length);
		}
		log.info("첨부파일 수: "+bDto.getFilecnt());
		bService.write(bDto);
		log.info(bDto.toString());
		//log.info("currval:" + bDto.getBno());
		String view = "redirect:/board/view?bno=" + bDto.getBno();
		return view;
		//데이터 작업한 건 반드시 redirect로 보내기!		
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
	
	@GetMapping("/list")
	public String ViewRecipeBoard(@RequestParam(defaultValue="1") int curPage,
								@RequestParam(defaultValue="new") String sort_option, 
								@RequestParam(defaultValue="all") String search_option,
								@RequestParam(defaultValue="") String keyword,
								Model model){//model 안에 curpage=1, sort_option="new"가 담겨있는 것.
		
		log.info(">>>>>>> GET: Board List Page");

		
		// 게시글 갯수 계산
		int count =  bService.rCountArticle(search_option, keyword);
		log.info(">>>>>>> GET: Board List 게시물 갯수를 셌음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		// 페이지 관련 설정
		//new Pager = 생성자 메서드, 생성자 메서드 안에 매개변수가 들어있다?! 
		// 객체생성됐네 ㅎㅎ 하고 끝나는게 아니라 무슨 일이 일어나는지 호출한 클래스를 가봐야함
		RecipePager rPager = new RecipePager(count, curPage);
		int start = rPager.getPageBegin();
		int end = rPager.getPageEnd();
		
		List<RecipeDTO> list = bService.RecipeList(sort_option, search_option, keyword, start,end); // 게시물 목록 가져오기
		//sort_option이 있어야 매퍼에 가서 키워드 검색 후 최신순, 추천순 등등으로 정렬할 수 있음. 
		log.info(">>>>>>> GET: Board List 게시물을 가져왔음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", rPager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		model.addAttribute("map", map);
		
		return "board/list";
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
	
	@GetMapping("/update")
	public String updateView(@RequestParam int bno, Model model) {
		log.info(">>>>>>>>>GET BOARD UPDATE VIEW PAGE");
		log.info(">>>>>bno: "+bno);
		
		//수정을 원하는 게시글의 정보(1줄)를 원함
		bDto = bService.freeBoardView(bno);
		model.addAttribute("one", bDto);
		model.addAttribute("flag", "update");
		log.info(">>>>>>>>>>>>>>>>>bDto입니다" + bDto);
		
		return "/board/write";
	}
	
	@PostMapping("/update")
	public String updateBoard(@RequestParam int bno, BoardDTO bDto) {
		log.info(">>>>>>>>POST: Board upate action!!!!!");
		
		if(bDto.getFiles() == null) { //첨부파일 NO
			bDto.setFilecnt(0);
		} else { //첨부파일 YES
			bDto.setFilecnt(bDto.getFiles().length);
		}
		
		bService.updateBoard(bno, bDto);
		String page = "redirect:/board/view?bno="+bno;
		return page;
	}
	
	//컨트롤러단에 한해서 매개변수에 BoardDTO bDto 써놓으면 알아서 객체 생성됨.
	// BoardDTO bDto = new BoardDTO 를 안써도 됨.
	
	@GetMapping("/answer")
	public String AnswerBoard(BoardDTO bDto, Model model) {
		log.info(">>>>>>>>>GET: Board answer view page");
		bDto = bService.freeBoardView(bDto.getBno());
		
		String newContent = "<p style='font-size:11pt'>이전 게시글 내용: </p>" +
							bDto.getView_content() +
							"<br> =================================================================================";
		bDto.setView_content(newContent);
		
		model.addAttribute("one", bDto);
		model.addAttribute("flag", "answer");
		return "board/write";
	}
	
	@PostMapping("/answer")
	public String AnswerWrite(BoardDTO bDto, Model model) {
		log.info(">>>>>>>>>>POST:ANSWER WRITE ACTION");
		// 현재 답글 (bno(메인게시글), 타입, 제목, 내용, 작성자)
		log.info("답글DTO: "+bDto.toString());
		
		BoardDTO prevDto = bService.freeBoardView(bDto.getBno());
		
		log.info("메인 게시글: "+ prevDto.toString());
		bDto.setRef(prevDto.getRef());
		bDto.setRe_level(prevDto.getRe_level());
		bDto.setRe_step(prevDto.getRe_step());
		/*
		 * ref, re_step, re_level
		 * ref = 메인 게시글 번호
		 * re_level = 메인게시글 re_level + 1
		 * re_step =  메인게시글 re_step + 1
		 */
		
		if(bDto.getFiles() == null) {
			bDto.setFilecnt(0);
		} else {
			bDto.setFilecnt(bDto.getFiles().length);
		}
		log.info("첨부파일 수: "+bDto.getFilecnt());
		
		
		bService.answer(bDto);
		
		String page = "redirect:/board/view?bno="+bDto.getBno();
		return page;
	}
	
	@PostMapping("/getAttach")
	@ResponseBody
	public List<String> getAttach(@RequestParam int bno) {
		log.info("POST >>>>>>>>>>>>>>>>>>>>>> BoARD getAttach ACTION");
		log.info("bno >>>>>>>>>>>>>>> " + bno);
		return bService.getAttach(bno);
	}
	
}
