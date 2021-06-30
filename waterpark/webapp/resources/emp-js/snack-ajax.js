/**
 * <pre>
 * 
 * </pre>
 * @author 작성자명
 * @since 2021. 6. 4.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 4.      정이삭       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */ 

// 상품불러와서 화면에 보여주기 위해
function categoryArray(WCP){
	$(".category").on('click',function(){
		let id = $(this).attr("id");

		let resultList = [];
		$.ajax({
			url : WCP+"/snack/category",
			type : "get",
			data : {"lprod_id" : id},
			dataType : "json",
			contentType: 'application/json',
			success : function(data) {
					$("#itemson").empty();
					let result = '';
				for(let i =0; i < data.length;i++){
					
					result +=  '<div class="col-md-3">'
							+'<figure class="card card-product">'
								+'<span class="badge-new"> '+data[i].lprod_code +'</span>'
								+'<div class="img-wrap" >'
								+'<img class="prod-img" src="'+WCP+data[i].prod_photo+'">'
								+'<a class="btn-overlay" href="#" ><i'
								+'	class="fa fa-search-plus">'+data[i].prod_name+'</i> 상세보기 </a>'
								+'</div>'
								+'<figcaption class="info-wrap">'
								+'<p class="title">'+data[i].prod_name+'</p>'
								+'<div class="action-wrap">'
								+'	<a href="#" class="btn btn-primary btn-sm float-right"> <i'
								+'			class="fa fa-cart-plus">'
								+'<div class="fhidden" hidden>'+data[i].lprod_code+'</div>'
								+'<div class="phidden" hidden>'+data[i].prod_price+'</div><div class="nhidden" hidden>'+data[i].prod_name+'</div></i> Add'
								+'		</a>'
								+'		<div class="price-wrap h5">'
								+'		<div class="price-new">'+data[i].prod_price+'원</div>'
								+'		</div>'
										<!-- price-wrap -->
										+'	</div>'
									<!-- action-wrap -->
									+'</figcaption>'
									+'</figure>'
							<!-- card // -->
							+'</div>';
							
				}
						$("#itemson").html(result);

			},
			error : function(xhr, status) {
				console.log(xhr);
				console.log(status);
			}

		});

	})
}

// 보류 로직
function saveCart(WCP){
	$(document).on("click","#save-cart",function(){
		let classval = $(this).find("i").attr("class");

			Swal.fire({
				  title: '보류하시겠습니까?',
				  text: '이미 보류가 있다면 현재 선택하 상품목록이 사라질수 있습니다!',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '확인',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.isConfirmed) {
				    Swal.fire(
				      '처리완료!',
				      '성공적으로 처리완료되었습니다.',
				      'success'
				    )
				    
				    temp();
				  }else{
					  return;
				  }
				})
		
		

var temp = function cartfun() {

		
		saveCart = $("#prodCart").html();
		$.ajax({
			url : WCP+"/snack/saveCart",
			type : "post",
			dataType : "json",
			data : {
						"savecart" : saveCart,
						"total" : total
					},
			success : function(data) {
				$("#prodCart").empty();
				total=0;
				$("#subtotal").text("0원");
				$("#total").text("0원");
				$("#tax").text("0원");
				if(data.result != null){/* session에 담았을때 */
					if(data.result == "저장됨"){
// 						$("#prodCart").empty();
						$(".bi-basket3").attr("class",'bi bi-basket3-fill');
// 						total=0;
// 						$("#subtotal").text("0원");
// 						$("#total").text("0원");
// 						$("#tax").text("0원");
					}else{/* 실패했을때 */
						$(".bi-basket3-fill").attr("class",'bi bi-basket3');
						Swal.fire({
							  icon: 'error',
							  title: 'Oops...',
							  text: '보류할 상품이 없습니다!',
						})
					}
				}else{
					$("#prodCart").html(data.saved);
					total = parseInt(data.totaled);
					$("#tax").text(putComma(total*0.1)+"원");
					$("#subtotal").text(putComma(total*0.9)+"원");
					$("#total").text(putComma(total)+"원");
					$(".bi-basket3-fill").attr("class",'bi bi-basket3');
				}
			},
			error : function(xhr, status) {
				console.log(xhr);
				console.log(status);
			}

		});
		
		}
	})
}

//포켓코인조회
function payCoinRead(WCP,coin_code){
	$.ajax({
		url : WCP+"/snack/payment/coin",
		type : "get",
		data : {"coin_id" : coin_code},
		dataType : "json",
		success : function(data) {

	let blcoin= '<br><table class="table-primary">'
		blcoin+= '	<tr class="table-primary">'
		blcoin+= '		<th class="table-primary">포켓코인번호 : </th>'
		blcoin+= '		<td class="table-primary">'+data.coin_id+'</td>'
		blcoin+= '	</tr>'
		blcoin+= '	<tr class="table-primary">'
		blcoin+= '		<th class="table-primary">포켓코인잔액 : </th>'
		blcoin+= '		<td class="table-primary">'+putComma(data.blcoin)+'원</td>'
		blcoin+= '	</tr>'
		blcoin+= '</table>'
				$("#outputData").html(blcoin);			},
			error : function(xhr, status) {
				console.log(xhr);
				console.log(status);
			}

		});
	
	}

//구매내역
function coinUseList(WCP,coin_code){
	let jsons = {
			"coin_code" : coin_code
	}
	$("#exampleModalLabel").text("구매내역");
$.ajax({
	url : WCP+"/snack/payment/coin",
	type : "PUT",
	data : JSON.stringify(jsons),
	dataType : "json",
	contentType: 'application/json; charset=utf-8',
	success : function(data) {
		$("#proboard1").find("thead").empty();
		$("#proboard1").find("tbody").empty();
		$("#exampleModal").modal("hide");
		$("#prodModal").modal("show");
        let mproB = '';
		let mproH ='';
		let value = data[0].life_prod_date;
			let qtys = 0;
				mproH +='<tr>                         ';
				mproH +='<th colspan="2">사용코인번호</th>    ';
				mproH +='<th colspan="2">상품명</th>  ';
				mproH +='<th colspan="2">판매날짜</th>';
				mproH +='<th colspan="2">이용시설</th>';
				mproH +='<th colspan="2">상품코드</th>';
				mproH +='<th colspan="2">환불여부</th>';
				if(value != "" && value != null && typeof value != "undefined" ){
					mproH +='<th colspan="2">유통기한</th>';
				}
				mproH +='</tr>                        ';
			for(var i in data){
				mproB +=  '<tr>                              ';
                mproB += '<td colspan="2">'+data[i].coin_code+'</td>                    ';
                mproB += '<td colspan="2">'+data[i].prod_name+'</td>                    ';
                mproB += '<td colspan="2">'+data[i].coin_use_date+'</td>                    ';
                mproB += '<td colspan="2">'+data[i].fc_name+'</td>         ';
                mproB += '<td colspan="2">'+data[i].prod_code+'</td>                ';
                mproB += '<td colspan="2"><button type="button" name="'+data[i].coin_use_code+'" class="btn btn-danger">환불</button></td>                       ';
                if(value != "" && value != null && typeof value != "undefined" ){
                	mproB +='<th colspan="2">'+data[i].life_prod_date+'</th>';
				}
                mproB += '</tr>                             ';
            	qtys++;
			}
			$("#proboard1").find("thead").html(mproH);
			$("#proboard1").find("tbody").html(mproB);
			$("#proboard1").scrollTop();
			$(".modal-header").find('span').text("구매현황 : "+qtys);
	},
	error : function(xhr, status) {
		console.log(xhr);
		console.log(status);
	}

});
}


/* 상세조회 */
function detailRead(WCP){
	$(document).on("click",".btn-overlay",function(){
		let menuName = $(this).find(".fa-search-plus").text();
		$.ajax({
			url : WCP+"/snack",
			type : "post",
			data : {"menuName" : menuName},
			dataType : "json",
			success : function(data) {
				$("#prodModal").modal("show")
            let mproB = '';
			let mproH ='';
				let qtys = 0;
					mproH +='<tr>                         ';
					mproH +='<th colspan="2">번호</th>    ';
					mproH +='<th colspan="2">상품명</th>  ';
					mproH +='<th colspan="2">입고날짜</th>';
					mproH +='<th colspan="2">이용시설</th>';
					mproH +='<th colspan="2">상품코드</th>';
					mproH +='<th colspan="2">구분번호</th>';
					mproH +='</tr>                        ';
				for(var i in data){
					mproB +=  '<tr>                              ';
	                mproB += '<td colspan="2">'+(parseInt(i)+1)+'</td>                    ';
	                mproB += '<td colspan="2">'+data[i].prod_name+'</td>                    ';
	                mproB += '<td colspan="2">'+data[i].inc_date+'</td>                    ';
	                mproB += '<td colspan="2">'+data[i].fc_name+'</td>         ';
	                mproB += '<td colspan="2">'+data[i].prod_code+'</td>                ';
	                mproB += '<td colspan="2">'+data[i].lprod_code+'</td>                       ';
	            	mproB += '</tr>                             ';
	            	qtys++;
				}
				$("#proboard1").find("thead").html(mproH);
				$("#proboard1").find("tbody").html(mproB);
				$("#proboard1").scrollTop();
				$(".modal-header").find('span').text("현재재고 : "+qtys);
			},
			error : function(xhr, status) {
				console.log(xhr);
				console.log(status);
			}

		});
	})
}

//물품 결제
function orderprod(WCP,listMap){
	$.ajax({
		url : WCP+"/snack/payment/coin",
		type : "post",
		data : JSON.stringify(listMap),
		dataType : "json",
		contentType: 'application/json',
		success : function(data) {
			
			if(data.message=='결제완료!'){
				$("#prodCart").empty();		
				total = 0;
				$("#tax").text(0 + "원");
				$("#subtotal").text(0 + "원");
				$("#total").text(0 + "원");
//					console.log(data.prodlist)
				let blcoin= '<table class="table-primary" style="font-size: 10px">'
				for(var i in data.prodlist)	{
					
					blcoin+= '	<tr class="table-primary">';
					blcoin+= '		<th class="table-primary">상품명 : </th>';
					blcoin+= '		<td class="table-primary">'+data.prodlist[i].prod_name+'</td>';
					blcoin+= '		<th class="table-primary">가격 : </th>';
					blcoin+= '		<td class="table-primary">'+putComma(data.prodlist[i].prod_price)+'</td>';
					blcoin+= '		<th class="table-primary">상품번호 : </th>';
					blcoin+= '		<td class="table-primary">'+data.prodlist[i].prod_code+'</td>';
					blcoin+= '	</tr>';
				}
					blcoin+= '</table>';
				$("#outputLayer").append(blcoin);
				
			}
			alerted(data.message);
		},
		error : function(xhr, status) {
			console.log(xhr);
			console.log(status);
		}

	});
	
}

//환불
function refundProd(WCP){
	$(document).on("click", ".btn-danger" ,function(){
		let nme = $(this).attr('name');
		var del = $(this);
		let jsons = {
				"coin_use_code" : nme
		}
		$.ajax({
			url : WCP+"/snack/payment/coin",
			type : "DELETE",
			data : JSON.stringify(jsons),
			dataType : "json",
			contentType: 'application/json; charset=utf-8',
			success : function(data) {
				console.log(data);
				alerted(data.result);
				del.closest('tr').remove();
				let newqty = parseInt($(".modal-header").find('span').text().substring(7))-1;
				$(".modal-header").find('span').text("구매현황 : "+newqty);
			},
			error : function(xhr, status) {
				console.log(xhr);
				console.log(status);
			}

		});
	})
	}
function salestoday(WCP){
	$(document).on('click','#deadlined',function(){
		$.ajax({
			url : WCP+"/snack/sales",
			type : "get",
			contentType: 'application/json; charset=utf-8',
			success : function(data) {
				console.log(data.result[0]);
				for(let i in data.result){
					let tableH = $('#Tsales').find('p').eq(i);
					let tableP = $('#Tsales').find('p').eq(i);
					let tableC = $('#Tsales').find('p').eq(i);
					let datas = data.result[i];
					if(datas.CANCEL == '순매출'){
					tableH.text(datas.CANCEL+" : "+datas.AMOUNT)
					}else{						
						tableH.text(datas.CANCEL+"  : "+datas.AMOUNT)
					}
					
					if(datas.CANCEL == '총액'){
						$('#Tuser').text(putComma(datas.CNT)+"명")
					}
				}
				let today = new Date();
				$("#Ntime").text(today.getHours()+'시'+today.getMinutes()+'분'+today.getSeconds()+'초');
			},
			error : function(xhr, status) {
				console.log(xhr)
				console.log(status)
			}
	
		});
	})
}