package com.yedam.stream;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor                	//전체 필드값을 가지는 생성자 생성
@NoArgsConstructor					// 위에서 생성자를 생성했기에 기본생성자가 사라짐. 그래서 기본생성자를 생성하는 것을 추가한 것.
public class MemberVO implements Serializable{
	private int memberNo;
	private String memberName;
	private int point;
}
