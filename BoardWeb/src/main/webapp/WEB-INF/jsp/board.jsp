<%@page import="com.yedam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.1.4/css/dataTables.dataTables.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/2.1.4/js/dataTables.js"></script>

<h3>게시판 상세(board.jsp)</h3>

<form action="removeBoard.do">
	<input type="hidden" name="bno" value="${board.boardNo }"> <input
		type="hidden" name="page" value="${page }">
	<table class="table">
		<tr>
			<th class="col-sm-3">글번호</th>
			<td class="col-sm-3">${board.boardNo }</td>
			<th class="col-sm-3">조회수</th>
			<td class="col-sm-3">${board.viewCnt }></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${board.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">${board.content }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3">${board.writer }</td>
		</tr>
		<tr>
			<th>파일</th>
			<td colspan="3"><c:choose>
					<c:when test="${empty board.image}">
						이미지없음
					</c:when>
					<c:otherwise>
						<img width="250px" src="images/${board.image }">
					</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><c:choose>
					<c:when test="${logid == board.writer }">
						<input class="btn btn-danger" type="submit" value="삭제화면">
						<button class="btn btn-warning" type="button">수정화면</button>
					</c:when>
					<c:otherwise>
						<input class="btn btn-danger" type="submit" value="삭제화면">
						<button class="btn btn-warning" type="button">수정화면</button>

					</c:otherwise>
				</c:choose></td>
		</tr>

	</table>
</form>
<!-- 댓글관련 -->
<div class="container reply">
	<!-- 등록 -->
	<div class="header">
		<span>댓글 내용</span> <input class="col-sm-6" id="content">
		<button class="col-sm-3" id="addReply">댓글등록</button>
		<button class="col-sm-3" id="deleteReply">댓글삭제</button>
	</div>
	<!-- 목록 -->
	<table id="example" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>댓글번호</th>
				<th>댓글내용</th>
				<th>작성자</th>
				<th>작성일시</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>댓글번호</th>
				<th>댓글내용</th>
				<th>작성자</th>
				<th>작성일시</th>
			</tr>
		</tfoot>
	</table>
</div>

<script>
	const bno = "${board.boardNo }";
	const replyer = "${logid}";
	document.querySelector('form>table button.btn.btn-warning')
			.addEventListener('click', function(e) {
				location.href = 'modifyBoard.do?bno=${board.boardNo }';
			});

	let table = $('#example').DataTable({
		ajax : 'replyList.do?bno=' + bno,
		columns : [ {
			data : 'replyNo'
		}, {
			data : 'replyContent'
		}, {
			data : 'replyer'
		}, {
			data : 'replyDate'
		} ],
		lengthMenu : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, 'All' ] ]
	});

	//댓글등록 이벤트.
    $('#addReply').on('click', function() {
        console.log(bno, replyer, content);
        $.ajax({

            url : 'addReply.do',
            data : { bno : bno, replyer: replyer, content: $(content).val()},
            dataType : 'json',
            success : function(result) {
                if(result.retCode == 'Success'){
                    let rvo = result.retVal;
                    table.row.add({
                        'replyNo' : rvo.replyNo ,
                        'replyContent' : rvo.replyContent,
                        'replyer' : rvo.replyer,
                        'replyDate' : rvo.replyDate
                    })
                    .draw(false);

                    $('#content').val(''); // 입력값 초기화
                }
            },
            error : function(err) {
                console.error(err);
            }
        })
    });

	//댓글삭제 이벤트
		

	$('#example tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});

	$('#deleteReply').click(function() {
		 $.ajax({

	            url : 'removeReply.do',
	            data : { rno : result.retVal.replyNo},
	            dataType : 'json',
	            success : function(result) {
	                if(result.retCode == 'Success'){
	                    let rvo = result.retVal;
	                    table.row.del({
	                        'replyNo' : rvo.replyNo ,
	                       
	                    })
	                    .draw(false);
	                }
	            },
	            error : function(err) {
	                console.error(err);
	            }
	        })
	    });

</script>
