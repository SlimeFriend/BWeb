/**
 * 	 	json4.js
 */

document.querySelector('#show').remove();
document.querySelector('div.container-fluid>div:nth-of-type(2)').remove();
document.querySelector('div.container-fluid>table').remove();



// Asynchronous Javascript And Xml  (AJAX)
let xhtp = new XMLHttpRequest();
xhtp.open('get', 'studentJson.do'); // 특정페이지 요청.
xhtp.send();
let students;
xhtp.onload = function(e) {
	//console.log(xhtp.response);
	let json = xhtp.response;
	students = JSON.parse(json);
	initList();
}


function initList() {
	let target = document.getElementById('stdList');
	target.innerHTML = '';
	students.forEach(emp => {
		target.appendChild(makeRow(emp));
	});
}


// 사원정보 => row 생성.

function makeRow(emp = {}) {
	let fields = ['stdNo', 'stdName'];
	let tr = document.createElement('tr');
	tr.setAttribute("data-sno", 'stdNo')
	fields.forEach(field => {
		let td = document.createElement('td');
		td.innerHTML = emp[field];
		tr.appendChild(td);
	})

	//삭제버튼 생성
	let td = document.createElement('td');
	let btn = document.createElement('button');
	btn.setAttribute("class", "btn btn-danger");
	btn.innerHTML = "삭제";
	btn.addEventListener("click", deleteStudent);
	td.appendChild(btn);
	tr.appendChild(td);


	return tr;
}



function deleteStudent(e) {
	console.log(e.target.parentElement.parentElement.firstChild.innerText);
	let tr = e.target.parentElement.parentElement;
	let sno = e.target.parentElement.parentElement.firstChild.innerText;
	sno = e.target.parentElement.parentElement.dataset.sno;   //getAttribute("data-sno")
	const delHtp = new XMLHttpRequest();
	delHtp.open('get', 'removeStudent.do?sno=' + sno);
	delHtp.send();
	delHtp.onload = function(e) {
		let result = JSON.parse(delHtp.responseText);
		if (result.retCode == 'Success') {
			alert("성공");
			tr.remove();
		} else if (result.retCode == 'Fail') {
			alert("실패");
		}
	}
}

// 등록이벤트
document.querySelector('#addBtn').addEventListener('click', addRowFnc);


function addRowFnc(e) {
	let sno = document.querySelector('#sno').value;
	let sname = document.querySelector('#sname').value;
	let phone = document.querySelector('#phone').value;

	const addHtp = new XMLHttpRequest();
	addHtp.open('get', 'addStudent.do?sno=' + sno + '&sname=' + sname + '&phone=' + phone);
	addHtp.send();
	addHtp.onload = function(e) {
		console.log(addHtp.response);
		let result = JSON.parse(addHtp.responseText);
		if (result.retCode == 'Success') {
			let tr = makeRow(result.retVal);
			document.getElementById('stdList').appendChild(tr);
			alert("성공");
			makeRow(result.sno, result.sname);
		} else if (result.retCode == 'Fail') {
			alert("실패");
		}
	}
}