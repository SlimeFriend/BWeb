/**
 *  index.js
 */



// 접종센터 정보
let centerAry = [];
console.log("1", centerAry);


url = 'https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=284&serviceKey=CR6H4upFNYvL4%2Bc%2BLV2kq6v73r1PfFSTF%2F3mNQbT7%2B%2Bsv44dBCxA7ER361TANa5Wt9kiRJlTKP%2FLcSORP2w8Zg%3D%3D'


console.log('3', centerAry);

let arrayFunc = result => {
	console.log(result);
	centerAry = result.data; // []284건
	console.log('2', centerAry);

	//forEach, map, filter(조건을 만족하는 새로운 배열 생성), reduce
	let newAry = centerAry.filter(function(center, idx, ary) {
		return center.sido == '인천광역시'
	});
	console.log(newAry);
	let field = ['id', 'centerName', 'address', 'phoneNumber'];

	newAry.forEach(center => {
		let tr = document.createElement('tr');
		tr.addEventListener('click', function(e) {
			//		 location.href = 'map.jsp?lat='+center.lat+'&lng='+center.lng;
			window.open('map.jsp?lat=' + center.lat + '&lng=' + center.lng);
		});
		for (let prop of field) {
			let td = document.createElement('td');
			td.innerHTML = center[prop];
			tr.append(td);
		}
		document.querySelector('tbody').append(tr);
	});



} // end of arrayFunc


fetch(url)    // fetch는 ajax다.
	.then(result => { return result.json() })
	.then(arrayFunc)
	.catch(err => console.error('에러=>', err));






document.querySelector('#selectCenter').addEventListener('change', function(e) {
	document.querySelector('tbody').innerHTML = '';
	newAry = centerAry.filter(function(center, idx, ary) {
		return center.sido == document.querySelector('#selectCenter').value;
	});
	console.log(newAry);
	
	let field = ['id', 'centerName', 'address', 'phoneNumber'];
	
	newAry.forEach(center => {
		let tr = document.createElement('tr');
		tr.addEventListener('click', function(e) {
			//		 location.href = 'map.jsp?lat='+center.lat+'&lng='+center.lng;
			window.open('map.jsp?lat=' + center.lat + '&lng=' + center.lng);
		});
		for (let prop of field) {
			let td = document.createElement('td');
			td.innerHTML = center[prop];
			tr.append(td);
		}
		document.querySelector('tbody').append(tr);
	});
})
