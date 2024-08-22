package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;
import com.yedam.vo.ScheduleVO;

public class DeleteSchdControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		String title = req.getParameter("title");
		
		BoardService bsvc = new BoardServiceImpl();
		ScheduleVO svo = new ScheduleVO();
		svo.setEnd(end);
		svo.setStart(start);
		svo.setTitle(title);
		
		if(bsvc.delSchedule(svo)) {
			
		}

	}

}
