package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;
import com.yedam.vo.BoardVO;

public class UpdateBoard implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String content = req.getParameter("content");
		
		
		BoardService svc = new BoardServiceImpl();
		
		BoardVO board = new BoardVO();
		
		board.setBoardNo(Integer.parseInt(bno));
		board.setContent(content);
		board.setWriter(writer);
		board.setTitle(title);
		
		System.out.println(board);
		
		if(svc.modifyBoard(board)) {
			resp.sendRedirect("boardList.do");
		}else {
			resp.sendRedirect("modifyBoard.do");
		}
		

	}

}
