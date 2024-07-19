<%@page import="com.yedam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%
	BoardVO board = (BoardVO) request.getAttribute("board");
	%>
   	<%@ include file="../includes/header.jsp" %>
 
<h3>수정화면(modifyForm.jsp)</h3>


   <form action="updateBoard.do">
		<input type="hidden" name="bno" value="<%=board.getBoardNo() %>">
		<input type="hidden" name="writer" value="<%=board.getWriter() %>">
		<input type="hidden" name="title" value="<%=board.getTitle() %>">
		<input type="hidden" name="content" value="<%=board.getContent() %>">
		
	    <table class="table" border="2">
	    	<tr>
	    		<th>글번호</th><td><%=board.getBoardNo() %></td>
	    		<th>조회수</th><td><%=board.getViewCnt() %></td>
	    	</tr>
        <tr>
            <th>제목</th>
            <td colspan="3">
            <textarea>
            <%=board.getTitle() %>
						</textarea></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3"><textarea><%=board.getContent() %></textarea></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td colspan="3"><%=board.getWriter() %></td>
        </tr>
        <tr>
            <td colspan="4" align="center">

            	<input class="btn btn-warning" type="submit" value="수정">
            </td>
        </tr>
    </table>
  </form>
  
  
     <%@ include file="../includes/footer.jsp" %>