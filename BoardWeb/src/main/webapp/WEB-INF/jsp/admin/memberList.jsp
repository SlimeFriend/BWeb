<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>회원목록</h3>
<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			<th>이름</th>
			<th><a href="memberList.do/orderbyId">아이디</a></th>
			<th>비밀번호</th>
			<th>등급</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="member" items="${members }" varStatus="stat">
			<tr>
				<th scope="row">${stat.count }</th>
				<td>${member.memberNm }</td>
				<td>${member.memberId }</td>
				<td>${member.memberPw }</td>
				<td>${member.responsibility }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

