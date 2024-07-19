<%@page import="com.yedam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%
	BoardVO board = (BoardVO) request.getAttribute("board");
	%>
   	<%@ include file="../includes/header.jsp" %>
 
<h3>삭제화면(removeForm.jsp)</h3>


   <form action="DeleteBoard.do">
		<input type="hidden" name="bno" value="<%=board.getBoardNo() %>">
	    <table class="table" border="2">
	    	<tr>
	    		<th>글번호</th><td><%=board.getBoardNo() %></td>
	    		<th>조회수</th><td><%=board.getViewCnt() %></td>
	    	</tr>
        <tr>
            <th>제목</th>
            <td colspan="3"><%=board.getTitle() %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3"><%=board.getContent() %></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td colspan="3"><%=board.getWriter() %></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
            	<input class="btn btn-danger" type="submit" value="삭제">
            </td>
        </tr>
    </table>
  </form>
  
  
     <%@ include file="../includes/footer.jsp" %>