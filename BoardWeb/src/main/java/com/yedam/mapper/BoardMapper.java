package com.yedam.mapper;

import java.util.List;

import com.yedam.common.SearchDTO;
import com.yedam.vo.BoardVO;

/*
 * 글목록, 등록, 수정, 삭제, 단건조회
 * 기능 정의 -> 기능 구현(BoardMapper.xml)
 */

public interface BoardMapper {
//	List<BoardVO> selectList();
	List<BoardVO> selectListPaging(SearchDTO search); // 페이지정보 -> 5건씩 출력.
	
	// 페이징 계산하기 위한 전체 건수
	int selectTotalCount(SearchDTO searchdto);
	
	BoardVO selectBoard(int boardNo);
	
	int insertBoard(BoardVO board);
	
	int updateBoard(BoardVO board);
	
	int deleteBoard(int boardNo);
	
	
}
