package com.yedam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yedam.vo.MemberVO;
import com.yedam.vo.StudentVO;

public interface StudentMapper {
	List<StudentVO> studentList();
	StudentVO selectOne(String sno);
	int insertStudent(StudentVO svo);
	
	// 로그인 체크
	MemberVO selectMember(@Param("id") String id, @Param("pw") String pw);
	
	
	List<MemberVO> viewUser();
	
	List<MemberVO> res(@Param("res") String res);
	
	List<MemberVO> orderby(@Param("order") String order);
	
	public int deleteStudent(String sno);
	
	// 차트 (작성자별 건수)
	List<Map<String, Object>> selectCountByMember();
	
	// 회원탈퇴
	String deleteMemberProc(Map<String, String> map);
}
