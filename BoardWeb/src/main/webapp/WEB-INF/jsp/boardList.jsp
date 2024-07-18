<%@page import="com.yedam.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
  <table class="table">
  	<thead>
  		<tr>
  			<th>글번호</th>
  			<th>제 목</th>
  			<th>작성자</th>
  			<th>작성일시</th>
  		</tr>
  	</thead>
  <%
  	String name = (String) request.getAttribute("myName");
  List<BoardVO> list = (List<BoardVO>) request.getAttribute("boardList");
  %>
  <tbody>
  <%for(BoardVO board : list) { %>
  	<tr>
  		<td><%=board.getBoardNo() %></td>
  		<td><%=board.getTitle() %></td>
  		<td><%=board.getWriter() %></td>
  		<td><%=board.getWriteDate() %></td>
  	</tr>
  	<%} %>

 <%@ include file="../includes/footer.jsp"%>
