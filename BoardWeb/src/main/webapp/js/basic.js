/**
 * 
 */
console.log("basic.js");

let name = "이창호";
let address = '대구 100번지';
let age = 15;

//const myInfo = {name: name, address: address, age: age};
const myInfoAry = [name, address, age];

// createElement('span') => <span></span>
// innerText/innerHTML = 값.
// 부모,appendChild(자식) => <부모><자식/></부모>
makeDom()
function makeDom() {
	// for .. in ..
	for(let prop in myInfoAry){
		let span = document.createElement('span');
	span.innerHTML = myInfoAry[prop] + ' ';
	document.getElementById('show').appendChild(span);
	console.log(span);
	}
}

myInfoAry.forEach(function(prop){
	
	for(let prop in item){
		console.log(prop + ', ' + item[prop])
	}
});


console.log(`이름은 ${name}이고 주소는 ${address} 입니다. ${age > 20 ? '성년' : '미성년'} 입니다.`);
name = 20;
console.log(typeof name);

const obj = {name: "홍길동", 
						 age: 20,
						 myInfo: function(){
							return this.name + ', ' + this.age; 
						 	}
						 };
						 
console.log(`이름은 ${obj.name}, 나이는 ${obj['age']}`);
console.log(obj.myInfo());

for (let prop in obj) {
	console.log(`속성은 ${prop}이고 값은 ${obj[prop]}`);
}

const ary = [1, 2, 3];
ary.push(4);
ary.unshift(5);

for(let num of ary) {
	console.log(`값은 ${num}입니다.`)
}

ary.forEach(function(item, idx, ary){
	if(item%2==0){
		console.log(item);
	}
	if(idx == 0 || 2 || 4){
		console.log(item);
	}
});


const friends = [
	{name: "홍길동", address: "대구 100번지", height:170},
	{name: "김민규", address: "대전 200번지", height:175},
	{name: "이성윤", address: "인천 300번지", height:180}
]

friends.forEach(function(friend){
	//friend 정보를 한건씩 반복
	for (let prop in friend) {
		console.log(prop + ', ' + friend[prop]);
	}
	console.log(`------------------------`);
});