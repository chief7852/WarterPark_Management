<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table,th{
/* 		border: 1px solid black; */
		text-align: center;
/* 		border-collapse: collapse; */
	}
	table tr:first{
		border:none;
	}
	table thead{
		margin-bottom: 10px;
		border: 1px solid black;
	}
</style>
</head>
<body>
<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>예매 상세 내역</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="blog.html">이용 정보</a></li>
            <li><a href="blog.html">예매 내역</a></li>
            <li>예매 상세 내역</li>
          </ol>
        </div>
      </div>
</section><!-- End Breadcrumbs -->

<section>
	<div class="container">
		<div class="row table-res-info" data-code="${reserve.res_code_encode }">
			<table class="table">
	            	<tr>
	            		<td colspan="5" class="text-right">
	            			<c:if test="${empty reserve.res_cancel }">
		            			<button class="btn-style btn-print">출력</button>
		            			<c:if test="${reserve.remain_days > 7 }">
		            				<input type="button" class="btn-style btn-cancel" value="환불" />
		            			</c:if>
		            			
	            			</c:if>
	            		</td>
	            	</tr>
	                <tr>
	                    <th class="table-highlight">예매 번호</th>
	                    <td colspan="2">${reserve.res_code }</td>
	                    <th class="table-highlight">주문한 사람</th>
	                    <td>${reserve.user_name }</td>
	                </tr>
	                <tr>
	                    <th class="table-highlight">방문 예정일</th>
	                    <td colspan="2">
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
	                	<td colspan="2">${reserve.res_cnt } 장</td>
	                	<th class="table-highlight">결제 방식</th>
	                    <td>${reserve.pay.pay_way_name }</td>
	                </tr>
		                <tr>
		                	<th class="table-highlight">적용된 할인</th>
		                	<td colspan="2">${not empty reserve.sale.sale_name ? reserve.sale.sale_name : "-" }</td>
		                	<th class="table-highlight">환불 날짜</th>
		                	<td>${not empty reserve.res_cancel ? reserve.res_cancel : "-" }</td>
		               	</tr>
	        </table>
			<table class="table">
<!-- 	            	<tr> -->
<!-- 	            		<td colspan="5"></td> -->
<!-- 	            	</tr> -->
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
<!-- 	                <tr> -->
<!-- 	                	<td colspan="5"></td> -->
<!-- 	                </tr> -->
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
		</div>
	</div>
</section>

<form action="${WCP }/customer/use-info/reserveInfo" method="post" id="cancelForm">
	<input type="hidden" name="_method" value="delete" />
	<input type="hidden" name="res_code" />
</form>


<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">

	var res_code = $(".table-res-info").data("code");
	$(document).on("click", ".btn-cancel", function(){
		$("#cancelForm").find("input[name='res_code']").val(res_code);
		
		let today = new Date();
		let predate_string = "${reserve.res_predate}";
		let predate_array = predate_string.split("-");
		let predate = new Date(predate_array[0], predate_array[1]-1, predate_array[2]);
		let date_flag = Number(today) >= Number(predate);
		if(date_flag != true){
			let diff = predate - today;
			let diff_day = parseInt(diff/(1000 * 60 * 60 * 24));
			if(diff_day > 7){
				Swal.fire({
		 			  title: '정말로 환불하시겠습니까?',
		 			  text: "확인을 누르시면 환불됩니다!",
		 			  icon: 'warning',
		 			  showCancelButton: true,
		 			  confirmButtonColor: '#3085d6',
		 			  cancelButtonColor: '#d33',
		 			  confirmButtonText: '확인',
		 			 cancelButtonText: '취소'
		 			}).then((result) => {
		 			  if (result.isConfirmed) {
		 				  $.ajax({
							url : $("#cancelForm").attr("action"),
							method : $("#cancelForm").attr("method"),
							data : $("#cancelForm").serialize(),
							dataType : "json",
							success : function(resp) {
								if(resp.result = "Success"){
					 			    Swal.fire(
					 			      '환불 완료!',
					 			      '예매 내역이 환불되었습니다.',
					 			      'success'
					 			    )
								}else{
									swalWithBootstrapButtons.fire(
										      '시스템 오류!',
										      '환불이 정상적으로 처리되지 않았습니다. 잠시 후에 시도해주세요.',
										      'error'
										    )
								}
							},
							error : function(xhr, error, msg) {
								console.log(xhr);
								console.log(error);
								console.log(msg);
							}
						});
		 			  }else{
		 				 Swal.fire('환불을 취소합니다');
		 			  }
		 			})
			}else{
				alert("일주일 이내로 환불은 불가능하빈다");
			}
		}else{
			alert("이용예정일이 훨씬 지났는데요!");
			return false;
		}
		
	});
	$(document).on("click", ".btn-print", function(){
		window.open("${WCP}/customer/use-info/reserveInfo/print?res_code_encode=${reserve.res_code_encode}", "예매 내역 인쇄", "width=1300px, height=700px, toolbar=no, menubar=no, resizable=no");
	});
</script>
</body>
</html>