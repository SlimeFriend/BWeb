package com.yedam.common;

import com.yedam.service.ReplyService;
import com.yedam.service.ReplyServiceImpl;
import com.yedam.vo.ReplyVO;

public class Apptest {
	public static void main(String[] args) {
		ReplyService svc = new ReplyServiceImpl();
		ReplyVO rvo = new ReplyVO();
		rvo.setReplyContent("등록연습");
		rvo.setReplyer("user03");
		rvo.setBoardNo(148);
		
		
		if (svc.removeReply(1)) {
			System.out.println("삭제완료!");
		}
	
		
		svc.replyList(148).forEach(System.out::println);
		
		System.out.println("- End -");
	}
}
