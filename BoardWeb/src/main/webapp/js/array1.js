/**
 * array1.js
 */


// 1. 요소를 생성할 때는 document.createElement('요소명');
// 2. 부모 - 자식 관계 지어줄 떄...  부모.appendChilde(자식);
// 3. <span>값</span> span.innerHTML = 값;
// 4. document.querySelector('선택자');
// 5. document.querySelectorAll('선택자');


const friends = [
	{ name: "홍길동", address: "대구 100번지", height: 170 },
	{ name: "김민규", address: "대전 200번지", height: 175 },
	{ name: "이성윤", address: "인천 300번지", height: 180 }
]


makeList();
function makeList() {
	// 
	friends.forEach(function(friend) {
		let tr = makeTr(friend);
		document.getElementById('list').appendChild(tr);
		//tr만드는 부분.
	});
}

// 등록 버튼에 클릭이벤트 추가
document.getElementById('addBtn').addEventListener('click', addBtnFnc);

// addBtnFnc 이벤트 핸들러.
function addBtnFnc(e) {
	let name = document.getElementById('fname').value;
	let address = document.getElementById('faddress').value;
	let height = document.getElementById('height').value;
	let friend = { name, address, height };

	if (!name || !address || !height) {
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
}

function detailCallback(e) {
	console.log(e.target.parentElement);
	let tr = e.target.parentElement; // 이벤트를 대상으로 tr영역을 찾아야함
	// this: 1) 함수영역에서 사용시 window     2) 이벤트 대상        3) 객체에서는 객체.
	tr = this;
	document.getElementById('fname').value = tr.children[0].innerHTML;
	document.getElementById('faddress').value = tr.children[1].innerHTML;
	document.getElementById('height').value = tr.children[2].innerHTML;

}// end of detailCallback.


// friend => tr 생성.
function makeTr(friend = { name: 'Hong', address: 'Seoul', height: 170 }) {

	//tr 만들기
	let tr = document.createElement('tr');
	tr.addEventListener('click', detailCallback);
	//	tr.addEventListener('mouseover', detailCallback);


	for (let prop in friend) {
		let td = document.createElement('td');
		td.innerHTML = friend[prop];
		tr.appendChild(td);
	}
	// 삭제버튼
	let td = document.createElement('td');
	let btn = document.createElement('button');
	btn.setAttribute('class', 'btn btn-danger');  // <button class= "btn btn-danger">삭제</button>
	btn.addEventListener('click', function(e) {
		console.log(e);
		e.stopPropagation(); // click : button > td > tr > table ....
		e.target.parentElement.parentElement.remove();
	}, false);       //addeventLister('click'등 이벤트, function 이벤트핸들러, true false 로 캡쳐링 버블링 지정 디폴트 버블링false)
	btn.innerHTML = '삭제';
	td.appendChild(btn);
	tr.appendChild(td);

	// 누르면 위로 정보 올리기

	//체크박스 
	td = document.createElement('td');
	let check = document.createElement('input');
	check.setAttribute('type', 'checkbox');
	check.addEventListener('change', checking);
	td.appendChild(check);
	tr.appendChild(td);
	
	
	
	return tr;
}

// 수정 버튼에 클릭 이벤트.
document.getElementById('modBtn').addEventListener('click', modi);

function modi(e) {
	let tr = document.querySelector('tr');
	if (tr.children[0].innerHTML == fname.value) {
		tr.children[1].innerHTML = faddress.value;
		tr.children[2].innerHTML = height.value;
	}
}

// thead에 있는 체크박스 이벤트 등록.
document.querySelector('div.container-fluid>table>thead input[type="checkbox"]')//
	.addEventListener('change', changeFnc);

function changeFnc(e) {
	// 찾으려고 하는 대상 체크박스.
	document.querySelectorAll('div.container-fluid>table>tbody input[type="checkbox"]')//
		.forEach(function(item) {
			console.log(item);
			item.checked = e.target.checked;

		})
} // end of changeFnc(e);


document.getElementById('delBtn').addEventListener('click', deleteS)

function deleteS(e) {
	let sd = document.querySelectorAll('div.container-fluid>table>tbody input[type="checkbox"]:checked');
	for(let a of sd){
	a.parentElement.parentElement.remove();
	}
}









function checking(){
	let uncheck = document.querySelectorAll('div.container-fluid>table>tbody input[type="checkbox"]').length;
	let checki = document.querySelectorAll('div.container-fluid>table>tbody input[type="checkbox"]:checked').length;
	let upcheck = document.querySelector('div.container-fluid>table>thead input[type="checkbox"]');
	if(uncheck != checki){
			upcheck.checked = false;
	}else{
		upcheck.checked = true;
	}
}









