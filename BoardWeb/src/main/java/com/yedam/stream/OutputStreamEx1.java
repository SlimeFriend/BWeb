package com.yedam.stream;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class OutputStreamEx1 {
	public static void main(String[] args) {
		// 읽고 쓰기 (복사)
		try {
			InputStream is = new FileInputStream("c:/temp/origin.jpg");
			OutputStream os = new FileOutputStream("c:/temp/copy2.jpg");
			int read = -1;
			byte[] buf = new byte[100];
			while(true) {
				read = is.read(buf); // 1바이트씩 읽기.
				if(read == -1) {
					break; //더 이상 읽기 정보가 없으면 종료.
				}
				os.write(buf);
			}
			os.flush();
			os.close();
			is.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("완료!!");
		
	}
	
	
	
	
	
	static void write1() {
		// 출력스트림 상위 OutputStream <- FileOutputStream(자식클래스)
		try {
			OutputStream os = new FileOutputStream("c:/temp/file1.dat");
			// 10, 20, 30숫자를 file1.dat에 쓰기.
			os.write(10);
			os.write(20);
			os.write(30);
			os.flush(); // 버퍼 비우기
			os.close(); // 리소스 환원.
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("완료!");		
	}
	
	static void read1() {
		//입력스트림 상위 InputStream <- FileInputStream
				try {
					InputStream is = new FileInputStream("c:/temp/file1.dat");
					while(true) {				
						int r = is.read(); // 1바이트씩 읽기 : 읽은 바이트를 반환/ 끝부분에서 -1 반환.
						if(r == -1) {
							break;
						}
						System.out.println(r);
					}
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}

}


