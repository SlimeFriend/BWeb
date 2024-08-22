package com.yedam.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;
import com.yedam.vo.ScheduleVO;

public class FullCalendar implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// "[{"title":"sample", "start":"2023-01-21T13:00:00", "end": "2023-01-21T16:00:00"}]"
		resp.setContentType("text/json;charset=utf-8");
	
		BoardService svc = new BoardServiceImpl();
		
		List<ScheduleVO> slist = svc.scheduleList();
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(slist);
		
		resp.getWriter().print(json);
	}

}
