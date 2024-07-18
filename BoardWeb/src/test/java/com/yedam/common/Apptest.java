package com.yedam.common;

import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;

public class Apptest {
	public static void main(String[] args) {
		
		
		
		BoardService svc = new BoardServiceImpl();
		svc.boardList().forEach(System.out::println);
		System.out.println("-end-");
	}
}
