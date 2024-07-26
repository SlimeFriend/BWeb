/**
 *  board.js
 */

let page = 1; // 아래쪽에서 댓글의 페이지를 지정.

// 댓글등록 버튼에 클릭 이벤트 등록.
document.querySelector('#addReply').addEventListener('click', function(e) {

	let content = document.querySelector('#content').value;
	if (!replyer || !content) {
		alert('필수입력항목을 확인하세요!')
		return;
	}
	let parm = { bno, replyer, content };

	svc.addReply(parm, function(e) {
		let result = JSON.parse(this.responseText);

		if (result.retCode == 'Success') {
			alert('성공');
			replyList.appendChild(makeRow(result.retVal));
		} else {
			alert('실패');
		}
	});
});




// 댓글 목록 출력.
svc.replyList({ bno, page }, function() {
	let result = JSON.parse(this.responseText);
	result.forEach(reply => {
		replyList.appendChild(makeRow(reply));
	});
});





// reply => row 생성. 
function makeRow(reply = {}) {
	let cloned = document.querySelector('div.reply>div.content li').cloneNode(true);
	cloned.setAttribute('data-rno', reply.replyNo);
	cloned.style.display = 'block'; // <li style={} ></li>
	cloned.querySelector('span:nth-of-type(1)').innerText = reply.replyNo;
	cloned.querySelector('span:nth-of-type(2)').innerText = reply.replyContent;
	cloned.querySelector('span:nth-of-type(3)').innerText = reply.replyer;
	cloned.querySelector('button').addEventListener('click', deleteReplyFnc);
	return cloned;
}

// 댓글 삭제 이벤트 핸들러
function deleteReplyFnc(e) {
	let rno = e.target.parentElement.parentElement.dataset.rno;
	svc.removeReply(rno, function(e) {
		let result = JSON.parse(this.response);
		if (result.retCode == 'Success') {
			document.querySelector('li[data-rno="' + rno + '"]')
		} else {
			alert('삭제실패!!');
		}
	})
}


// paging 영역의 a 태그 클릭 시 ..
document.querySelectorAll('div.reply ul.pagination a')//
	.forEach(item => {
		item.addEventListener('click', function(e) {
			page = item.innerHTML;
			svc.replyList({ bno, page }, function() {
				//기존목록들 삭제
				replyList.querySelectorAll('li').forEach((li,idx) => {
					if(idx != 0) {
						li.remove();
					}
				})
				let result = JSON.parse(this.responseText);
				result.forEach(reply => {
					replyList.appendChild(makeRow(reply));
				});
			});
		})
});
