package com.yedam.common;

import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;

public class Apptest {
	public static void main(String[] args) {
		
		
		
		BoardService svc = new BoardServiceImpl();
		SearchDTO search = new SearchDTO();
		search.setSearchCondition("T");
		search.setKeyword("java");
		search.setPage(1);
		
		svc.boardList(search).forEach(System.out::println);
		System.out.println("-end-");
	}
}
