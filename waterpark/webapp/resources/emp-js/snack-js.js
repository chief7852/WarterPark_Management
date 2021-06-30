/**
 * <pre>
 * </pre>
 * 
 * @author 작성자명
 * @since 2021. 5. 25.
 * @version 1.0
 * 
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25.      정이삭       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

var goFS = document.getElementById("goFS");
goFS.addEventListener("click", function() {
	toggleFullScreen()
//	document.body.requestFullscreen();

}, false);

function toggleFullScreen() {
	  if (!document.fullscreenElement &&    // alternative standard method
	      !document.mozFullScreenElement && !document.webkitFullscreenElement) {  // current working methods
	    if (document.documentElement.requestFullscreen) {
	      document.documentElement.requestFullscreen();
	    } else if (document.documentElement.mozRequestFullScreen) {
	      document.documentElement.mozRequestFullScreen();
	    } else if (document.documentElement.webkitRequestFullscreen) {
	      document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
	    }
	  } else {
	    if (document.cancelFullScreen) {
	      document.cancelFullScreen();
	    } else if (document.mozCancelFullScreen) {
	      document.mozCancelFullScreen();
	    } else if (document.webkitCancelFullScreen) {
	      document.webkitCancelFullScreen();
	    }
	  }
	}
$("backdrop").css("background", "blue");
/* alert창 */
function alerted(message) {
		Swal.fire(
			message
		)
}

var testing = function alertYN(){
	Swal.fire({
		  title: '보류하시겠습니까?',
		  text: '현재 상품목록이 사라질수 있습니다 정말 불러오실건가요?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    )
		    temp();
		  }else{
			  return;
		  }
		})
}
/* 상품추가 */
$(document)
		.on(
				"click",
				'.float-right',
				function() {
					let prodName = $(this).find('.nhidden').text();
					let prodPrice = parseInt(deleteComma($(this).find('.phidden').text()));
					let prodlp = $(this).find('.fhidden').text();
					let prod_photo = $(this).parents('.card-product').find(".prod-img").attr("src");
					if (document.getElementById(prodlp)) {
						let QTY = $("#" + prodlp).find(".number").text();
						if (QTY >= 10) {
							return
						}
						QTY++;
						$("#" + prodlp).find(".number").text(QTY);
						let price = parseInt(deleteComma($("#" + prodlp).find(".price")
								.text()));
						price = price + prodPrice;
						$("#" + prodlp).find(".price").text(putComma(price));
						/* 순수 총 계산금액 */
						total += parseInt(prodPrice);
						$("#tax").text(putComma(total * 0.1) + "원");
						$("#subtotal").text(putComma(total * 0.9) + "원");
						$("#total").text(putComma(total) + "원");
					} else {
						let carts = '<tr id='
								+ prodlp
								+ '><td><figure class="media"><div class="hprice" hidden>'
								+ putComma(prodPrice)
								+ '</div><div class="img-wrap"><img src="'+prod_photo+'"class="img-thumbnail img-xs"></div><figcaption class="media-body"><h6 class="title text-truncate">'
								+ prodName
								+ '</h6></figcaption></figure></td><td class="text-center"><div class="m-btn-group m-btn-group--pill btn-group mr-2"role="group" aria-label="..."><button type="button" class="m-btn btn btn-default"><i class="fa fa-minus"></i></button><button type="button" class="m-btn btn btn-default" disabled><i class="number">1</i></button><button type="button" class="m-btn btn btn-default"><i class="fa fa-plus"></i></button></div></td><td><div class="price-wrap" display=""><var class="price">'
								+ putComma(prodPrice)
								+ '</var>원</div></td><td class="text-right"><a href="#"class="btn btn-outline-danger"> X</a></td></tr>'
						$("#prodCart").append(carts).focus();
						/* 순수 총 계산금액 */
						total += parseInt(prodPrice);
						$("#tax").text(putComma(total * 0.1) + "원");
						$("#subtotal").text(putComma(total * 0.9) + "원");
						$("#total").text(putComma(total) + "원");
					}
				})

/* 수량변동밑 상품마다 계산 */
$(document).on('click', '.btn-default', function() {
	let butclass = $(this).find('i').attr("class");
	let trid = $(this).parents("tr").attr("id");
	let QTY = $(this).parents("tr").find(".number").text();
	let priced = parseInt(deleteComma(($(this).parents("tr").find(".hprice").text())));
	let price = parseInt(deleteComma($(this).parents("tr").find(".price").text()));
	if (butclass.includes("fa-plus")) {
		if (QTY >= 10) {
			return
		}
		QTY++;
		price += priced
		$(this).parents("tr").find(".number").text(QTY);
		$(this).parents("tr").find(".price").text(putComma(price));
		/* 순수 총 계산금액 */
		total += parseInt(priced);
		$("#tax").text(putComma(total * 0.1) + "원");
		$("#subtotal").text(putComma(total * 0.9) + "원");
		$("#total").text(putComma(total) + "원");
	} else if (butclass.includes("fa-minus")) {
		if (QTY <= 1) {
			return
		}
		price -= priced
		QTY--;
		$(this).parents("tr").find(".number").text(QTY);
		$(this).parents("tr").find(".price").text(putComma(price));
		/* 순수 총 계산금액 */
		total -= parseInt(priced);
		$("#tax").text(putComma(total * 0.1) + "원");
		$("#subtotal").text(putComma(total * 0.9) + "원");
		$("#total").text(putComma(total) + "원");

	}
})

/* 장바구니 취소 */
$(document).on('click', '.btn-outline-danger', function() {
	$(this).parents("tr").remove();
	let reprice = parseInt(deleteComma($(this).parents("tr").find(".price").text()));
	total -= reprice;
	$("#tax").text(putComma(total * 0.1 )+ "원");
	$("#subtotal").text(putComma(total * 0.9) + "원");
	$("#total").text(putComma(total) + "원");
})

total = 0;
$(function() {
	// The passed argument has to be at least a empty object or a object with
	// your desired options
	// $("body").overlayScrollbars({ });
	$("#items").height(552);
	$("#items").overlayScrollbars({
		overflowBehavior : {
			x : "hidden",
			y : "scroll"
		}
	});
	$("#cart").height(445);
	$("#cart").overlayScrollbars({});
	
	Swal.bindClickHandler()

	Swal.mixin({
	  toast: true,
	}).bindClickHandler('data-swal-toast-template')
	
});

/* boolean형태 전역변수선언(스캐너 db부담 줄이기) */
scannerToggle = false;

/* 취소 */
$(document).on("click","#cancle",function(){
	location.reload();
})


$(document).on("click","#pocket", function(){
        $("#outputMessage").text("포켓코인 정보");

        $("#exampleModal").modal("show");
})

$(document).on("click","#charge", function(){
		$("#outputMessage").text("결제내역");

//			$("#outputData").text()
        $("#exampleModal").modal("show");
		
})
/* 모달창 닫기 */   
$(document).on("click","#closemodal",function(){
	$("#exampleModal").modal("hide");
	
	
}) 
/* open감지이벤트 */
$('#exampleModal').on('show.bs.modal', function () {
		scannerToggle=true;
});
/* close이벤트 */
$('#exampleModal').on('hidden.bs.modal', function () {
		outputData.parentElement.hidden = true;
		scannerToggle = false;
		$("#payment").remove();
		$("#outputData").html("");
		$(".table-primary").remove();
		

		
});

function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('clock').innerHTML =
    h + "시" + m + "분" + s + "초";
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
    return i;
}



$(document).on("click","#refund", function(){
        $("#outputMessage").text("구매내역");

        $("#exampleModal").modal("show");
})


//마감
$(document).on('click','#deadlined',function(){
	let today = new Date();   

	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	let day = today.getDay();  // 요일
	let week = new Array("일","월","화","수","목","금","토");
	document.getElementById('Bday').innerHTML =
	year + "/" + month + "/" + date +" (" + week[day] + ")" 
	setInterval(function(){
		
		$('#deadline').find('h6').toggle();
		
	},1000)
	$("#deadline").modal("show");
//마감종료
})


