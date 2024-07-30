package com.yedam.stream;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class WriterEx1 {
	public static void main(String[] args) {
	
	
		
		// 기본스트림 - 보조스트림의 도움을 받아서 추가적 기능 수행
		List<MemberVO> members = new ArrayList<>();
		try {
			FileReader fr = new FileReader("c:/temp/file3.txt");
			BufferedReader br = new BufferedReader(fr);
			String str = "";
			String[] strAry = null;
			
			while(true ) {
				str = br.readLine(); // 한라인 읽기.   101 홍길동 90
				if(str == null) {
					break;
				}
				
				// 파일의 정보를 활용 -> 컬렉션 생성.
				strAry = str.split(" ");        // split은 나누는 것으로 보임.
				MemberVO member = new MemberVO();
				member.setMemberNo(Integer.parseInt(strAry[0]));
				member.setMemberName(strAry[1]);
				member.setPoint(Integer.parseInt(strAry[2]));
				members.add(member);
				System.out.println(str);
			}
			br.close();
			fr.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		members.forEach(System.out::println);
		
		System.out.println("완료!!");
	}
	
	
	
	
	
	
	static void reader1() {
		// Reader <- FileReader
		try {
			Reader reader = new FileReader("c:/temp/file2.dat");
			
			while(true) {
				int read = reader.read();
				if(read== -1)
					break;
				System.out.print((char)read); // byte     char(2byte)    short(2byte)     int(4byte)     long(8byte)
			}
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("완료!!");
	}
	
	
	
	static void writer1() {
		// 문자기반스트림 Writer <- FileWriter
		String str = "";
		Scanner scn = new Scanner(System.in);
		try {
			Writer writer = new FileWriter("c:/temp/file2.dat");
			while(true) {
				System.out.println("입력>> ");
				str = scn.nextLine();
				if(str.equals("quit")) 
					break;
				
				writer.write(str + "\n");
			}
			writer.flush();
			writer.close();
			scn.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("완료!");
	}
}
