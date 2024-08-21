/**
 * boardJquery.js
 * jquery 용 ajax 사용
 */
console.log('jquery start');
let page = 1;
$.ajax({
	url: 'replyList.do', // 서버 url 호출
	data: {bno: bno, page: page }, // 서버에 전달할 parameter.
	dataType: 'json', // 서버로 전달받은 content 타입.
	success: function (result) {
		console.log(result);
		$.each(result, function(i, elem) {
			console.log(i, elem);
			let temp = $('#replyList li:eq(0)').clone();
			temp.attr('data-rno', elem.replyNo);
			$('#replyList').append(temp);
			temp.css('display', 'block'); // 속성(attribute) 변경.
			temp.find('span:eq(0)').html(elem.replyNo);
			temp.find('span').eq(1).html(elem.replyContent);
			temp.find('span').eq(2).html(elem.replyer);
			// 버튼생성을 새로...
			let btn = $('<button>삭제</button>').on('click', deleteRow);
			temp.find('span').eq(3).html(btn);
			$('#repluList').append(temp);
			
			
		})
	},
	error: function (err){
		console.error(err);
	}
}); // $.ajax

function deleteRow(){
	// 삭제 ajax
	let li = $(this).parent().parent();
	let rno = li.data('rno')
	$.ajax({
		url: 'removeReply.do',
		data: {rno: rno},
		dataType: 'json',
		success: function(result) {
			console.log(result);
			if(result.retCode == 'Success'){
				li.remove();
			}else{
				alert('처리중 예외 발생.');
			}
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	$(this).parent().parent().remove();
} // end of deleteRow.

