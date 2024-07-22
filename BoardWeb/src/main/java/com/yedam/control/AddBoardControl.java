package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;
import com.yedam.vo.BoardVO;

public class AddBoardControl implements Control{

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// key=value 처리위한 application/x-www-form-urlencode 방식
		String writer = req.getParameter("writer");
		String content = req.getParameter("content");
		String title = req.getParameter("title");
		//파일전송 multipart/form-data 방식. cos라이브러리.
		// 1. 파일업로드 (images) 2.DB입력
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 1024 * 1024 * 5;
		MultipartRequest request = new MultipartRequest(req // 1.요청정보
				, savePath // 2. 업로드 경로
				, maxSize  // 3. 업로드 파일 최대크기지정.
				, "utf-8"  // 4. 파일명 해석 인코딩 방식 지정.
				, new DefaultFileRenamePolicy() // 5. 리네임 정책
		);
		
		writer = request.getParameter("writer");
		content = request.getParameter("content");
		title= request.getParameter("title");
		String image= request.getFilesystemName("image");
		
		BoardVO bv = new BoardVO();
		bv.setWriter(writer);
		bv.setContent(content);
		bv.setTitle(title);
		bv.setImage(image);
		
		BoardService svc = new BoardServiceImpl();
		if(svc.addBoard(bv)) {
			//목록 이동.
			resp.sendRedirect("boardList.do");
		
		}	


	}

}
