package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.service.MemberService;
import com.yedam.service.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// id, pw 파라미터 => 게시글목록 or 로그인화면으로
		String id= req.getParameter("id");
		String pw= req.getParameter("pw");
		
		MemberService svc = new MemberServiceImpl();
		MemberVO mem = svc.loginCheck(id, pw);
		
		if(mem == null) {
			//msg를 "아이디와 비번 체크"
			req.setAttribute("msg", "아이디와 비번을 확인하세요!");
			req.getRequestDispatcher("WEB-INF/jsp/LoginForm.jsp")
			.forward(req, resp);
			
			return;
		} else {
			//세션객체(attribute)
			HttpSession session = req.getSession();
			session.setAttribute("logid", id);
			session.setMaxInactiveInterval(30 * 60); /* 세션 유지시간 ()안은 초단위 30*60 = 30분*/
			if(mem.getResponsibility().equals("User")) {
				resp.sendRedirect("boardList.do");
			} else if (mem.getResponsibility().equals("Admin")) {
				resp.sendRedirect("memberList.do");
			} else {
				System.out.println("권한을 지정하세요.");
			}
			
		}
		
		
//		if () {
//			//세션객체(attribute)
//			HttpSession session = req.getSession();
//			session.setAttribute("logid", id);
//			session.setMaxInactiveInterval(30 * 60); /* 세션 유지시간 ()안은 초단위 30*60 = 30분*/
//			resp.sendRedirect("boardList.do");
//		}else {
//			//msg를 "아이디와 비번 체크"
//			req.setAttribute("msg", "아이디와 비번을 확인하세요!");
//			req.getRequestDispatcher("WEB-INF/jsp/LoginForm.jsp")
//			.forward(req, resp);
//			
//		}

	}

}
