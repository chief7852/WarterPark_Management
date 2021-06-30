<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- 선차트 -->
<div>
  <canvas id="lineChart"></canvas>
</div>

<!-- 원차트 -->
<div>
  <canvas id="pieChart"></canvas>
</div>


<!-- 막대차트 -->
<div>
  <canvas id=areaChart></canvas>
</div>
<div>
  <canvas id=myChart></canvas>
</div>
<!-- 선차트 -->
<script type="text/javascript">

const linelabels = [
  '1월',
  '2월',
  '3월',
  '4월',
  '5월',
  '6월',
  '7월',
  '8월',
  '9월',
  '10월',
  '11월',
  '12월',
];
let linedata = {
  labels: linelabels,
  datasets: [{
    label: 'My First dataset',
    backgroundColor: 'rgb(255, 99, 132)',
    borderColor: 'rgb(255, 99, 132)',
    data: [2,30, 100, 50, 20, 200, 300, 450,300,1,2,3],
  }]
};

const lineconfig = {
  type: 'line',
  data: linedata,
  options: {}
};
var lineChart = new Chart(
	    document.getElementById('lineChart'),
	    lineconfig
	  );
</script>
<!-- /선차트끝 -->
<!-- 원형차트 -->
<script type="text/javascript">

const piedata = {
		  labels: [
		    'Red',
		    'Blue',
		    'Yellow'
		  ],
		  datasets: [{
		    label: 'My First Dataset',
		    data: [300, 50, 100],
		    backgroundColor: [
		      'rgb(255, 99, 132)',
		      'rgb(54, 162, 235)',
		      'rgb(255, 205, 86)'
		    ],
		    hoverOffset: 4
		  }]
		};
		
const pieconfig = {
		  type: 'doughnut',
		  data: piedata,
		};
var pieChart = new Chart(
		 document.getElementById('pieChart'),
		 pieconfig
		)

</script>
<!-- /원형차트끝 -->
<!-- area차트 -->
<script type="text/javascript">



const areadata = {
		  labels: [
		    'Red',
		    'Green',
		    'Yellow',
		    'Grey',
		    'Blue'
		  ],
		  datasets: [{
		    label: 'My First Dataset',
		    data: [11, 16, 7, 3, 14],
		    backgroundColor: [
		      'rgb(255, 99, 132)',
		      'rgb(75, 192, 192)',
		      'rgb(255, 205, 86)',
		      'rgb(201, 203, 207)',
		      'rgb(54, 162, 235)'
		    ]
		  }]
		};
const areaconfig = {
		  type: 'polarArea',
		  data: areadata,
		  options: {}
		};
var areaChart = new Chart(
		 document.getElementById('areaChart'),
		 areaconfig
		)
</script>
<script type="text/javascript">

const bardata = {
  labels: [
	  '1월',
	  '2월',
	  '3월',
	  '4월',
	  '5월',
	  '6월',
	  '7월',
	  
	  ],
  datasets: [{
    label: '여성',
    data: [65, 59, 80, 81, 56, 55, 40],
    backgroundColor: [
      'rgba(255, 99, 132, 0.2)',
      'rgba(255, 159, 64, 0.2)',
      'rgba(255, 205, 86, 0.2)',
      'rgba(75, 192, 192, 0.2)',
      'rgba(54, 162, 235, 0.2)',
      'rgba(153, 102, 255, 0.2)',
      'rgba(201, 203, 207, 0.2)'
    ],
    borderColor: [
      'rgb(255, 99, 132)',
      'rgb(255, 159, 64)',
      'rgb(255, 205, 86)',
      'rgb(75, 192, 192)',
      'rgb(54, 162, 235)',
      'rgb(153, 102, 255)',
      'rgb(201, 203, 207)'
    ],
    borderWidth: 1
  },{
	    label: '남성',
	    data: [65, 59, 80, 81, 56, 55, 40],
	    backgroundColor: [
	      'rgba(255, 99, 132, 0.2)',
	      'rgba(255, 159, 64, 0.2)',
	      'rgba(255, 205, 86, 0.2)',
	      'rgba(75, 192, 192, 0.2)',
	      'rgba(54, 162, 235, 0.2)',
	      'rgba(153, 102, 255, 0.2)',
	      'rgba(201, 203, 207, 0.2)'
	    ],
	    borderColor: [
	      'rgb(255, 99, 132)',
	      'rgb(255, 159, 64)',
	      'rgb(255, 205, 86)',
	      'rgb(75, 192, 192)',
	      'rgb(54, 162, 235)',
	      'rgb(153, 102, 255)',
	      'rgb(201, 203, 207)'
	    ],
	    borderWidth: 1
	  }]
};
const barconfig = {
		  type: 'bar',
		  data: bardata,
		  options: {
		    scales: {
		      y: {
		        beginAtZero: true
		      }
		    }
		  },
		};
		
var Chart = new Chart(
		 document.getElementById('myChart'),
		 barconfig
		)
</script>
</body>
</html>