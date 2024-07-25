package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.MemberService;
import com.yedam.service.MemberServiceImpl;

public class RemoveStudent implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String sno = req.getParameter("sno");
		MemberService svc = new MemberServiceImpl();
		if (svc.removeStudent(sno)) {
			//성공적으로 삭제가 되면 {"retCode": "Success"}
			resp.getWriter().print("{\"retCode\": \"Fail\"}");
		}else {
			// 삭제가 실패하면 {"retCode": "Fail"}
			resp.getWriter().print("{\"retCode\": \"Fail\"}");
		}
		
	}

}
