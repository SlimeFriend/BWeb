package com.yedam.service;

import java.util.List;

import com.yedam.common.SearchDTO;
import com.yedam.vo.BoardVO;

/*
 * MVC 패턴의 디자인에 따라서 Model영역 (service, dao:mapper).
 * 책: 4강 MVC기반 웹프로젝트 참고.
 * 숙제: 536p   MVC 자세히 읽고 오기.
 * service -> 주로 업무로직을 넣는다.
 */
public interface BoardService {
	List<BoardVO> boardList(SearchDTO search);
	int totalCount(SearchDTO search); // 페이징 계산용 건수.
	boolean addBoard(BoardVO board);
	boolean modifyBoard(BoardVO board);
	boolean removeBoard(int boardNo);
	BoardVO getBoard(int boardNo);
}
