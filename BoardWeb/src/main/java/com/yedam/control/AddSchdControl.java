package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;
import com.yedam.vo.ScheduleVO;

public class AddSchdControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String title = req.getParameter("title");
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		
		ScheduleVO svo = new ScheduleVO();
		svo.setTitle(title);
		svo.setStart(start);
		svo.setEnd(end);
		
		BoardService bsvc = new BoardServiceImpl();
		
		if(bsvc.addSchedule(svo)) {
			String retCode = "success";
		}else {
			String retCode = "fail";
		}

	}

}
