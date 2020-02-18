package com.vegitory.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.vegitory.domain.ProductDTO;
import com.vegitory.service.index.IndexService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	//@Inject 또는 @Autowired 또는 @Resources 중 1개라도 붙어있으면 의존성 주입이라는 뜻!
	
	//@Inject와 @Autowired는 타입(변수 타입)으로 의존성 주입
	//@Inject는 JAVA에서 지원하는 것이고 @Autowired는 Spring에서 지원하는 것
	
	//@Resource는 변수명으로 의존성 주입!
	
	@Autowired
	IndexService iService; //여기에 indexServiceImpl Beans가 들어간거나 마찬가지
	
	@GetMapping("/index")
	public String indexView(Model model) {
		log.info(">>>>>> INDEX PAGE 출력");
		
		//1. View단에 출력할 베스트 상품 5건
		model.addAttribute("BestPdt",iService.bestPdtList());
		//2. View단에 출력할 신상품 5건
		//신상품 5건을 출력하는 비즈니스 로직을 처리하는
		// 서비스단으로 이동
		
		model.addAttribute("NewPdt",iService.newPdtList());
		
		//2. 출력할 화면을 결정
		return "index";
		
		// 1,2를 가지고 dispatcher servlet으로 gogo!
	}
	
	@GetMapping("/constract")
		public String constractView(Model model) {
		log.info(">>>>>> INDEX PAGE 출력");
		
		return "constract";
	}
}
