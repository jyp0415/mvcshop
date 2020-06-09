package com.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.board.domain.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {

		HttpSession session = req.getSession();// 현재 세션 불러오기
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member == null) { //로그인 안되있을 경우 
			res.sendRedirect("/member/signin");
			return false;
		}

		if (member == null || member.getVerify() != 1) {
			res.sendRedirect("/");
			return false; // ?
		}

		return true;
	}
}