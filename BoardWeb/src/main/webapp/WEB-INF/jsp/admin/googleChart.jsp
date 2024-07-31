<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      
      let dataAry = [];
      dataAry.push(['작성자', '작성건수']);
      
      url = 'countByMember.do';
      fetch(url) //method: 'get', headers: '', body: ''
      	.then(function(result) {     // fetch의 'countByMember.do의 정보가 function(result)의 result값에 전달.
    	  	return result.json();       // 문자열 -> 객체로 바꿔줌(json)
      })
     	 .then(function(result){     // 위에서 return 값은 다시 then의 function의 매개변수 result에 전달
    		  console.log(result);
      		result.forEach(member => {
      			dataAry.push([member.member_name, member.member_cnt]);
      		});
      	google.charts.setOnLoadCallback(drawChart);
      });

      function drawChart() {

        var data = google.visualization.arrayToDataTable(dataAry);

        var options = {
          title: '작성자별 작성 건수'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      
      

      
      
</script>    
    
<!-- googleChart.jsp -->
<h3>차트....</h3>
<div id="piechart" style="width: 900px; height: 500px;"></div>