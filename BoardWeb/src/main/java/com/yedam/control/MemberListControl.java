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
		
		MemberService msvc = new MemberServiceImpl();
		
		List<MemberVO> members = msvc.viewUser();
		List<MemberVO> imembers = msvc.orderbyId();
		
		req.setAttribute("members", members);
		req.setAttribute("imembers", imembers);
		
		
		req.getRequestDispatcher("admin/memberList.tiles")
		.forward(req, resp);
	}

}
