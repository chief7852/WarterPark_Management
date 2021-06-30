<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!--  [[개정이력(Modification Information)]]       -->
<!--  수정일        수정자     수정내용               -->
<!-- 	2021. 5. 26  -->
<!--  ==========   ======    ==============        -->
<!--  2021. 5. 25.}     정이삭     최초작성               -->
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
<link href="${WCP}/resources/emp-css/snack-css.css" type="text/css"
	rel="stylesheet" />
<!-- header -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gugi&family=Jua&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="${WCP }/resources/js/priceFormmating.js"></script>
 <style>
  	body{
		font-family: 'Jua', sans-serif;
		font-weight: 0;
		font-size: large;
  	}
  	dt{
  	font-weight: 0px !important;
  	}
  	.bg{
  		background-color: #E6E6E6 !important;
  	}
  	#items{
  		height: 675px !important;
  	}
  	.box{
  		height: 320px;
  	}
  </style>  

</head>
<body onload="startTime()">
<!-- 	<button id="goFS"> -->
<!-- 		<i class="bi bi-arrows-fullscreen"></i> -->
<!-- 	</button> -->


<c:if test='${ test == "test"}'>
</c:if>
<div class="all">

<jsp:include page="snackHead.jsp" flush="true"></jsp:include>
	<!-- ========================= SECTION CONTENT ========================= -->
	<section class="section-content padding-y-sm bg-default ">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8 card padding-y-sm card ">
					<ul id="categorys" class="nav bg radius nav-pills nav-fill mb-3 bg" role="tablist">
						<li class="nav-item"><a class="nav-link category active show"
							data-toggle="pill" id="ALL" href="#nav-tab-card"> <i
								class="fa fa-tags"></i> All
						</a></li>
						<li class="nav-item"><a class="nav-link category" id="PD"
							data-toggle="pill" href="#nav-tab-paypal"> <i
								class="fa fa-tags "></i> 상품
						</a></li>
						<li class="nav-item"><a class="nav-link category" id="FD"
							data-toggle="pill" href="#nav-tab-bank"> <i
								class="fa fa-tags "></i> 식품
						</a></li>
						<li class="nav-item"><a class="nav-link category" id="MN"
							data-toggle="pill" href="#nav-tab-bank"> <i
								class="fa fa-tags "></i> 메뉴
						</a></li>
						<li class="nav-item"><a class="nav-link category" id="RT"
							data-toggle="pill" href="#nav-tab-bank"> <i
								class="fa fa-tags "></i> 대여품
						</a></li>
					</ul>

					<span id="items">

						<div class="row" id="itemson">
							<c:forEach items="${prodList }" var="prod">

								<div class="col-md-3">
									<figure class="card card-product">
										<span class="badge-new">${prod.lprod_code }</span>
										<div class="img-wrap">
											<img class="prod-img"
												src="${WCP }${prod.prod_photo}"> <a
												class="btn-overlay" href="#"><i
												class="fa fa-search-plus">${prod.prod_name }</i> 상세보기 </a>
										</div>
										<figcaption class="info-wrap">
											<p class="title">${prod.prod_name }</p>
											<div class="action-wrap">
												<a href="#" class="btn btn-primary btn-sm float-right">
													<i class="fa fa-cart-plus">
														<div class="fhidden" hidden>${prod.lprod_code }</div>
														<div class="phidden" hidden>${prod.prod_price }</div>
														<div class="nhidden" hidden>${prod.prod_name }</div>
												</i> Add
												</a>
												<div class="price-wrap h5">
													<div class="price-new">${prod.prod_price }원</div>
												</div>
												<!-- price-wrap.// -->
											</div>
											<!-- action-wrap -->
										</figcaption>
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
								<tbody id="prodCart">
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
							<dd class="text-right">
								0%
							</dd>
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
								<a id="pocket"
									class="btn btn-block btn-outline-secondary btn-lg"> <i
									class="bi bi-upc-scan"></i> 포켓코인 조회
								</a>
							</div>
							<div class="col-md-6">
								<a id="save-cart" href="#"
									class="btn btn-block btn-outline-info btn-lg"> <c:choose>
										<c:when test="${not empty sessionScope.savecart}">
											<i class="bi bi-basket3-fill"></i>
										</c:when>
										<c:otherwise>
											<i class="bi bi-basket3"></i>
										</c:otherwise>
									</c:choose> 보류
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
									class="bi bi-cash-coin"></i> 환불 </a>
							</div>
							<div class="col-md-12">
								<a id="charge" href="#"
									class="btn btn-block btn-secondary btn-lg"><i
									class="fa fa-shopping-bag"></i> 결제 </a>
							</div>
						</div>
					</div>
					<!-- box.// -->
				</div>
			</div>
		</div>

<jsp:include page="snackModals.jsp" flush="true"></jsp:include>

		<!-- alert창 모음 -->
		<template id='my-template'> <swal-title>결제완료!</swal-title>
		</template>

		<button class='show-example-btn' data-swal-template='#my-template'
			hidden></button>

	</section>
	<!-- ========================= SECTION CONTENT END// ========================= -->
	<script src="${WCP}/resources/assets/js/jquery-2.0.0.min.js"
		type="text/javascript"></script>
	<script src="${WCP}/resources/assets/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	<script src="${WCP}/resources/assets/js/OverlayScrollbars.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${WCP }/resources/emp-js/snack-js.js"></script>
	<script type="text/javascript"
		src="${WCP }/resources/emp-js/snack-ajax.js"></script>
	<script type="text/javascript">

	WCP = '${WCP}';
	categoryArray(WCP);
	saveCart(WCP);
	function payedMent(coin_code){
		
		payCoinRead(WCP,coin_code);
	}
	function useList(coin_code) {
		coinUseList(WCP,coin_code);
	}
	detailRead(WCP);
	function buyprod(listMap){
		orderprod(WCP,listMap);
	}
	refundProd(WCP);
	salestoday(WCP);
	</script>




	<!-- 스캐너 생성 -->
	<script type="text/javascript"
		src="${WCP}/resources/common/scanner/scanner-js.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>

	<!-- <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script> -->

<!-- 다시로그인 -->
<script type="text/javascript">
$(document).on("click","#proLog",function(){
	$.ajax({
		url : "${WCP}/snack/relogin",
		type : "get",
		data : "text",
		dataType : "text",
		success : function(data) {
			
		},
		error : function(xhr, status) {
			console.log(xhr)
			console.log(status)
		}

	});
	window.location.href='${WCP}/emp/empLogin'
})

</script>
</div>
<c:if test='${ test == "test"}'>
</c:if>
</body>
</html>