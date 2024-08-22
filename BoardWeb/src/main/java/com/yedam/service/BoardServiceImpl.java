package com.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.common.SearchDTO;
import com.yedam.mapper.BoardMapper;
import com.yedam.vo.BoardVO;
import com.yedam.vo.ScheduleVO;

/*
 * 인터페이스(BoardService)를 구현하는 구현객체.
 * 인터페이스에 정의된 메소드를 다 구현해야함.
 */
public class BoardServiceImpl implements BoardService{
	SqlSession sqlSession = //
			DataSource.getInstance().openSession(true);
	BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
	

	@Override
	public int totalCount(SearchDTO search) {
		return mapper.selectTotalCount(search);
	}
	
	@Override
	public List<BoardVO> boardList(SearchDTO search) {
		return mapper.selectListPaging(search);
	}

	@Override
	public boolean addBoard(BoardVO board) {
		return mapper.insertBoard(board) == 1;
	}

	@Override
	public boolean modifyBoard(BoardVO board) {
		return mapper.updateBoard(board) == 1;
	}

	@Override
	public boolean removeBoard(int boardNo) {
		return mapper.deleteBoard(boardNo) == 1;
	}

	@Override
	public BoardVO getBoard(int boardNo) {
		return mapper.selectBoard(boardNo);
	}

	@Override
	public List<ScheduleVO> scheduleList() {
		// TODO Auto-generated method stub
		return mapper.scheduleList();
	}

	@Override
	public boolean addSchedule(ScheduleVO svo) {
		// TODO Auto-generated method stub
		return mapper.addSchedule(svo)==1;
	}

	@Override
	public boolean delSchedule(ScheduleVO svo) {
		// TODO Auto-generated method stub
		return mapper.delSchedule(svo)==1;
	}

}
