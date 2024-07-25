package com.yedam.service;

import java.util.List;

import com.yedam.vo.MemberVO;
import com.yedam.vo.StudentVO;

public interface MemberService {
	
	MemberVO loginCheck(String id, String pw);
	
	List<MemberVO> viewUser();
	
	List<MemberVO> orderby(String order);
	
	List<MemberVO> res(String res);
	
	//학생목록조회
	List<StudentVO> studentList();

	boolean removeStudent(String sno);
	boolean addStudent(StudentVO svo);
}
