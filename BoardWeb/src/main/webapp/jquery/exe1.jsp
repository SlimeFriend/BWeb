<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	입력:<input id="userVal"> <!-- val() -->
	<button id="addBtn">추가</button>
	<button id="oddBtn">4부터</button>
	<button id="evenBtn">3까지</button>
	
	<div id="show">
		<ul id="list">
			<li>사과 <button class='delBtn'>삭제</button></li>
			<li>사과 <button class='delBtn'>삭제</button></li>
			<li>사과 <button class='delBtn'>삭제</button><span></span></li>
			<li>사과 <button class='delBtn'>삭제</button></li>
			<li>사과 <button class='delBtn'>삭제</button></li>
			<li>영역 <button class='delBtn'>삭제</button></li>
		</ul>
	</div>
</body>

<script>
	$('#addBtn').on('click', function(){
		let btn = $('<button>삭제</button>').on('click', function() {
			console.log(this);
			$(this).parent().hide(100);
		});
		let a = $('<li></li>').html($('#userVal').val() + " ").append(btn);
		$('#list').append(a);

	})	
	
	// 홀수.
	$('#oddBtn').on('click', function(){
		$('#list li:gt(2)').css('background', 'gold');
	})
	
	// 짝수.
		$('#evenBtn').on('click', function(){
		$('#list li:not(:has(span))').css('background', 'black');
	})
	
	
</script>

</html>