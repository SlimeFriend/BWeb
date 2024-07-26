package com.yedam.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.ReplyService;
import com.yedam.service.ReplyServiceImpl;
import com.yedam.vo.ReplyVO;

public class AddReplyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReplyService svc = new ReplyServiceImpl();
		String writer = req.getParameter("replyer");
		String content = req.getParameter("content");
		String bno = req.getParameter("bno");
		
		ReplyVO rvo = new ReplyVO();
		rvo.setReplyer(writer);
		rvo.setReplyContent(content);
		rvo.setBoardNo(Integer.parseInt(bno));
		
		// retCode: Success, retVal: ReplyVO
		// retCode: Fail, retVal: null
		
		Map<String, Object> map = new HashMap<>();
		
		try {
			if (svc.addReply(rvo)) {
				map.put("retCode", "Success");
				map.put("retVal", rvo);
			} 
		} catch (Exception e) {
			map.put("retCode", "Fail");
			map.put("retVal", null);			
		}
		
		//json 문자열 생성.
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		resp.setContentType("text/json;charset=utf-8");
		resp.getWriter().print(json);

	}

}
