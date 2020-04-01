/*
 * Login이 필요한 기능 수행시
 * Session 체크를 하는 Interceptor
 */

package com.vegitory.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	//interceptor는 url만 신경쓰지 request방식이 get인지 post인지는 중요하지 않음
	//request(GET, POST) <-> response(forward, sendRedirect)
	
	//URL 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Session 객체 생성
		HttpSession session = request.getSession();
		
		String referer = request.getHeader("referer");
		log.info(">>>>>>>이전 url: "+referer);
		
		if(session.getAttribute("userid") == null) {
			log.info(">>>>>>>>>>>>>>>>>>>>>>>>>NO LOGIN!!!!!!");
			//이전 페이지 url을 GET
				if(referer == null) {
					//외부에서 접속했을 때
					referer = "http://localhost:8081/vegitory/";
					
				} else {
					
					// 게시판 내부에서 접속했는데 아이디가 없을 때
					int index = referer.lastIndexOf("/");
					int len = referer.length();
					log.info(">>>>> 인덱스: " + index);
					log.info(">>>>> 길이: " + len);
					String mapWord = referer.substring(index, len);
					log.info("수정된 url: " + mapWord);
					log.info(">>>>이전 url :"+referer);
					
					if(mapWord.equals("/write")) {
						response.sendRedirect(request.getContextPath() + "/board/freelist");
						return false;
					}
			
			
			String uri = request.getRequestURI();	
			log.info(">>>>>>목적지 : "+uri);
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			fMap.put("uri", uri);

			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
				// 이동 x
				}
				return false; 
		} else { //login ok
			log.info(">>>>>>>>>>>>>>>>>>>>>>>>>LOG IN ^^!");
			return true;// 원래 가려던 곳 이동
		}
	}
	
	//URL 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}
