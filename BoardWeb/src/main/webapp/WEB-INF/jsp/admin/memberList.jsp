<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>회원목록</h3>
<table class="table table-hover">
	<thead>
		<tr>
		<ul class="nav nav-pills">
  		<li class="nav-item">
   			 <a class="nav-link active" aria-current="page" href="memberList.do?res=user">사용자</a>
  		</li>
 			<li class="nav-item">
   			<a class="nav-link" href="memberList.do?res=admin">관리자</a>
 			</li>
		</ul>
		
			<th>#</th>
			<th><a href="memberList.do?orderbymember_nm">이름</a></th>
			<th><a href="memberList.do?orderbymember_id">아이디</a></th>
			<th>비밀번호</th>
			<th>등급</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="member" items="${members}" varStatus="stat">
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

