package com.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.StudentMapper;
import com.yedam.vo.MemberVO;

public class MemberServiceImpl implements MemberService{
	
	SqlSession sqlSession = //
			DataSource.getInstance().openSession(true);
	StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);

	@Override
	public MemberVO loginCheck(String id, String pw) {
		return mapper.selectMember(id, pw);
	}

	@Override
	public List<MemberVO> viewUser() {
		
		return mapper.viewUser();
	}

	@Override
	public List<MemberVO> orderby(String order) {
		
		return mapper.orderby(order);
	}

	@Override
	public List<MemberVO> res(String res) {
		return mapper.res(res);
	}


	

}