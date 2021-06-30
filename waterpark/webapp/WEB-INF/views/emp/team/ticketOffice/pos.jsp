<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!--  [[개정이력(Modification Information)]]       -->
<!--  수정일        수정자     수정내용               -->
<!-- 	2021. 5. 26  -->
<!--  ==========   ======    ==============        -->
<!--  2021. 5. 25.}     정이삭     최초작성               -->
<!--  2021. 6. 13.}     김도윤     메인 프로세스 시작               -->
<!--  Copyright (c) 2021 by DDIT All right reserved -->

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">
<title>Daedeok POS</title>
<jsp:include page="/customer-includee/preScript.jsp" />
<link href="https://nightly.datatables.net/css/jquery.dataTables.css"
	rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon"
	href="${WCP}/resources/assets/images/logos/squanchy.jpg">
<link rel="apple-touch-icon" sizes="180x180"
	href="${WCP}/resources/assets/images/logos/squanchy.jpg">
<link rel="icon" type="image/png" sizes="32x32"
	href="${WCP}/resources/assets/images/logos/squanchy.jpg">
<!-- jQuery -->
<!-- Bootstrap4 files-->
<script type="text/javascript" src="${WCP}/resources/js/jsQR.js"></script>
<link href="${WCP}/resources/assets/css/ui.css" rel="stylesheet"
	type="text/css" />
<link
	href="${WCP}/resources/assets/fonts/fontawesome/css/fontawesome-all.min.css"
	type="text/css" rel="stylesheet">
<link href="${WCP}/resources/assets/css/OverlayScrollbars.css"
	type="text/css" rel="stylesheet" />
<!-- Font awesome 5 -->
<link href="${WCP}/resources/emp-css/pos.css" type="text/css"
	rel="stylesheet" />
<link href="${WCP}/resources/emp-css/pos-modal.css" type="text/css"
	rel="stylesheet" />
<!-- header -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gugi&family=Jua&display=swap"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
a {
	text-decoration: none;
	color: black;
}

.ticket-list {
	overflow: auto;
	max-height: 750px;
	min-height: 750px;
}

.info-wrap {
	padding: 18% 10px 0 7%;
	min-height: 170px;
	font-size: 1.2em;
}

.pushUpBtn {
	padding: 12px 24px;
	/* 	    background-color: hsl(222, 100%, 95%); */
	color: hsl(243, 80%, 62%);
	border-radius: 6px;
	transition: transform 0.25s ease, box-shadow 0.25s ease,
		background-color 0.25s ease;
	box-shadow: 0 4px 6px rgba(50, 50, 93, .11), 0 1px 3px
		rgba(0, 0, 0, .08);
}

.pushUpBtn:hover {
	transform: translate3d(0px, -1px, 0px);
	background-color: #a6e3ff;
	box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px
		rgba(0, 0, 0, .08);
}

.ticket-area {
	margin-bottom: 25px;
}

#itemson {
	padding: 0 2%;
}

.price-new {
	float: right;
}

.category {
	margin-left: 0px;
}

.title {
	margin: 0 0 5px 0;
}

#cart {
	min-height: 435px;
	max-height: 435px;
	overflow: auto;
}

.ticket_cnt {
	width: 80px;
}

label[for='PTM'] {
	display: inline;
	font-size: xxx-large !important;
}

.SLPP {
	display: inline-block;
	float: right;
	width: 61%;
}

.qr-print-modal {
	max-height: 800px;
	overflow: auto;
}

.cash-table {
	display: inline-block;
	width: 49%;
	vertical-align: top;
}

.cash-dialog {
	max-width: 60%;
}

.cash-content {
	/* 		padding:20px; */
	box-sizing: upset;
	height: 790px;
}
/* 	#cash-body{ */
/* 		min-height: 60%; */
/* 	} */
#cal-button .btn {
	width: 160px;
	height: 115px;
	font-size: 3.5em;
	background: lightgrey;
	border: none;
}

#cal-button .btn[type='reset'] {
	font-size: 3.15em;
}

#cal-button td {
	padding: 3px;
	/* 		width: 32.3%; */
	/* 		height: 24.5%; */
}

#cash-body tr {
	width: 100%;
}

#cash-body th {
	width: 45%;
}

.cash-text {
	width: auto !important;
}

#cash-body tbody {
	width: 100%;
	/* 		font-size: 1.7em; */
}

.price-monitor {
	width: 200px !important;
	margin-right: 3px;
	height: 70px;
	font-size: inherit;
	text-align: right;
	display: inline-block;
}

#cal-monitor th, #cal-monitor td {
	font-size: 2.3em;
	height: 100px;
	padding-bottom: 100px;
}

#cal-monitor tr:last {
	vertical-align: bottom;
}

.shopping-cart-wrap .price {
	display: unset;
}

#reserveModal .modal-content, #coin-charge-Modal .modal-content {
	min-width: 960px;
	position: absolute;
	right: -40%;
	overflow: auto;
}

#outputLayer {
	width: max-content;
}

#reserveModal .modal-content table {
	text-align: center;
}
#SLPP{
	position: absolute;
    top: 46%;
    left: 70%;
    width: unset;
}
#SLPN{
    position: absolute;
    top: 46%;
}

#exit-success-modal h3{
	margin-left: auto;
	font-weight: normal;
}

#exit-success-modal div{
	background: #556270;
	color: #ffffff;
}

#exit-success-modal .modal-header{
	height: 8%;
}

#exit-success-modal .modal-body{
	text-align: center;
/* 	background-image: url("${WCP}/resources/assets/images/icons/exit_water_kdy.png"); */
/* 	background-repeat: no-repeat; */
/* 	background-size: contain; */
}

#exit-success-modal .modal-body h1{
	margin-top:8%;
	margin-bottom: 3%;
	font-size: 3.5em;
}
#exit-success-modal .modal-body h2{
	margin-top: 5%;
	font-size: 3em;
}

#exit-success-modal .modal-body p{
	font-size: 2em;
}

#exit-success-modal .modal-body img{
	display: inline-block;
	float: right;
}
.qrcode-img{
    display: block;
    top: -90px;
    position: relative;
    left: 195px;
}
</style>

</head>
<body>
	<!-- 	<button id="goFS"> -->
	<!-- 		<i class="bi bi-arrows-fullscreen"></i> -->
	<!-- 	</button> -->


	<jsp:include page="posHead.jsp" flush="true"></jsp:include>
	<!-- ========================= SECTION CONTENT ========================= -->
	<section class="section-content padding-y-sm bg-default ">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8 card padding-y-sm ticket-list ">
					<ul class="nav bg radius nav-pills nav-fill mb-3 bg" role="tablist">
						<li class="nav-item"><a class="nav-link category active show"
							data-toggle="pill" id="ALL" href="#nav-tab-card"> <i
								class="fa fa-tags"></i> 전체 이용권
						</a></li>
						<li class="nav-item"><a class="nav-link category" id="DY"
							data-toggle="pill" href="#nav-tab-paypal"> <i
								class="fa fa-tags "></i>일일 이용권
						</a></li>
						<li class="nav-item"><a class="nav-link category" id="DP"
							data-toggle="pill" href="#nav-tab-bank"> <i
								class="fa fa-tags "></i>우대권
						</a></li>
						<li class="nav-item"><a class="nav-link category" id="YR"
							data-toggle="pill" href="#nav-tab-bank"> <i
								class="fa fa-tags "></i>연간 이용권
						</a></li>
					</ul>

					<span id="items">

						<div class="row" id="itemson">
							<c:forEach items="${ticketList }" var="ticket">

								<div class="col-md-3 ticket-area">
									<figure class="card card-ticketuct">
										<a class="putBtn pushUpBtn"
											data-saleyn="${ticket.ticket_sale }"> <span
											class="badge-new">${ticket.ticket_id }</span> <input
											type="hidden" name="ticket_price"
											value="${ticket.ticket_price }" />
											<figcaption class="info-wrap">
												<p class="title ticket_name">${ticket.ticket_name }</p>
												<p class="title ticket_type">${ticket.ticket_type_name }</p>
												<p class="title ticket_age">[${ticket.ticket_age_name }]</p>
												<div class="action-wrap">
													<div class="price-wrap h5">
														<div class="price-new">${ticket.ticket_price }원</div>
													</div>
													<!-- price-wrap.// -->
												</div>
												<!-- action-wrap -->
											</figcaption>
										</a>
									</figure>
									<!-- card // -->
								</div>

							</c:forEach>
							<!-- col // -->

						</div> <!-- row.// -->
					</span>
				</div>
				<div class="col-md-4">
					<div class="card">
						<span id="cart">
							<table class="table table-hover shopping-cart-wrap">
								<thead class="text-muted">
									<tr>
										<th scope="col">상품</th>
										<th scope="col" width="120">수량</th>
										<th scope="col" width="120">가격</th>
									</tr>
								</thead>
								<tbody id="ticketCart">
								</tbody>
							</table>
						</span>
					</div>
					<!-- card.// -->
					<div class="box">
						<dl class="dlist-align">
							<dt>부가세:</dt>
							<dd id="tax" class="text-right">0원</dd>
						</dl>
						<dl class="dlist-align">
							<dt>할인:</dt>
							<dd class="text-right">0%</dd>
						</dl>
						<dl class="dlist-align">
							<dt>과세물품가:</dt>
							<dd id="subtotal" class="text-right">0원</dd>
						</dl>
						<dl class="dlist-align">
							<dt>합계:</dt>
							<dd id="total" class="text-right h4 b">0원</dd>
						</dl>
						<div class="row">
							<div class="col-md-6">
								<a id="reservView"
									class="btn btn-block btn-outline-secondary btn-lg"> <i
									class="bi bi-upc-scan"></i> 예약내역 조회
								</a>
							</div>
							<div class="col-md-6">
								<a id="coin-charge-btn" href="#"
									class="btn btn-block btn-outline-info btn-lg"> <i
									class="bi bi-wallet2"></i> 포켓 코인 조회
								</a>
							</div>
							<div class="col-md-6">
								<a id="cancle" href="#"
									class="btn  btn-default btn-error btn-lg btn-block"><i
									class="fa fa-times-circle "></i> 취소 </a>
							</div>
							<div class="col-md-6">
								<a id="refund" href="#"
									class="btn btn-block btn-outline-success btn-lg"><i
									class="bi bi-cash-coin"></i> 퇴장 </a>
							</div>
							<div class="col-md-12">
								<a id="charge" href="#"
									class="btn btn-block btn-secondary btn-lg"><i
									class="bi bi-credit-card"></i> 결제 </a>
							</div>
						</div>
					</div>
					<!-- box.// -->
				</div>
			</div>
		</div>

		<form action="${WCP }/emp/ticketOffice/reserve" method="post" id="ticketOrders">
			<input type="hidden" name="sale_id" /> 
			<input type="hidden" name="fc_id" value="FC2105190020" />
			<div id="idAndCnt"></div>
			<input type="hidden" name="pay_amount" /> 
			<input type="hidden" name="pay_method" />
			<input type="hidden" name="pay_way" value="TO"/>
			<div id="cash-Area"></div>
		</form>

		<form action="${WCP }/emp/pos" method="post" id="pos-SE">
			<input type="hidden" name="fc_id" value="FC2105190020" />
		</form>


		<jsp:include page="pos-modals.jsp" flush="true"></jsp:include>
	</section>
	<!-- ========================= SECTION CONTENT END// ========================= -->
	<script src="${WCP}/resources/assets/js/jquery-2.0.0.min.js"
		type="text/javascript"></script>
	<script src="${WCP}/resources/assets/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	<script src="${WCP}/resources/assets/js/OverlayScrollbars.js"
		type="text/javascript"></script>

<script type="text/javascript" src="${WCP }/resources/js/priceFormmating.js"></script>
	<script type="text/javascript">
let SEForm = $("#pos-SE");
var posStart = false;
let empName = "${EmpVO.emp_name}";
	$(document).on("click", ".SE", function(){
		let seID = $(this).attr("id");
		if(seID == "pos-start"){
			if(posStart == true){
				Swal.fire('이미 업무가 시작되었습니다.');
				return;
			}
			Swal.fire({
				  title: "담당자 이름 : '" + empName+"'",
				  text: "pos 업무를 시작하시겠습니까?",
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '확인',
				  cancelButtonText : '취소'
				}).then((result) => {
				  if (result.isConfirmed) {
					  $.ajax({
							url : SEForm.attr("action"),
							method : SEForm.attr("method"),
							data : SEForm.serialize(),
							dataType : "json",
							success : function(resp) {
								if(resp.result == "SUCCESS"){
									posStart = true;
									$(this).css("display", "none");
								    Swal.fire(
								      'pos 업무를 시작합니다.',
								      'Your file has been deleted.',
								      'success'
								    )
								}else{
									Swal.fire(
								      '시스템 오류!',
								      '시스템 오류로 pos 업무를 시작할 수 없습니다.<br>잠시 후에 시도해주세요.',
								      'warning'
								    ) 
								}
							},
							error : function(xhr, error, msg) {
								console.log(xhr);
								console.log(error);
								console.log(msg);
							}

						});
				  }
				})
		}else{
			SEForm.append($("<input>").attr({"name": "_method", "type":"hidden"}).val("put"));
			SEForm = $("pos-SE");
			$.ajax({
				url : SEForm.attr("action"),
				method : SEForm.attr("method"),
				data : SEForm.serialize(),
				dataType : "json",
				success : function(resp) {
					alert("마감 버튼 ajax 동작 성공!");
				},
				error : function(xhr, error, msg) {
					console.log(xhr);
					console.log(error);
					console.log(msg);
				}

			});
		}
		
	});
	
</script>




	<!-- 다시로그인 -->
	<script type="text/javascript">
function relogin(WCP){
	$(document).on("click","#proLog",function(){
		$.ajax({
			url : "${WCP}/snack/relogin",
			type : "get",
			data : "text",
			dataType : "text",
			success : function(data) {
				
			},
			error : function(xhr, status) {
				console.log(xhr);
				console.log(status);
			}
	
		});
		window.location.href='${WCP}/emp/empLogin'
	})
}
</script>
	<!-- 이용권카테고리별로 가져오기 -->
	<script type="text/javascript">
	let itemson = $("#itemson");
	$(document).on("click",".category",function(){
	
		let ticket_grp = $(this).attr("id");
		if(ticket_grp == 'ALL'){
			ticket_grp = "";
		}
		$(itemson).empty();
		$.ajax({
			url : "${WCP}/emp/ticketOffice",
			data : {"ticket_grp" : ticket_grp},
			dataType : "json",
			success : function(resp) {
				let tl = "";
				$(resp).each(function(idx, ticket){    
					tl += '<div class="col-md-3 ticket-area">                                                                                    ';
					tl += '	<figure class="card card-ticketuct">                                                                                 ';
					tl += '		<a class="putBtn pushUpBtn" data-saleyn="'+ticket.ticket_sale +'">                                                                                     ';
					tl += '		<span class="badge-new">'+ ticket.ticket_id + '</span>                                                              ';
					tl += '<input type="hidden" name="ticket_price" value="'+ticket.ticket_price +'"/>';
					tl += '		<figcaption class="info-wrap">                                                                                   ';
					tl += '<p class="title ticket_name">'+ ticket.ticket_name +'</p>           ';
					tl += '<p class="title ticket_type">' + ticket.ticket_type_name +'</p>      ';
					tl += '<p class="title ticket_age">[' + ticket.ticket_age_name +']</p>      ';
					tl += '			<div class="action-wrap">                                                                                    ';
					tl += '				<div class="price-wrap h5">                                                                              ';
					tl += '					<div class="price-new">' + ticket.ticket_price + '원</div>                                               ';
					tl += '				</div>                                                                                                   ';
					tl += '			</div>                                                                                                       ';
					tl += '		</figcaption>                                                                                                    ';
					tl += '		</a>	                                                                                                         ';
					tl += '	</figure>                                                                                                            ';
					tl += '</div>                                                                                                                ';
				});
				itemson.html(tl);
			},
			error : function(xhr, error, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}

		});
	});
	total = 0;
	let ticketCart = $("#ticketCart");
	$(document).on("click", ".putBtn", function(){
		let ticket_id = $(this).find(".badge-new").text();
		let ticket_name = $(this).find(".ticket_name").text();
		let ticket_type = $(this).find(".ticket_type").text();
		let ticket_age = $(this).find(".ticket_age").text();
		let ticket_price = $(this).find("input[name='ticket_price']").val();
		ticket_price = deleteComma(ticket_price);
		ticket_price = parseInt(ticket_price);
		
		let ticket_sale = $(this).data("saleyn");
		if(total != 0){
			total = parseInt(deleteComma(total));
		}
		
		if(document.getElementById(ticket_id)){
// 			alert("이미 잇어!");
			let cnt = $("#" + ticket_id).find(".number").text();
			cnt++;
			$("#" + ticket_id).find(".number").text(cnt);
			let price = $("#" + ticket_id).find(".price").text();
			price = deleteComma(price);
			price = parseInt(price) + ticket_price;
			price = putComma(price);
			$("#" + ticket_id).find(".price").text(price);
			/* 순수 총 계산금액 */
			total += parseInt(ticket_price);
// 			total = putComma(total);
// 			$("#total").text(total + "원");
		}else{
			
			let carts = '<tr id='
				+ ticket_id
				+ ' data-saleyn="'+ ticket_sale +'"><td><figure class="media"><div class="hprice" hidden>'
				+ ticket_price
				+ '</div><figcaption class="media-body"><h6 class="title text-truncate">'
				+ ticket_name + ' - ' + ticket_type + ' ' + ticket_age 
				+ '</h6></figcaption></figure></td><td class="text-center"><div class="m-btn-group m-btn-group--pill btn-group mr-2"role="group" aria-label="..."><button type="button" class="m-btn btn btn-default"><i class="fa fa-minus"></i></button><button type="button" class="m-btn btn btn-default" disabled><i class="number">1</i></button><button type="button" class="m-btn btn btn-default"><i class="fa fa-plus"></i></button></div></td><td><div class="price-wrap" display=""><var class="price">'
				+ putComma(ticket_price)
				+ '</var>원</div></td><td class="text-right"><a href="#"class="btn btn-outline-danger del-ticket"> X</a></td></tr>'
				
			ticketCart.append(carts);
			total += parseInt(ticket_price);
// 			total = putComma(total);
// 			$("#total").text(total + "원");
		}
		calTax();
	});
	
$(document).on('click', '.btn-default', function() {
	let butclass = $(this).find('i').attr("class");
	let trid = $(this).parents("tr").attr("id");
	let QTY = $(this).parents("tr").find(".number").text();
	let priced = parseInt($(this).parents("tr").find(".hprice").text());
	let price = parseInt(deleteComma($(this).parents("tr").find(".price").text()));
	if(total != 0 ){
		total = parseInt(deleteComma(total));
	}
	if (butclass.includes("fa-plus")) {
		QTY++;
		price += priced
		$(this).parents("tr").find(".number").text(QTY);
		price = putComma(price);
		$(this).parents("tr").find(".price").text(price);
		/* 순수 총 계산금액 */
		total += parseInt(priced);
// 		$("#total").text(total + "원");
	} else if (butclass.includes("fa-minus")) {
		if (QTY <= 1) {
			return
		}
		price -= priced
		QTY--;
		$(this).parents("tr").find(".number").text(QTY);
		price = putComma(price);
		$(this).parents("tr").find(".price").text(price);
		/* 순수 총 계산금액 */
		total -= parseInt(priced);
// 		$("#total").text(total + "원");
	}
	calTax();
})
	
$(document).on('click', '.del-ticket', function() {
	let reprice = $(this).parents("tr").find(".price").text();
	reprice = parseInt(deleteComma(reprice));
	if(total != 0 ){
		total = parseInt(deleteComma(total));
	}
	total -= reprice;
	console.log("tax ? " + total * 0.1);
	
	calTax();
	
	$(this).parents("tr").remove();
})
	
let calTax = function(){
	if(total != 0 ){
		total = parseInt(deleteComma(total+""));
	}
	let tax = putComma(total * 0.1);
	let subtotal = putComma(total * 0.9);
	if(total != 0) {
		total = putComma(total);
	}else{
		tax = 0;
		subtotal = 0;
	}
	$("#tax").text(tax + "원");
	$("#m-tax").text(tax + "원");
	$("#subtotal").text(subtotal + "원");
	$("#m-subtotal").text(subtotal + "원");
	console.log("total : "+total);
	$("#total").text(total + "원");
	$("#m-total").text(total + "원");
}
</script>
	<!-- modal click events -->
	<script type="text/javascript">
let tbl_addr = $("#after-first-pay");
let saleYNprice = 0;
$(document).on('click','#charge',function(){
	$("#payPage").modal("show");
// 	$("ticketOrders")
	
	let trs = $("#ticketCart").find("tr");
	$(tbl_addr).empty();
	$(trs).each(function(i, tr){
		let ticket_id = $(tr).attr("id");
		let cnt = $(tr).find(".number").text();
		let name = $(tr).find(".title").text();
		let saleyn = $(tr).data("saleyn");
		if(saleyn == "Y"){
			let price = $(tr).find(".price").text();
			saleYNprice += parseInt(deleteComma(price));
		}
		let code = '<tr id="'+ ticket_id +'" data-saleYN="'+ saleyn +'"><td class="ticket_name">'+ name +'</td><td class="ticket_cnt" data-cnt="'+cnt+'">'+ cnt +'장</td></tr>';
		$(tbl_addr).append(code);
	});
	
	if(saleYNprice == 0){
		saleYNprice = -1;
	}
	if(saleYNprice < 0){
		$("#saleList-btn").attr("disabled", true);
	}else{
		$("#saleList-btn").attr("disabled", false);
	}
	$("label[for='PTM']").text(total);
	var originalprice = parseInt($('lable[for="PTM"]').text());
});

$(document).on('click','#PMC',function(){
	$('#payPage').modal("hide");
});

$(document).on("hide", "#payPage", function(){
	total = 0;
	saleYNprice = 0;
});



</script>


	<!-- 할인 리스트를 출력해줄 modal -->
	<script type="text/javascript">
async function salepick(salesHTML){  
const { value: formValues} = await Swal.fire({
	  title: '할인',
	  html: salesHTML
	    ,
	   
	  focusConfirm: false,
	  preConfirm: () => {
	    return [
	      $('#swal-input1 option:selected').data("name"),
	      $("#swal-input1 option:selected").attr("name"),
	      $("#swal-input1 option:selected").val()
	      
	    ]
	  }
	})
		if (formValues && formValues[0] != "할인카드 선택..") {
		  $('#SLPN').text(formValues[0]);
// 		  let oriprice = parseInt($('label[for="PTM"]').text());
		  let salepercent = parseInt(formValues[1]);
// 		  saleYNprice == parseInt(deleteComma(saleYNprice));
		  let saleprice = saleYNprice * (1 - (salepercent * 0.01));
		  saleprice = Math.ceil(saleprice);
		  console.log("saleYNprice");
		  console.log(saleYNprice);
		  let calSale = putComma(saleYNprice-saleprice);
		  $('#SLPP').text(calSale+"원");
		  $('#SLPN').append(" ("+salepercent+"%)")
		  $('label[for="PTM"]').text(putComma(saleprice));
		  $("#ticketOrders input[name='sale_id']").val(formValues[2]);
		}
	}
</script>

	<!-- 할인 리스트 출력 -->
	<script type="text/javascript">

$(document).on("click",'#saleList-btn',function(){
	// salesHTML에는 ajax로 불러온 할인목록을 option으로 작성한다
	
	$.ajax({
		url : "${WCP}/ticketoffice/getsales",
		type : "post",
		dataType : "json",
		success : function(data) {
			console.log(data)
			var salesHTML = '<select id="swal-input1" class="form-select" aria-label="Default select example"> '
			salesHTML += '<option selected>할인카드 선택..</option>';
			for(let i in data){
				salesHTML += '<option name="'+data[i].sale_percent+'" value="'+data[i].sale_id+'" data-name= "'+data[i].sale_name+'">'+data[i].sale_name+'</option>';
			}	
			salesHTML += '</select>';
			salepick(salesHTML);	
		},
		error : function(xhr, status) {
			console.log(xhr);
			console.log(status);
		}

	});
});
</script>
	<!-- 할인 리스트 출력끝 -->
	<!-- 포켓코인만들기 -->
	<script type="text/javascript">
var generateQRCode = function(i, resInfo) {
    var url = "${WCP}/poket/qrcodecreate";
//     //포켓코인 아이디
//     var pocketid = document.getElementById("pocketid").value;
//     //예매 상세 일련 번호
//     var info_no = document.getElementById("info_no").value;
//     //발급 일시
//     var coin_start = document.getElementById("coin_start").value;
//     //퇴장일시
//     var coin_end = document.getElementById("coin_end").value;
//     let createCode = new Date();
     var imgObj = document.getElementById("qrcode_img["+i+"]");

     url += "?pocketid=" + resInfo.coinList[0].coin_code;
//        		+ "&coin_start=" + createCode;
//             url += "?pocketid=" + pocketid + "&info_no=" + info_no
//             		+ "&coin_start=" + coin_start + "&coin_end=" + coin_end;
     imgObj.src = url;

}



// 특정 div 지정해서 html로 뺀 후 출력
function content_print(){
    
	  var divToPrint=document.getElementById('backqr');
	  var newWin=window.open('','Print-Window');
	  newWin.document.open();
	  newWin.document.write('<html><head><style>#backqr{	position: relative;  	top: 0;  	left: 0;} .qr-bangle{  position: relative;  top: 30px;  left: 30px;  border: 1px green solid;  height: 100px;} .qrcode-img{  position: relative;  top: -72px;  left: 313px;  border: 1px green solid;}</style></head>');
	  newWin.document.write('<body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');
	  newWin.document.close();
	  setTimeout(function(){newWin.close();},10);
    
}          


let idAndCnt = $("#idAndCnt");
// 기존 모달 닫고 출력모달띄우기
// 최종 결제
$(document).on("click","#card-orderBtn",function(){
	let payAmount = $(".PTM label[for='PTM']").text();
	payAmount = deleteComma(payAmount);
	$("#ticketOrders").find("input[name='pay_amount']").val(payAmount);
	$("#ticketOrders").find("input[name='pay_method']").val("card");
	
	putAtidAndCnt();
	
	let timerInterval
	Swal.fire({
	  title: '카드사에 승인 요청 중입니다.',
	  html: '',
	  timer: 2000,
	  timerProgressBar: true,
	  didOpen: () => {
	    Swal.showLoading()
	    timerInterval = setInterval(() => {
	      const content = Swal.getHtmlContainer()
	      if (content) {
	        const b = content.querySelector('b')
	        if (b) {
	          b.textContent = Swal.getTimerLeft()
	        }
	      }
	    }, 100)
	  },
	  willClose: () => {
	    clearInterval(timerInterval)
	  }
	}).then((result) => {
	  /* Read more about handling dismissals below */
	  if (result.dismiss === Swal.DismissReason.timer) {
		 test();
	  }
	})
	

	
// 	$('#payPage').modal("hide");
// 	$("#exampleModal2").modal("show");
// 	generateQRCode();

})
let cashArea = $("#cash-Area");
$(document).on("click", "#final-cash-btn", function(){
	let payAmount = $(".PTM label[for='PTM']").text();
	payAmount = deleteComma(payAmount);
	let getPrice = $(getFromCustomer).val();
	getPrice = deleteComma(getPrice);
	let exchange = $("#exchange-amount").val();
	exchange = deleteComma(exchange);
	if(exchange < 0){
		Swal.fire("결제 금액이 부족합니다.");
		return;
	}
	$(cashArea).empty();
	$(cashArea).append(
			$("<input>").attr({"type" : "hidden", "name" : "RMList[0].lrm_code"}).val("GT")
			, $("<input>").attr({"type" : "hidden", "name" : "RMList[0].rm_amount"}).val(getPrice)
			, $("<input>").attr({"type" : "hidden", "name" : "RMList[1].lrm_code"}).val("CH")
			, $("<input>").attr({"type" : "hidden", "name" : "RMList[1].rm_amount"}).val(exchange)
			);
	
	$("#ticketOrders").find("input[name='pay_amount']").val(payAmount);
	$("#ticketOrders").find("input[name='pay_method']").val("cash");
	putAtidAndCnt();
	
	let timerInterval
	Swal.fire({
	  title: '결제 중입니다. 잠시만 기다려주세요.',
	  html: '',
	  timer: 2000,
	  timerProgressBar: true,
	  didOpen: () => {
	    Swal.showLoading()
	    timerInterval = setInterval(() => {
	      const content = Swal.getHtmlContainer()
	      if (content) {
	        const b = content.querySelector('b')
	        if (b) {
	          b.textContent = Swal.getTimerLeft()
	        }
	      }
	    }, 100)
	  },
	  willClose: () => {
	    clearInterval(timerInterval)
	  }
	}).then((result) => {
	  /* Read more about handling dismissals below */
	  if (result.dismiss === Swal.DismissReason.timer) {
		 test();
	  }
	})
})

//현금 결제 버튼 눌렀을 때
$(document).on("click", "#cash-orderBtn", function(){
	let ptm = $("label[for='PTM']").text();
	console.log("ptm : " + ptm);
	$("#final-amount").val(ptm);
	$("#payPage").modal("hide");
	

	let price = $(".price-monitor").eq(1).val();
	console.log("price : " + price);
	putCommaProcess($("#final-amount"));
	$("#cash-modal").modal("show");
});

// 현금결제 모달이 사라지면 안의 값을 0으로 만들어준다. ??
$(document).on("hide", "#cash-modal", function(event){
	event.preventDefault();
	$("#reset-number").click();
	$(this).modal("hide");
});
let getFromCustomer = null;

//현금 결제 숫자 버튼 눌렀을 때
$(document).on("click", ".cal-btn", function(){
	let number = $(this).val();
	getFromCustomer = $(this).parents(".modal").find("#get-from-customer");
	console.log(getFromCustomer);
	let modalID = $(this).parents(".modal").attr("id");
	let fromCustomer = $(getFromCustomer).val();
	console.log("number : " + number + " getFromCustomer : " + getFromCustomer + " modalID : " + modalID);
	console.log(fromCustomer);
	if(fromCustomer.length >= 9){
		return;
	}
	
	if(fromCustomer.substring(0,1) == "0"){
		fromCustomer = fromCustomer.substring(1);
	}
	
	fromCustomer = fromCustomer + number;
	console.log("fromCustomer : " + fromCustomer);
	getFromCustomer.val(fromCustomer);
	putCommaProcess(getFromCustomer);	// 받은 금액 콤마 붙여주는 과정
	if(modalID == "cash-modal"){
		minusAmount();
	}else{
		plusAmount();
	}
});

$(document).on("keyup", "#get-from-customer", function(){
	console.log("keyup 이벤트 진입");
	let modalID = $(this).parents(".modal").attr("id");
	if(modalID == "cash-modal"){
		minusAmount();
	}else{
		plusAmount();
	}
});

// 포켓 코인 충전 -  손님한테 받은 돈을 잔액과 합산
function plusAmount(){
	let priceFromCustomer = getFromCustomer.val();
	let deleteComPrice = deleteComma(priceFromCustomer);
	let remainAmount = $("#remain-amount").val();
	let deleteComRemain = deleteComma(remainAmount);
	
	let afterCharge = parseInt(deleteComPrice) + parseInt(deleteComRemain);
	let putComAfter = putComma(afterCharge);
	putComAfter  = putComAfter + "";
	if(putComAfter.indexOf("-") == 0){
		putComAfter = "-" + putComAfter.replace(/[-]/gi,'');
	}
	console.log("- putComAfter : " + putComAfter);
	$("#after-charge").val(putComAfter);
}

// 손님한테 받은 금액에서 결제 금액을 계산해서 거스름돈 구하는 과정
function minusAmount(){
	let priceFromCustomer = getFromCustomer.val();
	let deleteComPrice = deleteComma(priceFromCustomer);
	let finalAmount = $("#final-amount").val();
	let deleteComFinal = deleteComma(finalAmount);
	
	let exchange = parseInt(deleteComPrice) - parseInt(deleteComFinal);
	console.log("exchange : " + exchange + " type : " + typeof(exchange));
	let putComExchange = putComma(exchange);
	putComExchange = putComExchange + ""; 
	console.log("putcomExchange 타입 : " + typeof(putComExchange));
	console.log("putComExchange : " + putComExchange);
	if(putComExchange.indexOf("-") == 0){
		putComExchange = "-" + putComExchange.replace(/[-]/gi,'');
	}
	console.log("- putComExchange : " + putComExchange);
	$("#exchange-amount").val(putComExchange);
};



// 받은 금액 숫자 삭제하는 버튼
$(document).on("click", "#del-number", function(){
	let priceFromCustomer = getFromCustomer.val();
	priceFromCustomer = priceFromCustomer.substring(0, priceFromCustomer.length - 1);
	priceFromCustomer = deleteComma(priceFromCustomer);
	priceFromCustomer = putComma(priceFromCustomer);
	getFromCustomer.val(priceFromCustomer);
	minusAmount();
	
});

// 받은 금액 초기화
$(document).on("click", "#reset-number", function(){
	getFromCustomer.val("0");
	let modalID = $(this).parents(".modal").attr("id");
	if(modalID == "coin-modal"){
		$("#after-charge").val(pocketRemain);		
	}else{
		$("#exchange-amount").val("0");
	}
	
});

let putAtidAndCnt = function(){
	idAndCnt.empty();
	
	let trs = $(tbl_addr).find("tr");
	let code = '';
	$(trs).each(function(i, tr){
		let ticket_id = $(this).attr("id");
		let ticket_cnt = $(this).find(".ticket_cnt").data("cnt");
		code += '<input type="text" name="ticketListForRes['+ i +'].ticket_id" value="'+ ticket_id +'" />';
		code += '<input type="text" name="ticketListForRes['+ i +'].ticket_cnt" value="'+ ticket_cnt +'" />';
		
	});
	
	idAndCnt.html(code);
}

function test(){$.ajax({
	url: $("#ticketOrders").attr("action"),
	method: $("#ticketOrders").attr("method"),
	data: $("#ticketOrders").serialize(),
	dataType:"json",
	success:function(resp){
		
		if(resp.result == "NOTEXIST"){
			Swal.fire("잘못된 이용권입니다.\n다시 한 번 시도해주세요.");
		}else if(resp.result == "MIXEDTICKET"){
			Swal.fire("연간 이용권은 단독으로만 예매할 수 있습니다.");
		}else if(resp.result == "NEEDONLYONE"){
			Swal.fire("연간 이용권은 1장만 예매할 수 있습니다.");
		}else if(resp.result == "NOTALLOWED"){
			Swal.fire("비회원은 연간 이용권을 예매할 수 없습니다.");
		}else if(resp.result == "ALREADYHAVE"){
			Swal.fire("이미 연간 이용권을 소지하고 있습니다.");
		}else if(resp.result == "SUCCESS"){
			emptyProcess();
// 			Swal.fire("성공!");
			$("#cash-modal").modal("hide");
			selectResInfocode(resp.res_code)
		}else{
			Swal.fire("서버의 문제로 진행할 수 없습니다.\n잠시 후에 시도해주세요.");
		}
		
	}, error: function(xhr, error, msg){
		console.log(xhr);
		console.log(error);
		console.log(msg);
	}
});}

let emptyProcess = function(){
	$("#cancle").click();
	$("#SLPN").text("");
	$("#SLPP").text("0원");
	$(ticketCart).empty();
	$(idAndCnt).empty();
	$(cashArea).empty();
	$("#total").text("0원");
	$("#tax").text("0원");
	$("#subtotal").text("0원");
	$("label[for='PTM']").text("0");
};

var WCP = "${WCP}";

// coin_code 생성해서 출력까지 딱 띄워주는거
var selectResInfocode = function(res_code){
	$.ajax({
		url : WCP+"/emp/ticketOffice/resInfoCode",
		method : "post",
		data : {"res_code" : res_code},
		dataType : "json",
		success : function(resp) {
			if(resp.result == "SUCCESS"){
				$("#backqr").empty();
				let code = "";
				$(resp.resInfoList).each(function(i, resInfo){
					code = '<img class="qr-bangle"  id="qrfront_img['+i+']" src="${WCP}/resources/emp-img/Infra_Blueone_main.png">     ';
			    	code += '<img class="qrcode-img" id="qrcode_img['+i+']" style="display:none" onload="this.style.display=\'block\'"> <br/>   ';
					$("#backqr").append(code);
					console.log("qr 생성 전 code" + resInfo.coinList[0].coin_code)
				 	generateQRCode(i, resInfo);
				});
			$('#payPage').modal("hide");
		 	$("#exampleModal2").modal("show");
			}
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
		}

	});
}

let pocketCode = null;
let pocketRemain = null;
let pocketQRRead = function(qr){
	$.ajax({
		url : WCP+"/emp/ticketOffice/pocketQRRead",
		method:"post",
		data : qr,
		dataType : "json",
		success : function(resp) {
			$("#qr-print-btn").attr("disabled", false);
			let remainCoin = resp.remainCoin;
			console.log("remainCoin");
			console.log(remainCoin);
			$("#qr-coin-start").text(remainCoin.coin_start);
			$("#qr-coin-end").text(remainCoin.coin_end);
			let remain = putComma(remainCoin.coin_remain+"");
			pocketRemain = remain;
			// 왜 undefined가 뜨냐...왜
			console.log("remain");
			console.log(typeof(remain));
			console.log(remain);
			remain += "원";
			console.log(remain);
			$("#qr-coin-remain").text(remain);
			pocketCode = remainCoin.coin_code;
			},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
		}

	});
}

// 예매 내역 qr code 찍으면 정보 가져오기
let reserveQRRead = function(qr){
	$.ajax({
		url : WCP + "/emp/ticketOffice/QRRead",
		method:"post",
		data : qr,
		dataType : "json",
		success : function(resp) {
			if(resp.result == "FAIL"){
				Swal.fire({
					  icon: 'error',
					  title: '시스템 오류!',
					  text: '잠시 후에 시도해주세요.',
					})
			}else{
				let allReserve = resp.allReserve;
				coinForReserve = allReserve;
				console.log("allReserve : " + allReserve);
				let cancel = "";
				if(allReserve.res_cancel == null){
					cancel = "-";
				}else{
					cancel = allReserve.res_cancel;
				}
				
				let num = 1;
				$("#qr-print-btn").attr("disabled", false);
				$(allReserve.resInfoList).each(function(i, res){
					console.log("for문 진입");
					console.log("coinList : " + res.coinList);
					let coinList = res.coinList;
					$(coinList).each(function(idx, coin){
						let coin_code = "";
						let coin_start = "";
						if(coin.coin_code != null){
							coin_code = coin.coin_code;
							coin_start = coin.coin_start;
						}else{
							coin_code = "미발급";
							coin_start = "-";
						}
						console.log(num + " : " + coin_code);
						$("#outputData table tbody").append($("<tr>").append(
								$("<td>").text(num),
								$("<td>").text(res.res_info_code),
								$("<td>").text(res.ticket.ticket_name + " " + res.ticket.ticket_type_name + "["+ res.ticket.ticket_age_name+"]" ),
								$("<td>").text(coin_code),
								$("<td>").text(coin_start)
								)
						);
						num++;
					});
				})
				$("#qr-res-date").text(allReserve.res_date);
				$("#qr-res-predate").text(allReserve.res_predate);
				$("#qr-res-cancel").text(cancel);
			}
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
		}

	});
}

let coinForReserve = null;

$(document).on("click", "#qr-print-btn", function(){
	let type = $(this).data("type");
	console.log("qr-print-btn 누름 type : " + type);
	if(type == "print"){
		let res_code = coinForReserve.res_code;
		console.log("coin : " + coinForReserve.resInfoList[0].coinList);
		$(this).parents(".modal").modal("hide");
		if(coinForReserve.resInfoList[0].coinList[0].coin_code == null){	// coin_code가 없으면 coin_code를 생성시켜 출력해줘야함
			selectResInfocode(res_code);
		}else if(coinForReserve.resInfoList[0].ticket.ticket_grp == "YR" && coinForReserve.resInfoList[0].coinList != null){
			selectResInfocode(res_code);
		}else{ //coin이 null이 아니라면 select해와서 다시 띄워줘야한다.
			coinCodeAgain(coinForReserve);
		}
	}else if(type == "coin"){
		$(this).parents(".modal").modal("hide");
		coinCharge();
	}else {
		console.log("퇴장 처리해야함");
		exitCoin();
	}
	
	
});

let exitCoin = function(){
	Swal.fire({
		  title: '퇴장 처리를 진행합니다',
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '확인',
		  cancelButtonText: '확인'
		}).then((result) => {
		  if (result.isConfirmed) {
			  $.ajax({
					url : WCP + "/emp/ticketOffice/coinEnd",
					method : "post",
					data : {
						"_method" : "put",
						"coin_code" : pocketCode
						},
					dataType : "json",
					success : function(resp) {
						if(resp.result == "SUCCESS"){
							$("#qr-coin-end").text(resp.coin.coin_end);
							setTimeout(function(){
								$("#reserveModal").modal("hide");
								$("#exit-success-modal").modal("show");
							})
						}else{
							Swal.fire({
								  icon: 'error',
								  title: '현제 퇴장 처리를 할 수 없습니다.',
								  text: resp.message
								})
						}
					},
					error : function(xhr, error, msg) {
						console.log(xhr);
						console.log(error);
						console.log(msg);
					}

				});
		    
		  }else{
			  swalWithBootstrapButtons.fire(
			      '취소!',
			      '퇴장 처리를 취소합니다.',
			      'error'
			    )
		  }
		})
};


let coinCharge = function(){
	$("#remain-amount").val(pocketRemain);
	$("#coin-modal").modal("show");
};

let coinCodeAgain = function(coinForReserve){
	let resInfoList = coinForReserve.resInfoList;
	console.log(resInfoList);
	$("#backqr").empty();
	$(resInfoList).each(function(i, resInfo){
		code = '<img class="qr-bangle"  id="qrfront_img['+i+']" src="${WCP}/resources/emp-img/Infra_Blueone_main.png">     ';
    	code += '<img class="qrcode-img" id="qrcode_img['+i+']" style="display:none" onload="this.style.display=\'block\'"> <br/>   ';
		$("#backqr").append(code);
		console.log("qr 생성 전 code" + resInfo.coinList[0].coin_code)
	 	generateQRCode(i, resInfo);
	});
	$("#exampleModal2").modal("show");
	
}
//프린트 버튼 클릭시 프린트 함수 불러오기
$(document).on("click","#printing",function(){
	content_print();
})

$(document).on("click", "#final-charge-btn", function(){
	console.log("pocketCoin 충전 code : " + pocketCode);
	let chargePrice = $(getFromCustomer).val();
	if(chargePrice == 0 || chargePrice == "0"){
		Swal.fire("충전할 금액을 입력해주세요.");
		return;
	}
	let thisModal = $(this).parents(".modal");
	chargePrice = deleteComma(chargePrice);
	$.ajax({
		url : WCP + "/emp/ticketOffice/chargeCode",
		method : "post",
		data : {
			"coin_code" : pocketCode,
			"coin_charge_amount" : chargePrice,
			"coin_charge_state" : "CC"
			},
		dataType : "json",
		success : function(resp) {
			if(resp.result == "SUCCESS"){
				Swal.fire("성공!");
				$("#reset-number").click();
				thisModal.modal("hide");
			}else{
				Swal.fire({
					  icon: 'error',
					  title: '포켓코인을 충전할 수 없습니다.',
					  text: resp.message
					})
			}
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
		}

	});
	
});


$(document).on("click", "#cancle", function(){
	let trs = $("#ticketCart").find("tr");
	$(trs).each(function(i, tr){
		$(tr).find(".del-ticket").click();
	});
});

// 포켓 코인 프린트 모달 닫기 클릭 -> 이미 결제한 내역 지우기
$(document).on("click", ".btn-close", function(){
	$(ticketCart).empty();
	$(idAndCnt).empty();
	$(this).parents(".modal").modal("hide");
});

</script>
	<script type="text/javascript">
/* 환불페이지 모달
	
*/
$(document).on("click","#refund",function(){
// 	$("#exit-success-modal").modal("show");
// 	$("#payCanclePage").modal("show");	// 원래 환불 모달

	$("#outputData table").empty();
	$("#outputMessage").text("퇴장");
	$("#outputData table").append($("<thead>").append(
			$("<tr>").append(
					$("<td>").text("발급 일자"),
					$("<td>").attr("id" , "qr-coin-start")
					),
			$("<tr>").append(
					$("<td>").text("퇴장 일시"),
					$("<td>").attr("id" , "qr-coin-end")
					),
			$("<tr>").append(
					$("<td>").text("잔여 금액"),
					$("<td>").attr("id" , "qr-coin-remain")
					)
			),
			$("<tbody>"));
	$("#qr-print-btn").data("type", "exit").text("퇴장");
	scannerToggle = true;
	$("#reserveModal").modal("show");
	

})
$(document).on("click","#PMLC",function(){
	$("#payCanclePage").modal("hide");
})
/* 환불 모달끝 */
</script>
	<!-- 영수증 출력 여기에 넣으심됩니더-->
	<script type="text/javascript">

	$(document).on("click","#receiptBTN",function(){
		let res_code = $("#res_code_data").text();
		let totalPrice = $(".PTML").text();
		let emp_name = "${EmpVO.emp_name }";
		let res_qty = $("#res_qty_data").text();
		let currentDate = new Date();
	 	let write_date = '';
	 	write_date += currentDate.getFullYear() +'년';
	 	write_date += currentDate.getMonth() + 1+'월';
	 	write_date += currentDate.getDate()+'일';
		$("#t1").val(res_code);
		$("#t2").val(totalPrice);
		$("#t3").val(emp_name);
		$("#t4").val(res_qty);
		$("#t5").val(write_date);
		 window.open("", "popup_window", "width=520, height=530, scrollbars=no");
		 $("#myreceipt").submit();
	})


</script>
	<!-- 영수증 출력 -->

	<!-- qr코드 읽는 알고리즘 (건들ㄴㄴ)-->
	<script type="text/javascript" src="${WCP}/resources/js/jsQR.js"></script>
	<!-- qr코드 읽는 자바스크립트(여기를 수정하시면됩니다) -->
	<script type="text/javascript"
		src="${WCP }/resources/emp-js/reserveScanner.js"></script>
	<!-- 예약내역 조회 -->
	<script type="text/javascript">

	$(document).on("click","#reservView",function(){
		$("#outputData table").empty();
		$("#outputMessage").text("예매내역");
		$("#outputData table").append($("<thead>").append(
				$("<tr>").append(
						$("<td>").attr("colspan", 2).text("예매 일자"),
						$("<td>").attr({"colspan" : 2, "id" : "qr-res-date"}),
						),
				$("<tr>").append(
						$("<td>").attr("colspan", 2).text("방문 예정일"),
						$("<td>").attr({"colspan" : 2, "id" : "qr-res-predate"}),
						),
				$("<tr>").append(
						$("<td>").attr("colspan", 2).text("환불 일자"),
						$("<td>").attr({"colspan" : 2, "id" : "qr-res-cancel"}),
						),
				$("<tr>").append(
						$("<th>").text("No."),
						$("<th>").text("예매 상세 번호"),
						$("<th>").text("이용권"),
						$("<th>").text("포켓코인 발급"),
						$("<th>").text("포켓코인 발급 일시")
						)
				),
				$("<tbody>"));
		$("#qr-print-btn").data("type", "print").text("출력");
		scannerToggle = true;
		$("#reserveModal").modal("show");
	})
	
	// pocket Coin 충전
	$(document).on("click", "#coin-charge-btn", function(){
		$("#outputData table").empty();
		$("#outputMessage").text("포켓 코인 조회");
		$("#outputData table").append($("<thead>").append(
				$("<tr>").append(
						$("<td>").text("발급 일자"),
						$("<td>").attr("id" , "qr-coin-start")
						),
				$("<tr>").append(
						$("<td>").text("퇴장 일시"),
						$("<td>").attr("id" , "qr-coin-end")
						),
				$("<tr>").append(
						$("<td>").text("잔여 금액"),
						$("<td>").attr("id" , "qr-coin-remain")
						)
				),
				$("<tbody>"));
		$("#qr-print-btn").data("type", "coin").text("충전");
		scannerToggle = true;
		$("#reserveModal").modal("show");
	});
	
	$(document).on("click","#closemodal",function(){
		scannerToggle = false;
		$("#reserveModal").modal("hide");
	})
	
	$(".modal").on("hide.bs.modal", function(){
		let modalID = $(this).attr("id");
		if(modalID == "cash-modal" || modalID == "coin-modal"){
			$("#qr-print-btn").attr("disabled", true);
		}
	});
</script>
	<script type="text/javascript">
<!-- qr찍으면 있는 qr데이터를 넘길 ajax -->
function reserveDataSend() {
	$.ajax({
		url : "",
		type : "",
		data : "",
		dataType : "",
		success : function(data) {

		},
		error : function(xhr, status) {
			console.log(xhr);
			console.log(status);
		}

	});	
}
</script>
</body>
</html>