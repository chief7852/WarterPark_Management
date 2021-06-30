<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 결제 modal -->
<div class="modal fade" id="payPage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
      	<button id="PMC" type="button"><i class="bi bi-arrow-left"></i> </button><h5 class="modal-title" id="exampleModalLabel">&nbsp;결제</h5>
<!--         <button  type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
        
      </div>
      <div id="PMB" class="modal-body full-body-padding"  style="border-right: groove;">
		 <div class="rowed">
		      <div class="left">
		        	<h3>주문내역</h3>
		        	<hr>
		        	<div class="addr_cont">
		        		<table class="tbl_addr" id="after-first-pay">
		        			<!-- 이용권, 수량 -->
		        		</table>
		        	</div>
		      </div>
		      
		      <div class="left-down">
			      <div class="payment-list">
			      	<div>공급가액</div><div id="m-subtotal">0원</div>
			      </div>
			      <div class="payment-list">
			      	<div>부가세</div><div id="m-tax">0원</div>
			      </div>
			      <div class="payment-list">
			      	<div>총액</div><div id="m-total">0원</div>
			      </div>
		      </div>
		  
		      <div class="right">
		      			<h3>결제금액</h3>
		      		<div class="payoption top">
		      			<div class="PTM">
		      				<label for="PTM"></label>원
		      			</div>
		      		</div>
		      		<div class="payoption middle">
		      			<button id="saleList-btn" type="button" class="btn btn-outline-light left">
		      				<div><span>할인 ></span></div>
		      				<div class="buttonFlex">
			      				<div id="SLPN"></div>
		      				</div>
		      				<div id="SLPP" class="sale-money">0원</div>
		      			</button>
<!-- 		      			<button type="button" class="btn btn-outline-light right"> -->
<!-- 		      				<div><span>포인트 ></span></div> -->
<!-- 		      				<div class="buttonFlex"> -->
<!-- 			      				<div>무슨할인먹일지</div> -->
<!-- 		      				</div>  			 -->
<!-- 		      			</button> -->
		      		</div>
		      			<h3>결제 수단 선택</h3>
		      		<div class="payoption bottom">
		      			<button id="card-orderBtn" type="button" class="btn btn-outline-light left" data-bs-toggle="modal" data-bs-target="#exampleModal">
		      				<i class="bi bi-credit-card"></i> 카드결제
		      			</button>
		      			<button type="button" id="cash-orderBtn" class="btn btn-outline-light right" data-bs-toggle="modal" data-bs-target="#cash-modal">
							<i class="bi bi-wallet2"></i> 현금결제		
		      			</button>
		      		</div>
		        	
		      </div>
		    </div>
	 </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<!-- 결제 modal 종료 -->
<!-- 결제완료시 띠지 프린트로 찍어내기 -->
<div class="modal fade qr-print-modal" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">포켓코인 띠지 출력</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
      </div>
      <div class="modal-body">
      <!-- qr코드 찍고 프린트하는 범위 -->
            <div id="backqr">
		    	<img id="qrfront_img" src="${WCP}/resources/emp-img/Infra_Blueone_main.png">
		    	<img id="qrcode_img" style="display:none" onload="this.style.display='block'">
    		</div>
      </div>
      <div class="modal-footer">
        <button id="printing" type="button" class="btn btn-primary">출력</button>
      </div>
    </div>
  </div>
</div>
<!-- 결제완료시 띠지 프린트 찍기 끝 -->

<!-- 결제내역 환불용 modal -->
<div class="modal fade" id="payCanclePage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
      	<button id="PMLC" type="button"><i class="bi bi-arrow-left"></i> </button><h5 class="modal-title" id="exampleModalLabel">&nbsp;결제 내역</h5>
<!--         <button  type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
        
      </div>
      <div id="PMLB" class="modal-body full-body-padding"  style="border-right: groove;">
		 <div class="rowed">
		 	  <div class="left-down date-flex">
		      	 	<div class="date-selects">
			        		<select class="form-select" aria-label="Default select example">
							  <option selected>전체기간</option>
							  <option value="hour">지난 1시간</option>
							  <option value="day">지난 24시간</option>
							  <option value="week">지난 7일</option>
							  <option value="month">지난 4주</option>
							</select>
			        	</div>
			        	<div class="date-selects">
			        		<select class="form-select" aria-label="Default select example">
							  <option selected>전체</option>
							  <option value="cash">현금</option>
							  <option value="card">카드</option>
							  <option value="refund">환불</option>
							</select>
			        </div>
		      </div>
		 
		      <div class="left full-height">
		        	<div class="addr_cont">
		        		<table class="table table-hover tbl_addr after" >
		        			<tr>
		        				<td class="orderList-days" colspan="6"><p class="table-date-p">&nbsp;오늘,2021.06.29</p></td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">현금</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">환불</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td class="orderList-days" colspan="6"><p class="table-date-p">&nbsp;2021.06.28</p></td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        			<tr>
		        				<td ><div class="stat-badges">카드</div></td>
		        				<td class="reserves" colspan="3">
		        					<div class="reserve-cash">111,000</div>
		        					<div class="reserve-contents"><i class="bi bi-credit-card-2-front">일일이용권(청소년) 외 3건</i></div>
		        				</td>
		        				<td></td>
		        				<td>14:32</td>
		        			</tr>
		        		</table>
		        	</div>
		      </div>
		  
		      <div class="right overflow-y-noui">
		      			<h3>결제상세</h3>
		      		<div class="payoption top">
		      			<div class="PTM-time-group">
			      			<div class="PTM-buy-time">결제 시간:2021.06.29. 14:30</div>
			      			<div class="PTM-refund-time">환불 시간:2021.06.29. 14:31</div>
		      			</div>

		      		</div>
		      		<div class="payoption top">
		      			<h4>총 결제 금액</h4>
		      			<h4 style="text-decoration:line-through">80000원(환불예시임)</h4>
		      			<div class="PTML" style="color: black;">80000원 </div>
		      			<hr>
		      		</div>
		      		
		      		<div class="payoption middle recieipt">
						<div id="BF-res_code">
							<div class="BF-left">예매 번호</div>
							<div id="res_code_data" class="BF-right">RE2106020001</div>
						</div>
						<div id="BF-sale_id">
							<div class="BF-left">적용된 할인</div>
							<div class="BF-right">40%</div>						
						</div>
						<div id="BF-ticket_price">
							<div class="BF-left">결제 금액</div>
							<div class="BF-right">11,000원</div>						
						</div>
						<div id="BF-res_qty">
							<div class="BF-left">총 예매 수</div>
							<div id="res_qty_data" class="BF-right">4장</div>						
						</div>
						<div id="BF-payment">
							<div class="BF-left">결제 수단</div>
							<div class="BF-right">카드</div>						
						</div>
		      		</div>
		      		<div class="payoption top">
		        		<h4>결제 내역</h4>
		        	</div>
		      		<div class="payoption bottom">

		      		</div>
		      </div>
		    </div>
	 </div>
      <div class="modal-footer">
      		<div class="footer-temp">
      		</div>
      		<div class="footer-buttons">
	      		<button id="refundBTN" type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">환 불</button>
				<button id="receiptBTN" type="button" class="btn btn-outline-dark">영수증 출력</button>
			</div>
      </div>
    </div>
  </div>
</div>
<!-- 결제내역 환불용 modal 종료 -->

<form id="myreceipt" name="myform" method="get" hidden action="${WCP}/ticket/receipt" target="popup_window">
  <input id="t1" name="res_code" value="1" />
  <input id="t2" name="totalPrice" value="2" />
  <input id="t3" name="emp_name" value="3" />
  <input id="t4" name="res_qty" value="3" />
  <input id="t4" name="write_date" value="3" />
</form>
	<!-- 예약내역 조회 모달 -->
<div class="modal fade" id="reserveModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header" style="background-color: black;">
				<h1 style="color: white;">Scanner</h1>
			</div>

			<div class="modal-dialog container">
				<div class="row row-cols-2">
					<div class="modal-body col-6">
						<div id="scanner">
							<div id="test"></div>
							<div id="reload"></div>
							<div>
								<div id="frame">
									<div id="loadingMessage">스캔준비중</div>
									<canvas id="canvas"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div id="output">
							<div id="outputMessage">예매내역</div>
						</div>
						<div id="outputLayer" hidden>
							<span id="outputData">
								<table class="table">
								</table>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer" id="foots">
				<button type="button" class="btn btn-primary" id="qr-print-btn" disabled="disabled">출력</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal" id="closemodal">닫기</button>
			</div>

		</div>
	</div>
</div>
<!-- 모달창끝 -->


<!-- 현금 결제 하는 화면 출력 -->

<!-- Modal -->
<div class="modal fade" id="cash-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog cash-dialog modal-dialog-centered">
    <div class="modal-content cash-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">현금 결제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="cash-body" >
        <table id="cal-monitor" class="cash-table">
        	<tr>
                <th><label class="cash-text">받은 금액 : </label></th>
        		<td><input type="text" name="" value="0" class="price-monitor form-control" id="get-from-customer" onchange="putCommaProcess(this)"/> 원</td>
        	</tr>
        	<tr>
                <th><label class="cash-text">결제 금액 : </label></th>
        		<td><input type="text" name="" value="0" class="price-monitor form-control" id="final-amount" onchange="putCommaProcess(this)" disabled="disabled"/> 원</td>
        	</tr>
        	<tr>
                <th><label class="cash-text">거스름 돈 : </label></th>
        		<td><input type="text" name="" value="0" class="price-monitor form-control" id="exchange-amount" onchange="putCommaProcess(this)" disabled="disabled"/> 원</td>
        	</tr>
        </table>
        <table id="cal-button" class="cash-table" >
        	<tr>
        		<td><input class="btn btn-outline-dark" disabled="disabled"/></td>
        		<td><input type="reset" value="초기화" class="btn btn-outline-dark" id="reset-number"/></td>
        		<td><button class="btn  btn-outline-danger" id="del-number" ><i class="bi bi-arrow-left-square"></i></button></td>
        	</tr>
        	<tr>
        		<td><input type="button" value="1" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="2" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="3" class="cal-btn btn btn-outline-dark"/></td>
        	</tr>
        	<tr>
        		<td><input type="button" value="4" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="5" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="6" class="cal-btn btn btn-outline-dark"/></td>
        	</tr>
        	<tr>
        		<td><input type="button" value="7" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="8" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="9" class="cal-btn btn btn-outline-dark"/></td>
        	</tr>
        	<tr>
        		<td><input type="button" value="00" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="0" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="000" class="cal-btn btn btn-outline-dark"/></td>
        	</tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="final-cash-btn">결제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="coin-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog cash-dialog modal-dialog-centered">
    <div class="modal-content cash-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">포켓 코인 충전</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="cash-body" >
        <table id="cal-monitor" class="cash-table">
        	<tr>
                <th><label class="cash-text">충전 금액 :</label></th>
        		<td><input type="text" name="" value="0" class="price-monitor form-control" id="get-from-customer" onchange="putCommaProcess(this)"/> 원</td>
        	</tr>
        	<tr>
                <th><label class="cash-text">잔여 금액 :</label></th>
        		<td><input type="text" name="" value="0" class="price-monitor form-control" id="remain-amount" onchange="putCommaProcess(this)" disabled="disabled"/> 원</td>
        	</tr>
        	<tr>
                <th><label class="cash-text">충전 후 잔액 :</label></th>
        		<td><input type="text" name="" value="0" class="price-monitor form-control" id="after-charge" onchange="putCommaProcess(this)" disabled="disabled"/> 원</td>
        	</tr>
        </table>
        <table id="cal-button" class="cash-table" >
        	<tr>
        		<td><input class="btn btn-outline-dark" disabled="disabled"/></td>
        		<td><input type="reset" value="초기화" class="btn btn-outline-dark" id="reset-number"/></td>
        		<td><button class="btn  btn-outline-danger" id="del-number" ><i class="bi bi-arrow-left-square"></i></button></td>
        	</tr>
        	<tr>
        		<td><input type="button" value="1" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="2" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="3" class="cal-btn btn btn-outline-dark"/></td>
        	</tr>
        	<tr>
        		<td><input type="button" value="4" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="5" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="6" class="cal-btn btn btn-outline-dark"/></td>
        	</tr>
        	<tr>
        		<td><input type="button" value="7" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="8" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="9" class="cal-btn btn btn-outline-dark"/></td>
        	</tr>
        	<tr>
        		<td><input type="button" value="00" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="0" class="cal-btn btn btn-outline-dark"/></td>
        		<td><input type="button" value="000" class="cal-btn btn btn-outline-dark"/></td>
        	</tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="final-charge-btn" >결제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 퇴장 성공시 모달 -->
<div class="modal fade" id="exit-success-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">대덕 워터 파크 퇴장</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
<%--       	<img alt="" src="${WCP }/resources/assets/images/icons/water_dolphin__kdy_1.png"> --%>
      	<h1>즐거운 시간 보내셨나요?</h1>
      	<p class="lead">이용하시는 동안 재밌는 시간을 보내셨길 바라며,</p>
      	<p class="lead">잊은 물품이 없는지 다시 한 번 확인 부탁드립니다.</p>
      	<p class="lead">저희 대덕 워터 파크는 항상 최고의 서비스로 보답할 수 있도록 노력하겠습니다.</p>
      	<h2>방문해 주셔서 감사합니다.</h2>
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

