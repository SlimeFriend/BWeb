package com.yedam.mapper;

import java.util.List;

import com.yedam.vo.BoardVO;

/*
 * 글목록, 등록, 수정, 삭제, 단건조회
 * 기능 정의 -> 기능 구현(BoardMapper.xml)
 */

public interface BoardMapper {
	List<BoardVO> selectList();
	int insertBoard(BoardVO board);
	int updateBoard(BoardVO board);
	int deleteBoard(int boardNo);
	BoardVO selectBoard(int boardNo);
	
}
