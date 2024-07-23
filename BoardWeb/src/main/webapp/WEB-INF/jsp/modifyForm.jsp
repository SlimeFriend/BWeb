<%@page import="com.yedam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%
	BoardVO board = (BoardVO) request.getAttribute("board");
	%>

 
<h3>수정화면(modifyForm.jsp)</h3>


   <form action="updateBoard.do">
		<input type="hidden" name="bno" value="<%=board.getBoardNo()%>">
		
	    <table class="table" border="2">
	    	<tr>
	    		<th>글번호</th><td><%=board.getBoardNo()%></td>
	    		<th>조회수</th><td><%=board.getViewCnt()%></td>
	    	</tr>
        <tr>
            <th>제목</th>
            <td colspan="3">
            <textarea name="title">
            <%=board.getTitle()%>
						</textarea></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3"><textarea name="content"><%=board.getContent()%></textarea></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td name="writer" colspan="3"><%=board.getWriter()%></td>
        </tr>
        <tr>
            <td colspan="4" align="center">

            	<input class="btn btn-warning" type="submit" value="수정">
            </td>
        </tr>
    </table>
  </form>
  
  