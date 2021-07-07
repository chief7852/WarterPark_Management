<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- GetBootstrap v4.6 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

  <!-- Vendor CSS Files -->
  <link href="${WCP}/resources/customer-assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${WCP}/resources/customer-assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${WCP}/resources/customer-assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

  <!-- Template Main CSS File -->
<link href="${WCP}/resources/customer-assets/css/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${WCP}/resources/bootstrap-5.0.0-dist/css/bootstrap.min.css">
<link href="${WCP}/resources/assets/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="${WCP}/resources/bootstrap-5.0.0-dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${WCP}/resources/customer-assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${WCP}/resources/customer-assets/js/myjQueryPlugin.js"></script>
<script type="text/javascript"
	src="${WCP}/resources/customer-assets/js/jquery.form.min.js"></script>
<!-- boxicon style -->
<link href="${WCP }/resources/customer-assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="${WCP }/resources/customer-assets/css/reserve.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gugi&family=Jua&display=swap" rel="stylesheet">
<style type="text/css">
	body {
	font-family: 'Jua', sans-serif;
	}
	#printArea{
		padding: 5%;	
	}
	#QRCode{
		width : 180px;
		display: inline-block;
		float: right;
	}
	.table-footer{display: inline-block;}
	#logo{
		width: 330px;
	}
	#title{
		display: inline-block;
		margin-left: 15%;
	}
</style>
</head>
<body >
<div id="printArea">
	<div>
		<img id="logo" alt="" src="${WCP }/resources/assets/images/icons/water_kdy_min.png">
		<h1 id="title">예매 내역</h1>
		<img id="QRCode" alt="QRCode" src="">
	</div>
	<table class="table">
               <tr>
                   <th class="table-highlight">예매 번호</th>
                   <td >${reserve.res_code }</td>
                   <th class="table-highlight">주문한 사람</th>
                   <td>${reserve.user_name }</td>
               </tr>
               <tr>
                   <th class="table-highlight">방문 예정일</th>
                   <td >
                   	<c:choose>
   	            		<c:when test='${reserve.resInfoList[0].ticket.ticket_grp ne "YR" }'>
		                    ${reserve.res_predate }
                		</c:when>
                		<c:otherwise>-</c:otherwise>
               		</c:choose>
                   </td>
                   <th class="table-highlight">예매 날짜</th>
                   <td>${reserve.res_date }</td>
               </tr>
               <tr>
               	<th class="table-highlight">총 예매 수</th>
               	<td >${reserve.res_cnt } 장</td>
               	<th class="table-highlight">결제 방식</th>
                   <td>${reserve.pay.pay_way_name }</td>
               </tr>
                <tr>
                	<th class="table-highlight">적용된 할인</th>
                	<td >${not empty reserve.sale.sale_name ? reserve.sale.sale_name : "-" }</td>
                	<th class="table-highlight">환불 날짜</th>
                	<td>${not empty reserve.res_cancel ? reserve.res_cancel : "-" }</td>
               	</tr>
       </table>
	<table class="table">
               <tr>
               	<th class="table-no table-highlight">No.</th>
               	<th class="table-highlight">이용권 이름</th>
               	<th class="table-highlight">이용권 종류</th>
               	<th class="table-highlight">이용권 연령</th>
               	<th class="table-highlight">구매 수량</th>
               </tr>
               
               <c:if test="${not empty reserve.resInfoList }">
               	<c:forEach items="${reserve.resInfoList }" var="resInfo" varStatus="no" >
	                <tr>
	                	<td class="table-no">${no.index + 1 }</td>
	                	<td>${resInfo.ticket.ticket_name }</td>
	                	<td>${resInfo.ticket.ticket_type_name }</td>
	                	<td>${resInfo.ticket.ticket_age_name }</td>
	                	<td>${resInfo.res_info_cnt } 장</td>
	                </tr>
                </c:forEach>
               </c:if>
               <c:if test="${empty reserve.resInfoList }">
               	<tr>
               		<td colspan="5"> 예매한 내역이 없습니다. </td>
               	</tr>
               </c:if>
       </table>
       
	<table class="table table-footer">
			<c:if test='${reserve.resInfoList[0].ticket.ticket_grp eq "YR" }'>
				<tr>
               		<th class="table-highlight">멤버십 만료 일자</th>
               		<td class="text-right">${reserve.resInfoList[0].membership.membership_end }</td>
              		</tr>
             		</c:if>
			<tr>
				<th class="table-highlight">결제 금액</th>
				<td class="text-right">${reserve.pay.pay_amount } 원</td>
			</tr>
	</table>
	<br>
	<hr>
	<div>
		<h6>이용 시 유의사항</h6>
		<ul>
			<li>게이트로 입장하려는 고객이 동시에 몰리는 경우, 게이트 앞 대기라인을 통해 입장하실 수 있습니다.</li>
			<li>시설물 및 안전 점검으로 인하여 일부 시설은 교차 운영될 수 있습니다.</li>
			<li>입장 시 안전과 위생을 위하여 '외부 음식물' 반입은 할 수 없습니다.</li>
			<li>영/유아가 취식할 수 있는(죽, 미음) 음식물, 환자가 필요로 하는 취식 또는 약품에 한하여 반입을 허용하고 있습니다.</li>
			<li>위의 사항을 숙지하지 않은 채로 입장 시간을 지연 시키는 등의 타인에게 피해를 주는 행동을 할 시에는 입장이 제한될 수 있습니다.</li>
			<li>소인과 우대 사항에 해당되는 입장권의 경우 신분증 또는 증명 서류를 제시해 주셔야 하며, 미지참시 입장이 제한될 수 있습니다.</li>
			<li>공식 홈페이지 : www.daedeokwaterpark.com</li>
		</ul>
		<h6>예매 환불 시 유의사항</h6>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		let res_code_encode = "${reserve.res_code_encode}";
		let url = "${WCP}/reserveView/qrcodecreate";
		url += "?res_code_encode=" + "${reserve.res_code_encode}" + "&res_date=" + "${reserve.res_date}";
		$("#QRCode").attr("src", url);
		setTimeout(function(){
			window.print();
		},1000);
	});
</script>
</body>
</html>