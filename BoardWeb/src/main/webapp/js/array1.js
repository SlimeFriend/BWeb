/**
 * array1.js
 */


// 1. 요소를 생성할 때는 document.createElement('요소명');
// 2. 부모 - 자식 관계 지어줄 떄...  부모.appendChilde(자식);
// 3. <span>값</span> span.innerHTML = 값;
// 4. document.querySelector('선택자');
// 5. document.querySelectorAll('선택자');


const friends = [
	{name: "홍길동", address: "대구 100번지", height:170},
	{name: "김민규", address: "대전 200번지", height:175},
	{name: "이성윤", address: "인천 300번지", height:180}
]


makeList();
function makeList() {
	// 
	friends.forEach(function(friend){
		let tr = makeTr(friend);
		document.getElementById('list').appendChild(tr);
	//tr만드는 부분.
	});
}

// 등록 버튼에 클릭이벤트 추가


document.getElementById('addBtn').addEventListener('click', function(e) {
	let name = document.getElementById('fname').value;
	let address = document.getElementById('faddress').value;
	let height = document.getElementById('height').value;
	let friend = {name, address, height};
	
	if(!name || !address || !height){
		alert("값을 입력하세요.");
		return;
	}
	
	console.log(name);
	
	let tr = makeTr(friend);
	//tr만드는 부분.
	list.appendChild(tr);
	
	alert('OK');
	
 fname.value = '';
 faddress.value = '';
 height.value = '';
});


// friend => tr 생성.
function makeTr(friend = {name:'Hong', address: 'Seoul', height: 170}) {
	
	function detailCallback(e) {
		document.getElementById('fname').value = tr.children[0].innerHTML;
		document.getElementById('faddress').value = tr.children[1].innerHTML;
		document.getElementById('height').value = tr.children[2].innerHTML;
		
	}// end of detailCallback.
	
	
	//tr 만들기
	let tr = document.createElement('tr');
	tr.addEventListener('click', detailCallback);
//	tr.addEventListener('mouseover', detailCallback);
	
	
	for (let prop in friend){
			let td = document.createElement('td');
			td.innerHTML = friend[prop];
			tr.appendChild(td);
	}
	// 삭제버튼
	let td= document.createElement('td');
	let btn = document.createElement('button');
	btn.setAttribute('class', 'btn btn-danger');  // <button class= "btn btn-danger">삭제</button>
	btn.addEventListener('click', function(e){
		console.log(e);
		e.target.parentElement.parentElement.remove();
	})
	btn.innerHTML = '삭제';
	td.appendChild(btn);
	tr.appendChild(td);

// 누르면 위로 정보 올리기
	
	//체크박스 
	td = document.createElement('td');
	let check = document.createElement('input');
	check.setAttribute('type', 'checkbox');
	
	td.appendChild(check);
	tr.appendChild(td);
	
	
	
	
	
	
	document.getElementById('modBtn').addEventListener('click',modi);
	
	function modi(){
		if(tr.children[0].innerHTML==fname.value){
		tr.children[1].innerHTML=faddress.value;
		tr.children[2].innerHTML=height.value;
		}
	}
	

	return tr;
	
	
}

document.getElementById('acheck').addEventListener('click',function(e){
	let tr = document.createElement('tr');
	
	tr.children[4] = true;
})
