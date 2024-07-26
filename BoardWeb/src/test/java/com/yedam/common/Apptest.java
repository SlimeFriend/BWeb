package com.yedam.common;

import com.yedam.service.ReplyService;
import com.yedam.service.ReplyServiceImpl;
import com.yedam.vo.ReplyVO;

public class Apptest {
	public static void main(String[] args) {
		ReplyService svc = new ReplyServiceImpl();
		
		
		SearchDTO search = new SearchDTO();
		search.setBno(148);
		search.setPage(1);
		
		svc.replyList(search).forEach(System.out::println);
		
		System.out.println("-end-");
	}
}
