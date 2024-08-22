<%@page import="com.yedam.common.SearchDTO"%>
<%@page import="com.yedam.common.PageDTO"%>
<%@page import="com.yedam.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel = stylesheet href="https://cdn.datatables.net/2.1.4/css/dataTables.dataTables.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/2.1.4/js/dataTables.js"></script>

<table class="table" id="blist">
	<thead>
		<tr>
			<th>글번호</th>
			<th>제 목</th>
			<th>작성자</th>
			<th>작성일시</th>
		</tr>
		<c:forEach var="board" items="${boardList }">
			<tr>
				<td>${board.boardNo }</td>
				<td><a
					href="board.do?page=${paging.page }&bno=${board.boardNo }">${board.title }</a></td>
				<td>${board.writer }</td>
				<td>${board.writeDate }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>
	$('#blist').DataTable();
</script>
	


