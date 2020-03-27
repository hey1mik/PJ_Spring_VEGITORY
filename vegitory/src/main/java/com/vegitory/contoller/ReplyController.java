package com.vegitory.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vegitory.domain.ReplyDTO;
import com.vegitory.service.reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private ReplyService rService;

	//ResponseBody를 안붙이는 이유: 컨트롤러에 들어온 데이터를 보내주고싶은게 아니라, 
	// 댓글 페이지의 html 자체를 보내주고싶은거라서 ResponseBody를 붙이면 안됨
	
	// ResponseBody를 붙여서 개발을 한다고 치자.
	// 그러면 list에 담겨있는 댓글들 자체가 데이터로 화면단에 넘어갈텐데,
	// 그 데이터로 화면단에 일일히 작업하는 것도 문제지만 진짜 문제는
	// 댓글을 등록하거나 삭제할때마다 댓글이 한칸씩 들어가거나 빠지는데,
	// 데이터 자체를 보내서 ajax자체에서 forEach를 돌리려고 하면, 
	// 그 작업이 안되어버림. (반복 도는게 최초 1회뿐이라서, 새로고침이 안되는거라고 생각하면됨.)
	// 그래서 옛날엔 script에 for문을 써서 innterHTML(댓글 디자인)으로 구현을 했음.
	// 이 방법의 문제는? ==> 가독성이 떨어짐.(body 부분이 아니라 스크립트에 태그가 들어오는거니까.)
	// 그래서 요새는 지금 우리가 하고 있는 것 처럼 AJAX를 써서 페이지 자체를 뿌려주는 방식으로 변경함. 
	
	
	@GetMapping("/freelist")
	public String list(int bno, Model model) {
		log.info(">>>>>>>>GET: Reply List Page");
		model.addAttribute("list", rService.list(bno));
		return "/board/commentlist";
	}
	
	@ResponseBody
	@PostMapping("/insert")
	public void insert(ReplyDTO rDto) {
		log.info(">>>>>>>>POST: Reply Insert DB");
		log.info(rDto.toString());
		
		rService.insert(rDto);
		
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public void delete(int rno, int bno) {
		log.info(">>>>>>>>GET: RNO 정보 받았음!");
		log.info("하하"+rno);
		
		rService.delete(rno, bno);
	}
}
