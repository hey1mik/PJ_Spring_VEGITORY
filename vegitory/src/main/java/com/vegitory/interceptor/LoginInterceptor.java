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
	//URL 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Session 객체 생성
		HttpSession session = request.getSession();
		if(session.getAttribute("userid") == null) {
			log.info(">>>>>>>>>>>>>>>>>>>>>>>>>NO LOGIN!!!!!!");
			//이전 페이지 url을 GET
			String referer = request.getHeader("referer");
			log.info(">>>>>>>이전 url: "+referer);
			
			//interceptor는 url만 신경쓰지 request방식이 get인지 post인지는 중요하지 않음
			//request(GET, POST) > response(forward, sendRedirect)
			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");

			if(referer == null) {
				referer = "http://localhost:8081/vegitory/";
			}
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			return false; // 이동 x
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
