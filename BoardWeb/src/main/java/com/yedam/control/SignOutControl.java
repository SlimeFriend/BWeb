package com.yedam.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.service.MemberService;
import com.yedam.service.MemberServiceImpl;

public class SignOutControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		
		Map<String,String> map = new HashMap<>();
		map.put("memberId", (String)session.getAttribute("logid"));
		
		MemberService svc = new MemberServiceImpl();
		svc.signOutProc(map);
		
		System.out.println("code: " + map.get("retCode"));
		System.out.println("msg: " + map.get("retMsg"));
		session.invalidate();
		
		resp.sendRedirect("boardList.do");
		
	}

}
