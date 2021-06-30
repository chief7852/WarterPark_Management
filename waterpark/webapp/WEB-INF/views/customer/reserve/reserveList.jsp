<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>예매 내역</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="blog.html">이용 정보</a></li>
            <li>예매 내역</li>
          </ol>
        </div>

      </div>
</section><!-- End Breadcrumbs -->
<section class="res-info" >
	<div class="container">
		<div class="row">
			<c:if test="${not empty UserVO }">
				<div id="searchDate">
					<input type="date" name="date_start" value="${not empty paging.searchMap.date_start ? paging.searchMap.date_start : null }" /> ~ <input type="date" name="date_end" />
					<button class="btn-style btn-search"><i class="bi bi-search"></i></button>
				</div>
			</c:if>
			<table class="table align-middle res-list">
			  <thead>
			    <tr>
			      <th scope="col">예매 번호</th>
			      <th scope="col">예매 일자</th>
			      <th scope="col">이용 예정 일자</th>
			      <th scope="col">총 수량</th>
			      <th scope="col">할인 적용 여부</th>
			      <th scope="col"></th>
			      <th scope="col" >예매 취소</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:choose>
			  		<c:when test="${not empty paging.dataList }">
			  			<c:forEach items="${paging.dataList }" var="res">
						    <tr class="resTr" data-code="${res.res_code_encode }">
						      <th scope="row">${res.res_code }</th>
						      <td>${res.res_date }</td>
						      <td>${res.res_predate }</td>
						      <td>${res.res_cnt }</td>
						      <td>${not empty res.sale_id ? "할인 적용" : "-" }</td>
						      <td>
						      	<input type="button" class="btn-style btn-view" value="상세 보기" />
						      </td>
						      <td>${not empty res.res_cancel ? "환불 완료" : "-"}</td>
						    </tr>
					    </c:forEach>
				   </c:when>
				   <c:otherwise>
				   		<tr>
				   			<td colspan="7">예매한 내역이 없습니다.</td>
				   		</tr>
				   </c:otherwise>
				</c:choose>
			  </tbody>
			</table>
		</div>
	</div>
</section>
<div class="pagination blog-pagination justify-content-center">
	${paging.pagingHTMLBS }
</div>
<form id="searchTicket" action="${WCP }/customer/use-info/reserveInfo" method="post">
	<input type="hidden" name="date_start" value="${paging.searchMap.date_start }" />
	<input type="hidden" name="date_end" value="${paging.searchMap.date_end }" />
	<input type="hidden" name="page" />
	<input type="hidden" name="user_id" value="${paging.searchMap.user_id }"/>
</form>
<script type="text/javascript">
	let end = new Date().toISOString().substring(0,10);
	$("input[name='date_end']").val(end);
	let start = new Date();
	start.setMonth(start.getMonth() - 3);
	start = start.toISOString().substring(0,10);
	
	let min_date = new Date();
	min_date.setMonth(min_date.getMonth() - 12);
	min_date = min_date.toISOString().substring(0,10);
	
	$("input[name='date_start']").val(start);
	$("input[name='date_start']").attr("min", min_date);
	let searchURI = $("#searchTicket").attr("action");
	
	$(document).on("click", ".btn-view", function(){
		let res_code_encode = $(this).parents(".resTr").data("code");
		location.href = "${WCP}/customer/use-info/reserveInfo/reserveView?res_code_encode="+res_code_encode;
	});
	
	let searchTicket = $("#searchTicket");
	$(document).on("change", ":input[type='date']", function(){
		let date = $(this).val();
		let name = $(this).attr("name");
		
		searchTicket.find("input[name='"+name+"']").val(date);
	});
	
	// 페이지 검색
	$(document).on("click", ".pagination a", function(){
		let page = $(this).data("page");
		searchTicket.find("input[name='page']").val(page);
		searchTicket.submit();
	})
	
	// 날짜 검색
	$(document).on("click", ".btn-search", function(){
		searchTicket.find("input[name='page']").val("");
		searchTicket.submit();
	});
	
	$(document).on("submit", "#searchTicket", function(event){
		event.preventDefault();
		
		$.ajax({
			url : searchTicket.attr("action"),
			method : searchTicket.attr("method"),
			data : searchTicket.serialize(),
			dataType : "json",
			success : function(resp) {
				$(".res-list tbody").empty();
				console.log(resp);
				let code = "";
				$(resp.dataList).each(function(idx, res){
					code += '<tr class="resTr" data-code="'+res.res_code+'">                             ';
				    code += '  <th scope="row">'+res.res_code +'</th>                                     ';
				    code += '  <td>'+res.res_date +'</td>                                                 ';
				    code += '  <td>'+res.res_predate +'</td>                                              ';
				    code += '  <td>'+res.res_cnt +'</td>                                                  ';
				    let sale = "할인 적용"
				    if(res.sale_id == null){
				    	sale = "-";
				    }
				    
				    code += '  <td>'+sale+'</td>                    ';
				    code += '  <td><input type="button" class="btn-style btn-view" value="상세 보기" /></td>';
				    code += '  <td>                                                                      ';
				   	let cancel = "환불 완료"
				    if(res.res_cancel == null || res.res_cancel.length < 1){
				    	cancel = "-";
				    }
				    
				    code += cancel;
				    code += '  </td>                                                                     ';
				    code += '</tr>';
					
				})
				console.log(code);
				$(".res-list tbody").append(code);
				
				
			},
			error : function(xhr, error, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}

		});
		
		return false;
	});
</script>
