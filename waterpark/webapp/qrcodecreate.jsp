<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
    <title>chart</title>
<link href="${WCP }/resources/assets/css/font-awesome.css" rel="stylesheet">
<link href="${WCP }/resources/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet">
<link href="${WCP }/resources/assets/css/custom-styles.css" rel="stylesheet">

<jsp:include page="/customer-includee/preScript.jsp" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div id="wrapper">
        
        <div id="page-wrapper">
            <div id="page-inner">


                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                         
                        </h1>

                    </div>
                </div>
				
				
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-green green">
                            <div class="panel-left pull-left green">
                            <i class="fa fa-users fa-5x"></i>
<!--                                 <i class="fa fa-eye fa-5x"></i> -->
                                
                            </div>
                            <div class="panel-right">
								<h3>8,457</h3>
                               <strong> 금일 총 이용객 </strong>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                              <div class="panel-left pull-left blue">
                                <i class="fa fa-shopping-cart fa-5x"></i>
								</div>
                                
                            <div class="panel-right">
							<h3>52,160,333 </h3>
                               <strong>상품 수익</strong>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-red">
                            <div class="panel-left pull-left red">
                                <i class="fa bi bi-receipt-cutoff fa-5x"></i>
                               
                            </div>
                            <div class="panel-right">
							 <h3>${ticketAllMoney } </h3>
                               <strong> 이용권 수익 </strong>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-brown">
                            <div class="panel-left pull-left brown">
                                <i class="fa fa-users fa-5x"></i>
                                
                            </div>
                            <div class="panel-right">
							<h3>36,752 </h3>
                             <strong>방문예정 이용객</strong>

                            </div>
                        </div>
                    </div>
                </div>
				
				<div class="row">
				<div class="col-md-5">
						<div class="panel panel-default">
						<div class="panel-heading">
							이용별 수익 현황
						</div>
						<div class="panel-body">
							  <canvas id="pieChart"></canvas>
						</div>
					</div>   
					</div>		
					
						<div class="col-md-7">
					<div class="panel panel-default">
						<div class="panel-heading">
							이번년도 방문객
						</div>
						<div class="panel-body">
							   <canvas id="lineChart"></canvas>
						</div>
					</div>  
					</div>
					
				</div> 
			 
				
			
			
				
                <div class="row">
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                	매입 매출비교
                            </div>
                            <div class="panel-body">
                                <div id="morris-bar-chart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Donut Chart Example
                            </div>
                            <div class="panel-body">
                                <div id="morris-donut-chart"></div>
                            </div>
                        </div>
                    </div>

                </div>
				<div class="row">
				<div class="col-md-12">
				
					</div>		
				</div> 	
                <!-- /. ROW  -->

	   
				
				
				
                <div class="row">
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Tasks Panel
                            </div>
                            <div class="panel-body">
                                <div class="list-group">

                                    <a href="#" class="list-group-item">
                                        <span class="badge">7 minutes ago</span>
                                        <i class="fa fa-fw fa-comment"></i> Commented on a post
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">16 minutes ago</span>
                                        <i class="fa fa-fw fa-truck"></i> Order 392 shipped
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">36 minutes ago</span>
                                        <i class="fa fa-fw fa-globe"></i> Invoice 653 has paid
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">1 hour ago</span>
                                        <i class="fa fa-fw fa-user"></i> A new user has been added
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">1.23 hour ago</span>
                                        <i class="fa fa-fw fa-user"></i> A new user has added
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">yesterday</span>
                                        <i class="fa fa-fw fa-globe"></i> Saved the world
                                    </a>
                                </div>
                                <div class="text-right">
                                    <a href="#">More Tasks <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Responsive Table Example
                            </div> 
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>S No.</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>User Name</th>
                                                <th>Email ID.</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>John</td>
                                                <td>Doe</td>
                                                <td>John15482</td>
                                                <td>name@site.com</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Kimsila</td>
                                                <td>Marriye</td>
                                                <td>Kim1425</td>
                                                <td>name@site.com</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Rossye</td>
                                                <td>Nermal</td>
                                                <td>Rossy1245</td>
                                                <td>name@site.com</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Richard</td>
                                                <td>Orieal</td>
                                                <td>Rich5685</td>
                                                <td>name@site.com</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Jacob</td>
                                                <td>Hielsar</td>
                                                <td>Jac4587</td>
                                                <td>name@site.com</td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Wrapel</td>
                                                <td>Dere</td>
                                                <td>Wrap4585</td>
                                                <td>name@site.com</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- /. ROW  -->
			
		
				<footer><p>All right reserved. Template by: <a href="http://webthemez.com">WebThemez</a></p>
				
        
				</footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <script src="${WCP }/resources/assets/js/jquery.metisMenu.js"></script>
    <script src="${WCP }/resources/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="${WCP }/resources/assets/js/morris/morris.js"></script>
    <script src="${WCP }/resources/assets/js/easypiechart.js"></script>
    <script src="${WCP }/resources/assets/js/easypiechart-data.js"></script>
    <script src="${WCP }/resources/assets/js/Lightweight-Chart/jquery.chart.js"></script>
    <script src="${WCP }/resources/assets/js/custom-scripts.js"></script>
    
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
    label: '현장발권',
    fill:false,
    backgroundColor: 'rgb(255, 99, 132)',
    borderColor: 'rgb(255, 99, 132)',
    data: [2,30, 100, 50, 20, 200, 300, 450,300,1,2,3],
  },
  {
	    label: '온라인예매',
	    fill:false,
	    backgroundColor: 'rgb(54, 162, 235)',
	    borderColor: 'rgb(54, 162, 235)',
	    data: [10,34, 300, 52, 50, 30, 700, 650,400,23,44,12],
  }
  ]
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
		    '상품',
		    '음식',
		    '이용권'
		  ],
		  datasets: [{
		    label: 'My First Dataset',
		    data: [22450000, 30030400, 12340000],
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
</body>
</html>