<%@page import="com.yedam.common.SearchDTO"%>
<%@page import="com.yedam.common.PageDTO"%>
<%@page import="com.yedam.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <table class="table">
 <!-- 검색기능 -->
 <div class="center">
 		<form action="boardList.do">
			<div class="row">
				<div class="col-sm-4"> <!-- select 목록. -->
					<select name="searchCondition" class="form-control">
						<option value="">선택하세요.</option>
						<option value="T" ${searchCondition == 'T' ? 'selected' : '' }>제목</option>
						<option value="W" ${searchCondition eq 'W' ? 'selected' : '' }>작성자</option>
						<option value="TW" ${searchCondition eq 'TW' ? 'selected' : '' }>제목 & 작성자</option>
					</select>
				</div> 	
				
				<div class="col-sm-6">
					<input type="text" name="keyword" value="${search.keyword }" class="form-control">
				</div>
				<div class="col=sm=2">
					<input type="submit" value="조회" class="btn btn-primary">
				</div>
			</div>
 		</form>
 </div>
 <!-- 검색기능 -->
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
    PageDTO paging = (PageDTO) request.getAttribute("paging");
    SearchDTO search = (SearchDTO) request.getAttribute("search");
    String sc = (String) request.getAttribute("searchCondition");
    String kw = (String) request.getAttribute("keyword");
  %>
  <tbody>
  <c:forEach var="board" items="${boardList }">
  	<tr>
  		<td>${board.boardNo }</td>
  		<td><a href = "board.do?page=${paging.page }&bno=${board.boardNo }">${board.title }</a></td>
  		<td>${board.writer }</td>
  		<td>${board.writeDate }</td>
  	</tr>
  </c:forEach>
 </tbody>
 </table>
 <p>${paging }</p>
 <!--  페이지부분 -->
 <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
 
 <!-- prev 페이지 -->
    <c:if test="${paging.prev }">
    <li class="page-item">
      <a class="page-link" href="boardList.do?searchCondition=${searchCondition } &keyword=${keyword }&page=${paging.startPage-1}" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    </c:if>
   
    
 <!-- 페이지 개수만큼 링크생성 -->   
    
    <c:forEach var="p" begin="${paging.startPage }" end="${paging.endPage }">
    	<c:choose>
    		<c:when test="${paging.page == p }">
				    <li class="page-item active" aria-current="page">
				      <span class="page-link">${p }</span>
				    </li>
    		</c:when>
    		<c:otherwise>
    			<li class="page-item"><a class="page-link" href="boardList.do?searchCondition=${searchCondition }&keyword=${keyword }&page=${p }">${p }</a></li>
    		</c:otherwise>
    	</c:choose>
    </c:forEach>

    
    
    
    
    <!-- Next페이지 -->
    <c:if test="${paging.next }">
    <li class="page-item">
      <a class="page-link" href="boardList.do?page=${paging.endPage+1 }&searchCondition=${searchCondition }&keyword=${keyword }" tabindex="-1" aria-disabled="true">Next</a>
    </li>
    </c:if>
   
  </ul>
</nav>
 
 
 <jsp:include page="../includes/footer.jsp"></jsp:include>
