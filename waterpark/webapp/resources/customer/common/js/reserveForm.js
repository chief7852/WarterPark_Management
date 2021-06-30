/**
 * 
 */

$(window).load( function() {
		$('#mycalendar2').monthly({
			mode: 'picker',
			target: '#mytarget',
			setWidth: '250px',
			startHidden: true,
			showTrigger: '#mytarget',
			stylePast: true,
			disablePast: true
		});

	switch(window.location.protocol) {
	case 'http:':
	case 'https:':
	// running on a server, should be good.
	break;
	case 'file:':
	Swal.fire('Just a heads-up, events will not work when run locally.');
	}

	});
	
	let getPriceForm = $("#getPriceForm");
	let ticketOrders = $("#ticketOrders");
	let getPriceFormUrl = getPriceForm.attr("action");
	let ticketOrdersUrl = ticketOrders.attr("action");
	
//	$(".btn-modal").hide();
	
	
	// 이용권의 연령을 선택하면
	let select_age = $(document).on("change", ".select-age", function(){
		let parent = $(this).parents(".ticket-info");
		let inputs = parent.find(":input[name]");
		$(inputs).each(function(idx, input){
			let name = $(this).attr("name");
			let sameName = getPriceForm.find("[name='"+name+"']"); 
			$(sameName).val($(this).val());
		});
		$.ajax({
			url:getPriceFormUrl,
			method:"get",
			data:$(getPriceForm).serialize(),
			dataType:"json",
			success:function(ticket){
				let idx = parent.find(".box").attr("idx", ticket[0].ticket_id);
				let price = parent.find("label[for='price']");
				$(price).text(ticket[0].ticket_price);
				
				let inputs = getPriceForm.find(":input[name]");
				$(inputs).each(function(idx, input){
					if($(this).attr("name") != "ticket_grp"){
						$(this).val("");
					}					
				});
				
			}, error: function(xhr, error, msg){
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
			
		});
		
	});
	
	let ticketbody = $(".ticket-sidebar tbody");
	let ticket_sidebar = $(".ticket-sidebar");
	
	// 담기 버튼을 클릭하면
	$(document).on("click", ".putBtn", function(){
		let idx = $(this).parents(".box").attr("idx");
		let grp = $(this).parents(".box").data("grp");
		console.log(grp);
		if(user == "false" && grp == "YR"){
			Swal.fire({
				  title: '연간 이용권 구입은 로그인이 필요한 서비스입니다.',
				  text: "로그인 페이지로 이동하시겠습니까?",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '확인',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.isConfirmed) {
					  location.href = WCP+"/customer/login";
						return;
				  }else{
					  Swal.fire("일일 이용권을 이용해주세요.");
						return;
				  }
				})
			return;
		}else if(grp == 'YR' && parseInt(membership) > 0 ){
			Swal.fire("이미 유효한 연간 이용권을 \n소유하고 있습니다.");
			return;
		}else if(grp == 'YR' && parseInt(membership) == 0){
			$("#mytarget").attr("disabled", true).css("background-color", "lightgrey");
			let real = new Date();
			real.setFullYear(real.getFullYear() + 1);
			real = real.toISOString().substring(0,10);
			$("#mytarget").val(real);
			$("#predate").val(real);
			
		}
		
		
		
		let infoPrice = $(this).parents(".ticket-info").find("label[for='price']").text();
		
		getPriceForm.find(":input[name='ticket_id']").val(idx);	// ticket info에 출력할 용으로 검색하는 폼에 저장
		let count = 0;
		
		let inputs = $(ticketbody).find("input[idxx='"+ idx + "']").length;
		let allTrs = ticketbody.find(".putTr");
		let grpCnt = 0;
		$(allTrs).each(function(i, tr){
			if($(tr).data("grp") == "YR"){
				grpCnt++;
				return false;
			}
		});
		if((grp == "YR" && $(ticketbody).find(".putTr").length > 0) || grpCnt > 0){
			Swal.fire("연간 이용권은 1인당 1매만 \n구입 가능하며, \n단독으로만 구입이 가능합니다.");
			
		}else{
			let inputCnt = 1;
			if(inputs > 0){
				inputCnt = SumCnt(idx, infoPrice, "plus");
				let inputs = getPriceForm.find("[name]");
				$(inputs).each(function(idx, input){
					if($(this).attr("name") != "ticket_grp"){
						$(this).val("");
					}					
				});
				sumPayment(infoPrice, 0, "plus");
			}else{
				$.ajax({
					url:getPriceFormUrl,
					method:"get",
					data:$(getPriceForm).serialize(),
					dataType:"json",
					success:function(tickets){
						ticket = tickets[0];
						infoPrice = ticket.ticket_price; 
						let price = parent.find("label[for='price']");
						$(price).text(ticket.ticket_price);
						let ticketList = $(ticketbody).html();
						$(".ticket-sidebar tbody").empty();
						ticketList += "<tr class='putTr' data-grp='"+ticket.ticket_grp+"' data-type='"+ticket.ticket_type+"'>";
				        ticketList += "<td class='text-left'>                                            ";
				        ticketList += "<input type='hidden' name='ticket_sale' value='"+ticket.ticket_sale+"' />";
				        ticketList += "<input type='hidden' idxx='"+ ticket.ticket_id +"' name='ticket_id' value='"+ ticket.ticket_id +"'/>  ";
				       	ticketList += "<input type='hidden' name='ticket_cnt' value='1' /> ";
				        ticketList += ticket.ticket_name + "-" + ticket.ticket_type_name + "/ " + ticket.ticket_age_name;
				        ticketList += "</td>                                                             ";
				        ticketList += "<td>                                                              ";
				        if(ticket.ticket_grp != "YR"){
				        	ticketList += "	<input type='button' class='btn-buy buy-signal buy-minus' value='-' />     ";
				        }
				        ticketList += "	<label for='ticket_cnt'>1</label>                                ";
				        if(ticket.ticket_grp != "YR"){
				        	ticketList += "	<input type='button' class='btn-buy buy-signal buy-plus'  value='+' />    ";
				        }
				        ticketList += "</td>                                                             ";
				        ticketList += "<td><label for='price'>"+ticket.ticket_price+"</label></td>                                                    ";
				        ticketList += "<td><input type='button' value='X' class='btn-buy buy-del' /></td>";
				    	ticketList += "</tr>                                                             ";
						
				    	$(ticketbody).append(ticketList);
				    	let putTrs = ticket_sidebar.find(".putTr");
				    	
						let inputs = getPriceForm.find("[name]");
						$(inputs).each(function(idx, input){
							if($(this).attr("name") != "ticket_grp"){
								$(this).val("");
							}					
						});
						sumPayment(infoPrice, 0, "plus");
						
					}, error: function(xhr, error, msg){
						console.log(xhr);
						console.log(error);
						console.log(msg);
					}
					
				});
			}
		}
		
		
		
	});
	
	// 수량 계산해서 ticket-sidebar에 출력
	var SumCnt = function(idx, price, pm){
		price = deleteComma(price);
		price = parseInt(price);
		let inputs = $(ticketbody).find(":input[name='ticket_id']");
		let pri = "";
		$(inputs).each(function(i, input){
			if($(this).attr("idxx") == idx){
				let parentTr = $(this).parents(".putTr");
				let inputCnt = $(parentTr).find("input[name='ticket_cnt']").val();
				let sidebarPrice = $(parentTr).find("label[for='price']");
				 pri = deleteComma($(sidebarPrice).text());
				let intPrice = parseInt(pri);
				if(pm == "plus"){
					inputCnt++;
					intPrice = intPrice + price;
				}else{
					
					if(inputCnt <= 1) {
						Swal.fire("이용권은 1장 이상 구매해야합니다") 
					}else{
						intPrice = intPrice - price;
						inputCnt--;
					};
				}
				let cntLabel = $(parentTr).find("label[for='ticket_cnt']").text(inputCnt);
				$(parentTr).find("input[name='ticket_cnt']").val(inputCnt);
				intPrice = putComma(intPrice);
				$(sidebarPrice).text(intPrice);
			}
		});
				return pri;
	};
	
	// 가격을 합산
	var sumPayment = function(price, pri, pm){
		price = parseInt(deleteComma(price));
		let payment = deleteComma(priceSidebar.find("label[for='payment']").text());
		payment = parseInt(payment);
		if(pm == "plus"){
			payment += price;
		}else{
			if((pri-price) == 0){
			}else{
				payment -= price;
			}
		}
		payment = putComma(payment);
		$("label[for='payment']").text(payment);
		totalPayment();
	}
	
	// - + 버튼을 누르면 거기에 맞게 분기를 나눠줌
	$(document).on("click", ".buy-signal" , function(){
		let idx = $(this).parents(".putTr").find("input[idxx]").attr("idxx");
		let pm = "";
		if($(this).hasClass('buy-plus')){
			pm = "plus";
		}else{
			pm = "minus";
		}
		getPriceByAjax(idx, pm);
	});
	
	var getPriceByAjax = function(idx, pm){
		$.ajax({
			url:getPriceFormUrl,
			method:"get",
			data:{"ticket_id": idx},
			dataType:"json",
			success:function(ticket){
				let price = ticket[0].ticket_price;
				let pri = SumCnt(idx, price, pm);
				sumPayment(price, pri, pm);
				
			}, error: function(xhr, error, msg){
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
			
		});
	}
	let ticketsArea = $("#tickets");
	
	
	let priceSidebar = $(".price-sidebar");
	// x버튼 눌렀을 때
	$(document).on("click", ".buy-del", function(){
		let putTr = $(this).parents(".putTr");
		let sumPriceForticket = $(putTr).find("label[for='price']").text();
		let payment = $(priceSidebar).find("label[for='payment']").text();
		sumPayment(sumPriceForticket, -1, "minus" );
		$(putTr).remove();
		let putTrs = $(ticketbody).find(".putTr");
		let yrCnt = 0;
		$(putTrs).each(function(idx, tr){
			let grp = $(tr).data("grp");
			if(grp == "YR"){
				yrCnt++;
			}
		});
		if(yrCnt < 1){
			$("#mytarget").attr("disabled", false).css("background-color", "#3097f0");
			$("#predate").val("");
		}
	});
	
	// 할인 정책 골랐을 때
	$(document).on("change", ".sale_id", function(){
		let sale_id = $(this).val();
		$(ticketOrders).find("input[name='sale_id']").val(sale_id);
		totalPayment();
		
	});
	// ticket-sidebar에 담겨있는 
	var forEachTicketSum = function(){
		let priceSaleY = 0;
		let putTrs = ticket_sidebar.find(".putTr");
		$(putTrs).each(function(index, putTr){
			let ticket_sale = $(putTr).find(":input[name='ticket_sale']").val();
			if(ticket_sale == "Y"){
				let ticketPrice = deleteComma($(putTr).find("label[for='price']").text());
				priceSaleY += parseInt(ticketPrice);
			}
		});
		return priceSaleY;
	};
	
	
	// 할인 계산해주는 함수 - 파라미터는 할인율, 이용권 한장의 가격(또는 장바구니에 담긴 )
	var salePayment = function(percent, price){
		percent = parseInt(percent)*0.01;
		let payment = parseInt(price);
		let result = price - (price *(1 - percent));
		return result;
		
		
	};
	
	// 할인 값 가져와서 할인 금액과 총 결제 금액 출력
	var totalPayment = function(){
		let payment = deleteComma($(priceSidebar).find("label[for='payment']").text());
		let priceSaleY = forEachTicketSum();	// 할인 가능한 티켓의 가격 총합

		let percent = priceSidebar.find(":input[name='sale_id'] option:selected").data("percent"); // 적용하려는 할인율
		
		let saleAmount = salePayment(percent, priceSaleY); // 총합과 할인율을 넘겨서 할인가를 받음
		let plusSale = 0;
		let plusSaleChar = "";
//		if(user != null){
//			let type = $(ticket_sidebar).find(".putTr")[0].data("type");
//			if(type =="RG" && membership > 0 && membership <= 3){
//				plusSale = -30000;
//				plusSaleChar = "(멤버십 할인 -30000원)";
//			}else if(type =="RG" && membership >= 5){
//				plusSale = -50000;
//				plusSaleChar = "(멤버십 할인 -50000원)";
//			}
//		}
		
		
		
		let totalPay = parseInt(payment) - parseInt(saleAmount) + plusSale;
		if(totalPay <= 0){
			totalPay = 0;
			saleAmount = 0;
		}
		
		let totalSale = saleAmount + plusSaleChar
		
		$(priceSidebar).find("label[for='sale-amount']").text(putComma(totalSale));
		$(priceSidebar).find("label[for='total-price']").text(putComma(totalPay));
	}
	
	$("#final-pay").on("click", function(){
		let predate = $("#mytarget").val();
		let regax = /[0-9]{4}-[0-9]{2}-[0-9]{2}/gi;
		predate = predate.split(".");
		let real = "";
		$(predate).each(function(i, date){
			let d = date.trim();
			if(i == 1 && d.length < 2){
				d = "0"+d;
			}
			if(i > 0 && d.length > 0){
				real += "-";
			}
			real += d;
			
		});
		
		
		
		if(regax.test(real) != true ){
			Swal.fire("방문할 날짜를 골라주세요.");
		}else{
			$("#predate").val(real);
			
			
			let putTrs = ticketbody.find(".putTr");
			let newInputs = "";
			if(putTrs.length <=0){
				Swal.fire("이용권을 골라주세요.");
				return;
			}
			$(putTrs).each(function(index, putTr){
				let inputs = $(putTr).find("input[name]");
				$(inputs).each(function(i, input){
					newInputs += "<input type='hidden' name='ticketListForRes["+index+"]."+$(input).attr('name')+"' value='"+$(input).val()+"' />";
				});
			});
			
			$("#idAndCnt").html(newInputs);
			$(ticketOrders).find("input[name='pay_amount']").val(deleteComma($("label[for='total-price']").text()));
			if(user == "false"){
				$(".btn-modal").click();
				$(document).on("click", "#modal-ok", function(){
					let content = $(this).parents(".modal-content");
					$("#nonUserInfo").empty();
					let name = content.find("input[name='user_name']").val();
					$("#nonUserInfo").append($("<input>").attr({"name" : "user_name", "type" : "hidden"}).val(name));
					let hp1 = content.find("input[name='user_hp1']").val();
					let hp2 = content.find("input[name='user_hp2']").val();
					let hp3 = content.find("input[name='user_hp3']").val();
					let hp = hp1 + hp2 + hp3;
					$("#nonUserInfo").append($("<input>").attr({"name": "user_hp", "type" : "hidden"}).val(hp));
					
						pay();
//						 test();
				});
			}else{
					pay();
//				 test();
			}
			
			
		}
	});
	
	
	
	
	
	var pay = function(){
		var IMP = window.IMP;
		IMP.init('iamport');
		IMP.request_pay({
		    pg : 'inicis', 
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : $("label[for='total-price']").text(),
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
//		        msg += '고유ID : ' + rsp.imp_uid;
//		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        let paid = putComma(rsp.paid_amount);
		        msg += '<br>결제 금액 : ' + paid + "원";
//		        msg += '<br>카드 승인번호 : ' + rsp.apply_num;
		        $(ticketOrders).find("input[name='pay_amount']").val(rsp.paid_amount);
		        
//		        $.ajax({
//					url:ticketOrdersUrl,
//					method:ticketOrders.attr("method"),
//					data:ticketOrders.serialize(),
//					dataType:"json",
//					success:function(resp){
//						if(resp.result == "Success"){
//							let goView = confirm("예매가 완료되었습니다.\n예매내역을 조회하시겠습니까?");
//							if(goView == true){
//								location.href = "${WCP}/customer/info/reserveInfo?what="+resp.res_code;
//							}else{
//								Swal.fire("메인 페이지로 이동합니다.");
//								location.href = "${WCP}/customer";
//							}
//						}else{
//							Swal.fire("실패ㅜ");
//						}
//						
//					}, error: function(xhr, error, msg){
//						console.log(xhr);
//						console.log(error);
//						console.log(msg);
//					}
//					
//				});
		        
		        test();
					
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    Swal.fire({html : msg, showCloseButton : true, confirmButtonText: "확인"});
		});
	};
	
	let frag = $(".swal2-container").is(":visible");
	if(!frag){
		$("body").css("padding-right", "0");
//		$('body').on('scroll touchmove mousewheel', function(event) {
//			event.preventDefault();
//			event.stopPropagation();
//			return false;
//			});
		frag = true;
		
	}else {
//		$('body').off('scroll touchmove mousewheel');
		frag = false;
	}
	
	