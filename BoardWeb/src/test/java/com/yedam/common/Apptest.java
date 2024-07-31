package com.yedam.common;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.yedam.service.MemberService;
import com.yedam.service.MemberServiceImpl;

public class Apptest {
	public static void main(String[] args) {
		MemberService svc = new MemberServiceImpl();
		List<Map<String, Object>> list = svc.getCountByMember();
		
		for(Map<String,Object> map : list) {
			System.out.println("-----------------");
			Set<String> keyset = map.keySet(); // 맵에서 키값만 가져오는 메소드
			for(String key : keyset) {
				System.out.println(key + ", " + map.get(key));
			}
		}
		
		System.out.println("-end-");
	}
}
