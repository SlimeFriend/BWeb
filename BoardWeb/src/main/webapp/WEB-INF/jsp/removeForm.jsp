<%@page import="com.yedam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	BoardVO board = (BoardVO) request.getAttribute("board");
	%>
 
<h3>삭제화면(removeForm.jsp)</h3>


   <form action="deleteBoard.do">
		<input type="hidden" name="bno" value="${board.boardNo}">
		<input type="hidden" name="page" value="${page}">
	    <table class="table" border="2">
	    	<tr>
	    		<th>글번호</th><td>${board.boardNo}</td>
	    		<th>조회수</th><td>${board.viewCnt}</td>
	    	</tr>
        <tr>
            <th>제목</th>
            <td colspan="3">${board.title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3">${board.content}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td colspan="3">${board.writer}</td>
        </tr>
        <tr>
            <td colspan="4" align="center">
            	<input class="btn btn-danger" type="submit" value="삭제">
            </td>
        </tr>
    </table>
  </form>
  