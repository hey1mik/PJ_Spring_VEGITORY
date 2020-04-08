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
		//이동하기 전에 있던 페이지 url
		String referer = request.getHeader("referer");
		//Referer 페이지의 쿼리스트링 구하는 법
		String qString = request.getQueryString();
		// 이동하려고 했던 page url
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String nextUrl = uri.substring(ctx.length());
		String prevUrl = "";
		String finalUrl = "http://localhost:8081/vegitory/";
		
		//1.url을 direct로 치고 들어간 경우
		if(referer == null) {
			log.info("WARNING>>>>>>> 비정상적인 접근 :( ");
			response.sendRedirect(finalUrl);
			return false;
		} else {
		//1.게시판 내에서 클릭해서 들어간 경우
			// 1)세션값에 아이디가 없는 상태로 뭔가를 하려는 경우
			if(session.getAttribute("userid") == null) {
				
				//1)-1 작업을 끝내지 않은 채로 로그아웃하는 등 로그백이 일어나는 경우 (수정, 삭제)
				int indexQuery = referer.indexOf("?");
				if(indexQuery == -1) {
					prevUrl = referer.substring(finalUrl.length()-1);
				} else {
					prevUrl = referer.substring(finalUrl.length()-1, indexQuery);
				}
				log.info("PREV URL >>>>>" + prevUrl);
				log.info("NEXT URL >>>>>" + nextUrl);
				
				if(nextUrl.equals("/board/update") || nextUrl.equals("/board/delete")) {
					log.info(">>>>>>>>>>>>>>>>>>: "+prevUrl.indexOf("board/view"));
					if(prevUrl.indexOf("board/view") == -1) {
						log.info("WARNING >> 비정상적인 접근 :( ");
						response.sendRedirect(finalUrl);
						return false;
					}
				}
				
				//1)-2 작업을 끝내지 않은 채로 로그아웃하는 등 로그백이 일어나는 경우 (글작성)
				if(prevUrl.equals(nextUrl)) {
					log.info(">>>>>>>>>>>>>>>>>>>>>>WARNING >> PrevUrl == nextUrl :/");
					response.sendRedirect(finalUrl);
					return false;
				}
				
		  //1)-3 로그인 하지 않은 채로 글쓰기나 마이페이지 등을 누르는 경우	
					FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
					fMap.put("message", "nologin");
					if(qString != null) {
						uri = uri + "?" + qString;
					}
					fMap.put("uri", uri);
					RequestContextUtils.saveOutputFlashMap(referer, request, response);
					response.sendRedirect(referer);
					return false; 
			} 
		
			else { //2)정상적인 접근을 했고 아이디값도 있는 경우
			log.info(">>>>>>>>>>>>>>>>>>>>>>>>>LOG IN ^^!");
			return true;// 원래 가려던 곳 이동
			}
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
