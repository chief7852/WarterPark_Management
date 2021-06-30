<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${WCP}/resources/customer-assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${WCP }/resources/fakeloader/css/demo.css">
<link rel="stylesheet" href="${WCP }/resources/fakeloader/css/fakeLoader.min.css">
<link href="${WCP }/resources/assets/css/font-awesome.css" rel="stylesheet">
<link href="${WCP }/resources/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet">
<link href="${WCP }/resources/assets/css/custom-styles.css" rel="stylesheet">
<%-- <link rel="stylesheet" href="${WCP }/resources/css/button.css"> --%>

<style>
.panel-body{
	width: 100%;
	height: 100%;
}
th{
	text-align: center;
}
td{
	text-align: center;
}
.hov{

}
.btn-light{
	z-index : 12;
	position:absolute;
}
.btn-danger{
	position: absolute;
	
}
.btn-primary{


}
.over1{
	z-index:30;
	transform:translateX(-60px);
}
.over2{
	z-index:30;
	transform:translateX(-120px);
}
#pieChart{
	    margin: auto;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<section id="main-content">
 <div class="fakeLoader"></div>
<div id="wrapper">
        
        <div id="page-wrapper">
            <div id="page-inner">


				
				
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-green green">
                            <div class="panel-left pull-left green">
                            <i class="fa fa-users fa-5x"></i>
<!--                                 <i class="fa fa-eye fa-5x"></i> -->
                                
                            </div>
                            <div class="panel-right">
								<h3>${usevisitortoday }</h3>
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
							<h3>${prodAlltoday }</h3>
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
							 <h3>${ticketAllMoney }</h3>
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
							<h3>2,743 </h3>
                             <strong>방문예정 이용객</strong>

                            </div>
                        </div>
                    </div>
                </div>
				
				<div class="row">
				<div class="col-md-5">
						<div class="panel panel-default" style="height: 666px;">
						<div class="panel-heading">
							이용별 수익 현황
							

						</div>
						<div class="panel-body">
							  <canvas id="pieChart" width="570" height="570">
							  <c:if test="${todayMoneyPR == '0' && todayMoneyfood == '0'&& ticketAllMoney == '0'}">
							(현재는 수익이 없습니다)
							</c:if>
							  </canvas>
						</div>
					</div>   
					</div>		
					
						<div class="col-md-7">
					<div class="panel panel-default" style="height: 666px;">
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
                    
                    <div class="col-md-12 col-sm-12 col-xs-12">
<div class="panel panel-default">
                            <div class="panel-heading">
                                	물품 신청 내역
                            </div> 
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="col-md-1">팀명</th>
                                                <th class="col-md-1">신청자</th>
                                                <th class="col-md-3">신청물품</th>
                                                <th class="col-md-3">내용</th>
                                                <th class="col-md-2">금액</th>
                                                <th class="col-md-2">승인여부</th>
                                                <th class="col-md-1">-</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="empProd" items="${empProdList }">
                                        	<tr>
                                                <td class="ts col-md-1">${EmpVO.team_name }</td>
                                                <td class="ts col-md-1">${EmpVO.emp_name }</td>
                                                <td class="ts col-md-3">${empProd.report_title }</td>
                                                <td class="ts col-md-3">${empProd.report_cont }</td>
                                                <td class="ts col-md-2">${empProd.report_cont }</td>
                                                <td class="ts col-md-2 checked">-</td>
                                                <td class="col-md-1 hov"><input class="btn btn-light" type="button" value="설정"><input class="btn btn-danger nope" type="button" value="거부"><input class="btn btn-primary yes" type="button" value="승인"></td>
                                            </tr>
                                        </c:forEach>
                                           

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
<!--                         <div class="panel panel-default"> -->
<!--                             <div class="panel-heading"> -->
<!--                                 	물품 신청 내역 -->
<!--                             </div>  -->
<!--                             <div class="panel-body"> -->
<!--                                 <div class="table-responsive"> -->
<!--                                     <table class="table table-striped table-bordered table-hover"> -->
<!--                                         <thead> -->
<!--                                             <tr> -->
<!--                                                 <th class="col-md-1">팀명</th> -->
<!--                                                 <th class="col-md-1">신청자명</th> -->
<!--                                                 <th class="col-md-3">신청물품</th> -->
<!--                                                 <th class="col-md-3">내용</th> -->
<!--                                                 <th class="col-md-2">금액</th> -->
<!--                                                 <th class="col-md-2">승인여부</th> -->
<!--                                                 <th class="col-md-1">-</th> -->
<!--                                             </tr> -->
<!--                                         </thead> -->
<!--                                         <tbody> -->
<!--                                             <tr> -->
<!--                                                 <td class="col-md-1">스낵팀</td> -->
<!--                                                 <td class="col-md-1">김알바</td> -->
<!--                                                 <td class="col-md-3">무전기</td> -->
<!--                                                 <td class="col-md-3">2021년06월24일 어디어디에서 분실했습니다.</td> -->
<!--                                                 <td class="col-md-2">43,000원</td> -->
<!--                                                 <td class="col-md-2">-</td> -->
<!--                                                 <td class="col-md-1 hov"><input class="btn btn-light" type="button" value="설정"><input class="btn btn-danger" type="button" value="거부"><input class="btn btn-primary" type="button" value="승인"></td> -->
<!--                                             </tr> -->
<!--                                                                                         <tr> -->
<!--                                                 <td class="col-md-1">스낵팀</td> -->
<!--                                                 <td class="col-md-1">김알바</td> -->
<!--                                                 <td class="col-md-3">무전기</td> -->
<!--                                                 <td class="col-md-3">2021년06월24일 어디어디에서 분실했습니다.</td> -->
<!--                                                 <td class="col-md-2">43,000원</td> -->
<!--                                                 <td class="col-md-2"><i class="bi bi-check2-circle"></i></td> -->
<!--                                                 <td class="col-md-1 hov"><input class="btn btn-light" type="button" value="설정"><input class="btn btn-danger" type="button" value="거부"><input class="btn btn-primary" type="button" value="승인"></td> -->
<!--                                             </tr> -->
<!--                                                                                         <tr> -->
<!--                                                 <td class="col-md-1">스낵팀</td> -->
<!--                                                 <td class="col-md-1">김알바</td> -->
<!--                                                 <td class="col-md-3">무전기</td> -->
<!--                                                 <td class="col-md-3">2021년06월24일 어디어디에서 분실했습니다.</td> -->
<!--                                                 <td class="col-md-2">43,000원</td> -->
<!--                                                 <td class="col-md-2"><i class="bi bi-x-circle"></i></td> -->
<!--                                                 <td class="col-md-1 hov"><input class="btn btn-light" type="button" value="설정"><input class="btn btn-danger" type="button" value="거부"><input class="btn btn-primary" type="button" value="승인"></td> -->
<!--                                             </tr> -->
<!--                                                                                         <tr> -->
<!--                                                 <td class="col-md-1">스낵팀</td> -->
<!--                                                 <td class="col-md-1">김알바</td> -->
<!--                                                 <td class="col-md-3">무전기</td> -->
<!--                                                 <td class="col-md-3">2021년06월24일 어디어디에서 분실했습니다.</td> -->
<!--                                                 <td class="col-md-2">43,000원</td> -->
<!--                                                 <td class="col-md-2"><i class="bi bi-check2-circle"></i></td> -->
<!--                                                 <td class="col-md-1 hov"><input class="btn btn-light" type="button" value="설정"><input class="btn btn-danger" type="button" value="거부"><input class="btn btn-primary" type="button" value="승인"></td> -->
<!--                                             </tr> -->
<!--                                                                                         <tr> -->
<!--                                                 <td class="col-md-1">스낵팀</td> -->
<!--                                                 <td class="col-md-1">김알바</td> -->
<!--                                                 <td class="col-md-3">무전기</td> -->
<!--                                                 <td class="col-md-3">2021년06월24일 어디어디에서 분실했습니다.</td> -->
<!--                                                 <td class="col-md-2">43,000원</td> -->
<!--                                                 <td class="col-md-2"><i class="bi bi-x-circle"></i></td> -->
<!--                                                 <td class="col-md-1 hov"><input class="btn btn-light" type="button" value="설정"><input class="btn btn-danger" type="button" value="거부"><input class="btn btn-primary" type="button" value="승인"></td> -->
<!--                                             </tr> -->
<!--                                                                                         <tr> -->
<!--                                                 <td class="col-md-1">스낵팀</td> -->
<!--                                                 <td class="col-md-1">김알바</td> -->
<!--                                                 <td class="col-md-3">무전기</td> -->
<!--                                                 <td class="col-md-3">2021년06월24일 어디어디에서 분실했습니다.</td> -->
<!--                                                 <td class="col-md-2">43,000원</td> -->
<!--                                                 <td class="col-md-2"><i class="bi bi-check2-circle"></i></td> -->
<!--                                                 <td class="col-md-1 hov"><input class="btn btn-light" type="button" value="설정"><input class="btn btn-danger" type="button" value="거부"><input class="btn btn-primary" type="button" value="승인"></td> -->
<!--                                             </tr> -->

<!--                                         </tbody> -->
<!--                                     </table> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->

                    </div>
                </div>
                <!-- /. ROW  -->
			
	
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
    data: [
    	'30302',
    	'40302',
    	'25302',
    	'65302',
    	'90302',
    	'150321',
    	'${visitorMonth.om7}', 
    	'${visitorMonth.om8}',
    	'${visitorMonth.om9}',
    	'${visitorMonth.om10}',
    	'${visitorMonth.om11}',
    	'${visitorMonth.om12}'],
  },
  {
	    label: '온라인예매',
	    fill:false,
	    backgroundColor: 'rgb(54, 162, 235)',
	    borderColor: 'rgb(54, 162, 235)',
	    data: [
	    	'80302',
	    	'90302',
	    	'85302',
	    	'225302',
	    	'460302',
	    	'650321',
	    	'67020', 
	    	'${visitorMonth.tm8}',
	    	'${visitorMonth.tm9}',
	    	'${visitorMonth.tm10}',
	    	'${visitorMonth.tm11}',
	    	'${visitorMonth.tm12}'],
  }
  ]
};

const lineconfig = {
  type: 'line',
  data: linedata,
  options: {
	  

  }
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
		    data: [parseInt('${todayMoneyPR }'), parseInt('${todayMoneyfood }'), parseInt('${ticketAllMoney}')],
		    backgroundColor: [
		      '#32C2CD',
		      'rgb(54, 162, 235)',
		      'rgb(166, 166, 166)'
		    ],
		    hoverOffset: 4
		  }]
		};
		
const pieconfig = {
		  type: 'doughnut',
		  data: piedata,
		  options:{
			  responsive: false
		  }
		};
var pieChart = new Chart(
		 document.getElementById('pieChart'),
		 pieconfig
		)
$('.btn-light').on("click",function(){
	$(this).parents(".hov").children('.btn-danger').toggleClass('over1');
	$(this).parents(".hov").children('.btn-primary').toggleClass('over2');
})
</script>
<!-- /원형차트끝 -->
<script src="${WCP }/resources/fakeloader/js/fakeLoader.min.js"></script>
        <script>
            $(document).ready(function(){
                $.fakeLoader({
                    timeToHide:600,
                    bgColor:"#222D32",
                    spinner:"spinner3"
                });
            });

            $(document).on("click",".nope",function(){
            	$(this).parents('tr').find(".checked").html('<i class="bi bi-x-circle"></i>')
            })
            $(document).on("click",".yes",function(){
            	$(this).parents('tr').find(".checked").html('<i class="bi bi-check2-circle"></i>')
            	
            })
        </script>

        <div class="fakeLoader"></div>

</section>