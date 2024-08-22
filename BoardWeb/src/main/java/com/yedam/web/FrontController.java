package com.yedam.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.control.ActionControl;
import com.yedam.control.AddBoardControl;
import com.yedam.control.AddReplyControl;
import com.yedam.control.AddSchdControl;
import com.yedam.control.AddStudent;
import com.yedam.control.Board;
import com.yedam.control.BoardForm;
import com.yedam.control.BoardListControl;
import com.yedam.control.CntByMember;
import com.yedam.control.DeleteBoard;
import com.yedam.control.DeleteSchdControl;
import com.yedam.control.FullCalendar;
import com.yedam.control.GoogleChart;
import com.yedam.control.ImageDownLoad;
import com.yedam.control.LoginControl;
import com.yedam.control.LoginForm;
import com.yedam.control.LogoutControl;
import com.yedam.control.MemberListControl;
import com.yedam.control.PagingCount;
import com.yedam.control.RemoveReplyControl;
import com.yedam.control.RemoveStudent;
import com.yedam.control.ReplyListControl;
import com.yedam.control.ScriptControl;
import com.yedam.control.StudentJson;
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
		map = new HashMap<String, Control>();
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
		// 수정 화면
		map.put("/modifyBoard.do", new mdBoardControl());
		// 수정 기능
		map.put("/updateBoard.do", new UpdateBoard());
		map.put("/action.do", new ActionControl());
		// 로그인
		map.put("/loginForm.do", new LoginForm());  // 로그인 화면
		map.put("/login.do", new LoginControl());  // 로그인 기능.
		map.put("/logout.do", new LogoutControl()); // 로그아웃 기능.
		
		// 관리자가 사용하는 기능들 ex) 회원목록.
		map.put("/memberList.do", new MemberListControl());
		
		// 자바스크립트 연습 페이지
		map.put("/javascript.do", new ScriptControl());
		
		// 학생정보 반환해주는 페이지(json).
		map.put("/studentJson.do", new StudentJson());
		
		// 학생정보(학번기준) 삭제
		map.put("/removeStudent.do", new RemoveStudent());
		
		// 등록
		map.put("/addStudent.do", new AddStudent());
		
		// 댓글목록
		map.put("/replyList.do", new ReplyListControl());
		// 댓글등록
		map.put("/addReply.do", new AddReplyControl());
		// 댓글삭제
		map.put("/removeReply.do", new RemoveReplyControl());
		
		// 페이징을 위한 전체건수
		map.put("/pagingCount.do", new PagingCount());
		
		// 이미지 다운로드
		map.put("/imageDownload.do", new ImageDownLoad());
		
		// 작성자별 게시건수.
		map.put("/countByMember.do", new CntByMember());
		
		//차트페이지 
		map.put("/googleChart.do", new GoogleChart());
		
		// fullcalendar 연습
		map.put("/fullcalendar.do", new FullCalendar());
		
		// 달력으로 스케줄 추가
		map.put("/addschd.do", new AddSchdControl());
		
		// 달력 스케 삭
		map.put("/deleteschd.do", new DeleteSchdControl());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// boardList.do -목록. addBoard.do -등록.
		String uri = req.getRequestURI(); 
		// URL(http://localhosst/BoardWeb/boardList.do) vs URI(/BoardWeb/boardList.do)
		String context = req.getContextPath(); // 프로젝트 명.
		String path = uri.substring(context.length()); // /boardList.do;
		
		

		Control sub = map.get(path);
		try {
		sub.exec(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
