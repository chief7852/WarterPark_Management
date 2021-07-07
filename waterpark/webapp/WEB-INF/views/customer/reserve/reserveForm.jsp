<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script> -->
		


<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>예매</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="blog.html">이용 정보</a></li>
            <li>예매</li>
          </ol>
        </div>

      </div>
</section><!-- End Breadcrumbs -->
<section id="blog" class="blog pricing ">
      <div class="container" data-aos="fade-up">

        <div class="row">

          <div class="col-lg-8 entries">
            <article class="entry entry-ticket">
				<div class="text-left" >
					<select class="ticket-grp custom-select" name="ticket_grp" >
	                    <option value="">이용권 종류</option> 
                       <c:if test="${not empty tgList }">
                       		<c:forEach items="${tgList }" var="grp">
                       			<option value='${grp["COM_CODE"]}'>${grp["COM_CODE_NAME"] }</option>
                       		</c:forEach>
                       </c:if>
	                </select>
	                <div style="display:inline-block; width:240px;">
						<input type="button" class="btn-buy btn-cal" id="mytarget" value="방문예정일">
						<div class="monthly text-right" id="mycalendar2"></div>
					</div>
				</div>
				<c:choose>
				  <c:when test="${not empty ticketList }">
				  <div id="tickets">
				  	<c:forEach items="${ticketList }" var="ticket">
		                <div class="col-lg-3 col-md-6 ticket-info"  >
		                	<input type="hidden" name="ticket_id" value="${ticket.ticket_id }"/>
		                	<input type="hidden" name="ticket_name" value="${ticket.ticket_name }"/>
							<input type="hidden" name="ticket_type" value="${ticket.ticket_type }"/>
		                    <div class='box' idx="${ticket.ticket_id }" data-grp="${ticket.ticket_grp }">
		                    	<c:if test='${ticket.ticket_grp eq "YR" }'>
		                    		<span class="advanced">MemberShip</span>
		                    	</c:if>
		                      <h3>${ticket.ticket_name} - ${ticket.ticket_type_name}</h3>
		                      <h4><sup>₩</sup><label for="price">${ticket.ticket_price }</label><span> 원</span></h4>
		                      <ul>
		                        <li ${ticket.ticket_sale eq "Y" ? "" : "class='non-sale'" } >${ticket.ticket_sale eq "Y" ? "할인 가능" : "할인 불가능" }</li>
<!-- 		                        <li class="na">이용권 판매 중지면 넣는 클래스</li> -->
		                      </ul>
		                      <select class="select-age custom-select" name="ticket_age">
		                      	<c:if test="${not empty taList }">
		                      		<c:forEach items="${taList }" var="age">
			                          <option value='${age["COM_CODE"] }' ${ticket.ticket_type eq "SN" and age["COM_CODE"] ne "YO" ? "disabled" : ""}  >${age["COM_CODE_NAME"]}</option>
			                        </c:forEach>
		                        </c:if>
		                      </select>
		                      <div class="btn-wrap">
		                       <input type="button" class="btn-buy putBtn" value="담기"/>
		                      </div>
		                    </div>
		                </div>
	                </c:forEach>
	                </div>
	              </c:when>
                </c:choose>
              
            </article><!-- End blog entry -->



          </div><!-- End blog entries list -->
          <div class="col-lg-4">

            <div class="sidebar ticket-sidebar">
              <table>
                  <thead>
                      <tr>
                          <th class="text-left" width="170">이용권</th>
                          <th width="100">수량</th>
                          <th width="60">가격</th>
                      </tr>
                  </thead>
                  <tbody>
                  </tbody>
              </table>
              </div><!-- End sidebar recent posts-->
                <div class="sidebar price-sidebar">
                  <table>
                  	  <tr>
                  	  	<td colspan="2">
                  	  		<div class="">
                  	  		<select class="custom-select sale_id" name="sale_id">
                  	  				<option data-percent="0">할인</option>
                  	  			<c:choose>
                  	  				<c:when test="${not empty saleList }">
		                  	  			<c:forEach items="${saleList }" var="sale">
		                  	  				<option data-percent="${sale.sale_percent }" value="${sale.sale_id }">${sale.sale_name }(${sale.sale_percent }%)</option>
		                  	  			</c:forEach>
	                  	  			</c:when>
	                  	  			<c:otherwise>
	                  	  				<option>적용 가능한 할인이 없습니다.</option>
	                  	  			</c:otherwise>
                  	  			</c:choose>
                  	  		</select>
                  	  		</div>
                  	  	</td>
                  	  </tr>
                      <tr>
                          <th class="text-left" width="250">결제 금액 : </th>
                          <td class="text-right"><label for='payment'>0</label> 원</td>
                      </tr>
                      <tr>
                          <th class="text-left" width="250">할인 금액 : </th>
                          <td class="text-right"><label for="sale-amount">0</label> 원</td>
                      </tr>
                      <tr>
                          <th class="text-left" width="250">총 결제 금액 : </th>
                          <td class="text-right"><label for="total-price">0</label> 원</td>
                      </tr>
                      <tr>
                          <td class="text-right" colspan="2">
                              <input type="button" class="btn-buy" id="final-pay" value="결제"/>
                              
                          </td>
                      </tr>
                  </table>

                </div><!-- End sidebar -->

          </div><!-- End blog sidebar -->

        </div>

      </div>
    </section><!-- End Blog Section -->



<form action="${WCP }/customer/use-info/reserve" method="get" id="getPriceForm">
	<input type="hidden" name="ticket_grp" />
	<input type="hidden" name="ticket_id" />
	<input type="hidden" name="ticket_name" />
	<input type="hidden" name="ticket_type" />
	<input type="hidden" name="ticket_age" />
</form>

<form action="${WCP }/customer/use-info/reserve" method="post" id="ticketOrders">
	<div id="idAndCnt"></div>
	<input type="hidden" name="sale_id" />
	<input type="hidden" id="predate" name="res_predate" />
	<input type="hidden" name="pay_amount" />
	<input type="hidden" name="pay_method" value="card"/>
	<div id="nonUserInfo" ></div>
</form>
<div id="nonUserForm">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary btn-modal" data-bs-toggle="modal" data-bs-target="#exampleModal">
		  Launch demo modal
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">비회원 정보 입력</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <label>이름 :</label><input type="text" name="user_name" /><br/>
		        <label>전화번호 :</label><input type="text" name="user_hp1"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
		        <i class="bi bi-dash"></i>
		        <input type="text" name="user_hp2"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
		        <i class="bi bi-dash"></i>
		        <input type="text" name="user_hp3"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="modal-ok" data-bs-dismiss="modal">확인</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>


<!-- JS ======================================================= -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript" src="${WCP}/resources/js/monthly.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="${WCP }/resources/customer/common/js/reserveForm.js"></script>
<script type="text/javascript" src="${WCP }/resources/js/priceFormmating.js"></script>
<script type="text/javascript">
var user = "${not empty UserVO}";
var membership = ${not empty UserVO ? UserVO.membership_year : -1};
membership = parseInt(membership);
var WCP = "${WCP}";
if(membership > 0){
	Swal.fire("이미 유효한 연간 이용권을 소유하고 있습니다.");
}
//화면의 이용권 종류를 선택하면
$(document).on("change", ".ticket-grp", function(){
	getPriceForm.find("[name='"+$(this).attr("name")+"']").val($(this).val());

	$.ajax({
		url : getPriceFormUrl,
		data : $(getPriceForm).serialize(),
		dataType : "json",
		success : function(list){
			ticketsArea.empty();
			let tickets = "";
			let dis = "";
			let saleClass = "";
			let sale = "";
			$(list).each(function(idx, ticket){
				tickets += "<div class='col-lg-3 col-md-6 ticket-info'  >                                                ";
				tickets += "<input type='hidden' name='ticket_id' value='"+ticket.ticket_id+"'/>"
                tickets += "	<input type='hidden' name='ticket_name' value='"+ticket.ticket_name+"'/>                    ";
				tickets += "	<input type='hidden' name='ticket_type' value='"+ticket.ticket_type+"'/>                    ";
                tickets += "    <div class='box' idx='"+ticket.ticket_id+"' data-grp='"+ticket.ticket_grp+"'>                                                ";
                if(ticket.ticket_grp == "YR"){
                	tickets += '<span class="advanced">멤버십 혜택</span>';
                }
                tickets += "      <h3>"+ticket.ticket_name+" - "+ticket.ticket_type_name+"</h3>                            ";
                tickets += "      <h4><sup>₩</sup><label for='price'>"+ticket.ticket_price +"</label><span> 원</span></h4>";
                tickets += "      <ul>                                                                                   ";
                tickets += "        <li ";
                	if(ticket.ticket_sale == "Y"){
                		saleClass= "";
                		sale = "할인 가능";
                	}else{
                		saleClass = "class='sale'"
                		sale = "할인 불가능";
                	}
                tickets += saleClass +" >"+sale+"</li>                                                  ";
//                 tickets += "        <li class='na'>이용권 판매 중지면 넣는 클래스</li>                                   ";
                tickets += "      </ul>                                                                                  ";
                tickets += "      <select class='select-age custom-select' name='ticket_age'>                                          ";
                tickets += "      	<c:if test='${not empty taList }'>                                                  ";
                tickets += "      		<c:forEach items='${taList }' var='age'>                                        ";
	            tickets += "              <option value='${age['COM_CODE'] }' "
	            	if(ticket.ticket_type == 'SN'){
            			dis = "${age['COM_CODE'] ne 'YO' ? 'disabled' : ''}";
	            	}else{
	            		dis = "";
	            	}
	            tickets += dis;
	            tickets += ">${age['COM_CODE_NAME']}</option>           ";
	            tickets += "            </c:forEach>                                                                     ";
                tickets += "        </c:if>                                                                              ";
                tickets += "      </select>                                                                              ";
                tickets += "      <div class='btn-wrap'>                                                                 ";
                tickets += "       <input type='button' class='btn-buy putBtn' value='담기'A/>                               ";
                tickets += "      </div>                                                                                 ";
                tickets += "    </div>                                                                                   ";
            	tickets += "</div>                                                                                       ";
			});
			ticketsArea.html(tickets);
		},
		error : function(xhr,status){
			console.log(xhr);
			console.log(status);
		}
		
	});

});


function test(){$.ajax({
	url:ticketOrdersUrl,
	method:ticketOrders.attr("method"),
	data:ticketOrders.serialize(),
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
			Swal.fire("성공!");
			setTimeout(function(){
				location.href = "${WCP}/customer/use-info/reserveInfo/reserveView?res_code_encode="+resp.res_code_encode;
			},3000);
		}else{
			Swal.fire("서버의 문제로 진행할 수 없습니다.\n잠시 후에 시도해주세요.");
		}
		
	}, error: function(xhr, error, msg){
		console.log(xhr);
		console.log(error);
		console.log(msg);
	}
	
});}

</script>



