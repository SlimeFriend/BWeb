/**
 * basic.js
 */
// 

// script 연결문이 jsp상단에 있어도 나중에 실행하여 id class 등을 인식할 수 있게 하는 것

//document.addEventListener('DOMContentLoaded', function(){
	
$(document).ready(function(){
	
// jquery객체 vs dom 객체 

let obj = $('#show');
//obj = document.getElementById('show');
console.log(obj);

let obj2 = $('.show');
obj2.eq(0).html('Hello');                        // html = innerHTML
obj2.eq(1).html('World');
console.log(obj2);

// jquery 객체 생성.
$('#show').append($('<button />').html('삭제'));    // <button>삭제</button>
	
})


