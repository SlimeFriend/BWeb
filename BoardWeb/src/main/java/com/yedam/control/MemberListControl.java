package com.yedam.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.MemberService;
import com.yedam.service.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class MemberListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String order = req.getParameter("orderby");
		
		order = order == null ? "user" : order;
		
		String res = req.getParameter("res");
		
		MemberService msvc = new MemberServiceImpl();
		
		List<MemberVO> members = msvc.viewUser();
		List<MemberVO> orders = msvc.orderby(order);
		List<MemberVO> cMember = msvc.res(res);
		
		
		
		req.setAttribute("members", members);
		req.setAttribute("orders", orders);
		req.setAttribute("cmem", cMember);
		
		
		req.getRequestDispatcher("admin/memberList.tiles")
		.forward(req, resp);
	}

}
