package com.yedam.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.control.AddBoardControl;
import com.yedam.control.BoardForm;
import com.yedam.control.BoardListControl;
import com.yedam.control.DeleteBoard;
import com.yedam.control.StudentListControl;
import com.yedam.control.UpdateBoard;
import com.yedam.control.mdBoardControl;
import com.yedam.control.rmBoardControl;

/*
 * FrontController 역할은 사용자의 모든 요청을 처리
 * 서블릿, a.do, sample.dom
 * 객체 생성 -> init -> service -> destroy.    서블릿의 생명주기
 */
public class FrontController extends HttpServlet{
	
	Map<String, Control> map;
	
	public FrontController() {
		map = new HashMap<>();
	}
	
	@Override
	public void init() throws ServletException {
		map.put("/boardList.do", new BoardListControl());
		// 글등록 구현 : 등록화면(boardForm.do) + DB등록(addBoard.do) -> 글목록페이지이동.
		map.put("/boardForm.do", new BoardForm());
		map.put("/addBoard.do", new AddBoardControl());
		//학생목록
		map.put("/stdList.do", new StudentListControl());
		map.put("/board.do", new Board());
		//삭제 화면
		map.put("/removeBoard.do", new rmBoardControl());
		//삭제 기능
		map.put("/deleteBoard.do", new DeleteBoard());
		//수정 화면
		map.put("/modifyBoard.do", new mdBoardControl());
		//수정 기능
		map.put("/updateBoard.do", new UpdateBoard());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// boardList.do -목록. addBoard.do -등록.
		String uri = req.getRequestURI(); 
		// URL(http://localhosst/BoardWeb/boardList.do) vs URI(/BoardWeb/boardList.do)
		String context = req.getContextPath(); // 프로젝트 명.
		String path = uri.substring(context.length()); // /boardList.do;
		
		System.out.println(path);  //board.do
		Control sub = map.get(path);
		sub.exec(req, resp);
	}
	
	
}
