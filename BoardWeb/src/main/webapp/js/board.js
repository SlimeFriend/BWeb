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
			// replyList.appendChild(makeRow(result.retVal));
			page = 1;
			showPage();
		} else {
			alert('실패');
		}
	});
});




// 댓글 목록 출력.
showPage();
function showPage() {
	// 기존목록제거
	replyList.querySelectorAll('li').forEach((li, idx) => {
		if (idx != 0) {
			li.remove();
		}
	})
	svc.replyList({ bno, page }, function() {
		let result = JSON.parse(this.responseText);
		result.forEach(reply => {
			replyList.appendChild(makeRow(reply));
		});

		// 실제 데이터... 출력.
		svc.pagingCount(bno, createPageList);
	});
}



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
			//document.querySelector('li[data-rno="' + rno + '"]').remove();
			showPage();
			
		} else {
			alert('삭제실패!!');
		}
	})
}



// 페이지 a태그 생성.
function createPageList(e) {
	let result = JSON.parse(this.responseText);
	let totalCnt = result.totalCount;
	let startPage, endPage; // 현재페이지를 기준으로 계산한 첫 페이지 번호 ~ 마지막 페이지 번호.
	let next, prev; // 이전, 이후 체크하는 변수.
	let realEnd = Math.ceil(totalCnt / 5);

	endPage = Math.ceil(page / 10) * 10;
	startPage = endPage - 9;
	endPage = endPage > realEnd ? realEnd : endPage;

	prev = startPage > 1;
	next = endPage < realEnd ? true : false;

	// 기존 html 지우기
	document.querySelector('ul.pagination').innerHTML = '';
	// 이전 10페이지 여부.
	let li = document.createElement('li');
	li.className = 'page-item';
	if (prev) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', startPage - 1);
		aTag.className = 'page-link';
		aTag.href = '#';
		aTag.innerHTML = 'Previous';
		li.appendChild(aTag);
	} else {
		li.classList.add('disabled');  // li요소의 클래스추가.
		let span = document.createElement('span');
		span.className = 'page-link';
		span.href = '#';
		span.innerHTML = 'Previous';
		li.appendChild(span);
	}
	document.querySelector('ul.pagination').appendChild(li);


	// 10개 출력.   <li class="page-item"><a class="page-link" href="#">1</a></li>
	for (let p = startPage; p <= endPage; p++) {
		let li = document.createElement('li');
		li.className = 'page-item';

		if (page == p) {
			li.classList.add('active');
			let span = document.createElement('span');
			span.className = 'page-link';
			span.innerHTML = p;
			li.appendChild(span);
		} else {

			let aTag = document.createElement('a');
			aTag.setAttribute('data-page', p);
			aTag.className = 'page-link';
			aTag.href = '#';
			aTag.innerHTML = p;
			li.appendChild(aTag);
		}
		document.querySelector('ul.pagination').appendChild(li);

	}// end of for.

	// 이후 10페이지 여부.
	li = document.createElement('li');
	li.className = 'page-item';
	if (next) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', endPage + 1);
		aTag.className = 'page-link';
		aTag.href = '#';
		aTag.innerHTML = 'Next';
		li.appendChild(aTag);
	} else {
		let span = document.createElement('span');
		li.classList.add('disabled');
		span.className = 'page-link';
		span.innerHTML = 'Next';
		li.appendChild(span);
	}
	document.querySelector('ul.pagination').appendChild(li);

	// a태그의 이벤트 등록.
	pageMove();
} // end of createPageList.




// paging 영역의 a 태그 클릭 시 ..
function pageMove() {
	document.querySelectorAll('div.reply ul.pagination a')//
		.forEach(item => {
			item.addEventListener('click', function(e) {
				page = item.dataset.page;
				// service에서 목록을 출력하는 메소드 호출
				svc.replyList({ bno, page }, function() {
					//기존목록들 삭제
					replyList.querySelectorAll('li').forEach((li, idx) => {
						if (idx != 0) {
							li.remove();
						}
					})
					let result = JSON.parse(this.responseText);
					result.forEach(reply => {
						replyList.appendChild(makeRow(reply));
					});
					// 페이지 새로 출력
					svc.pagingCount(bno, createPageList);
				});
			})
		});
	//페이지 새로 출력
} // pageMove
