/**
 * 	 	json2.js
 */
document.querySelector('div.container-fluid>div:nth-of-type(2)').remove();
document.querySelector('div.container-fluid>table').remove();


let json = `[{"id":1,"first_name":"Noe","last_name":"Sunnex","email":"nsunnex0@macromedia.com","gender":"Male","salary":2835},
{"id":2,"first_name":"Max","last_name":"McKinna","email":"mmckinna1@imdb.com","gender":"Female","salary":1149},
{"id":3,"first_name":"Orin","last_name":"Belford","email":"obelford2@cpanel.net","gender":"Male","salary":3298},
{"id":4,"first_name":"Saudra","last_name":"Whitmell","email":"swhitmell3@dyndns.org","gender":"Female","salary":6335},
{"id":5,"first_name":"Michael","last_name":"McCole","email":"mmccole4@economist.com","gender":"Male","salary":6395},
{"id":6,"first_name":"Raymond","last_name":"Fern","email":"rfern5@amazon.de","gender":"Male","salary":4678},
{"id":7,"first_name":"Randall","last_name":"Fawlks","email":"rfawlks6@unblog.fr","gender":"Male","salary":4402},
{"id":8,"first_name":"Maddy","last_name":"Venditti","email":"mvenditti7@goo.gl","gender":"Female","salary":9691},
{"id":9,"first_name":"Shea","last_name":"Wiggington","email":"swiggington8@histats.com","gender":"Male","salary":2889},
{"id":10,"first_name":"Christopher","last_name":"Ferre","email":"cferre9@dropbox.com","gender":"Male","salary":8789},
{"id":11,"first_name":"Leicester","last_name":"Newvill","email":"lnewvilla@marriott.com","gender":"Male","salary":5224},
{"id":12,"first_name":"Fanchette","last_name":"McHugh","email":"fmchughb@123-reg.co.uk","gender":"Female","salary":4872},
{"id":13,"first_name":"Morganica","last_name":"Load","email":"mloadc@jiathis.com","gender":"Female","salary":9944},
{"id":14,"first_name":"Donica","last_name":"Tommasi","email":"dtommasid@blogtalkradio.com","gender":"Female","salary":7580},
{"id":15,"first_name":"Stefa","last_name":"MacDonnell","email":"smacdonnelle@hud.gov","gender":"Female","salary":1753},
{"id":16,"first_name":"Mavra","last_name":"Keson","email":"mkesonf@economist.com","gender":"Female","salary":9233},
{"id":17,"first_name":"Humphrey","last_name":"Rankling","email":"hranklingg@jalbum.net","gender":"Male","salary":2960},
{"id":18,"first_name":"Myriam","last_name":"Dewberry","email":"mdewberryh@samsung.com","gender":"Female","salary":5451},
{"id":19,"first_name":"Jillene","last_name":"Pero","email":"jperoi@cdbaby.com","gender":"Female","salary":3372},
{"id":20,"first_name":"Sybilla","last_name":"Faire","email":"sfairej@geocities.jp","gender":"Female","salary":5308}]`;

let employees = JSON.parse(json);
console.log(employees);

document.querySelector('#searchGender').addEventListener('change',function(e){
	
})

function initList(){	
	let target = document.getElementById('empList');
	target.innerHTML = '';
	let selValue = document.querySelector('#searchGender').value;
	employees.forEach(emp => {
		if(selValue == 'All' || emp.gender == selValue){
		target.appendChild(makeRow(emp));
		}
	});
}

initList();

// 사원정보 => row 생성.

function makeRow(emp = {}) {
	let fields = ['id', 'first_name', 'last_name', 'salary'];
	let tr = document.createElement('tr');
	fields.forEach(field => {
		let td = document.createElement('td');
		td.innerHTML = emp[field];
		tr.appendChild(td);
	})
	return tr;
}

