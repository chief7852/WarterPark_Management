
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--sidebar start-->
<script type="text/javascript" src="${WCP}/resources/customer-assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${WCP}/resources/customer-assets/js/myjQueryPlugin.js"></script>
<script type="text/javascript" src="${WCP}/resources/customer-assets/js/jquery.form.min.js"></script>

<style>

.form-control{
	width:15%;
}

.allCheckBox{
	margin-left : 7px !important;
	margin-right : 10px !important;
}	

.tableBox{
	min-height : 70%;	
}

.panel-default{
	height:700px;
}

.panel-body{
	height:90%;
}

.table-head{
	height:30px;
}	

.email-item td {
	height : 15px;
}

.centering{
	text-align:center;
}

</style>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Dashboard
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="index.html">홈 </a></li>
					<li><i class="fa fa-laptop"></i>이메일</li>
					<li><i class="fa fa-laptop"></i>보낸 메일</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-13 col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-flag-o red"></i><strong>이메일 목록</strong>
						</h2>
					</div>
					<div class="panel-body">
							<div>
								<input class = "allCheckBox" type="checkbox" id="checkall" />
								<input class="goRead btn btn-success mr-2" type="button" value="읽음"/>
								<input class="goDelete btn btn-success mr-2" type="button" value="삭제"/>
							</div>
							<div class="tableBox">
							<table class="table bootstrap-datatable countries">
							<colgroup>
								<col width="4%">
								<col width="7%">
								<col width="16%">
								<col width="16%">
								<col width="16%">
								<col width="16%">
							</colgroup>
							<thead>
								<tr>
									<th class="tableHead"></th>
									<th class="tableHead">번호</th>
									<th class="tableHead">받은사람</th>
									<th class="tableHead centering">제목</th>
									<th class="tableHead centering">날짜</th>
									<th class="tableHead centering">읽음 여부</th>
								</tr> 
							</thead>
							<tbody id="listBody">
								<c:choose>
									<c:when test="${not empty pagingVO.dataList }">
										<c:forEach items="${pagingVO.dataList }" var="email">
											<tr class="email-item">
												<td><input type="checkbox" name="chk" value="${email.email_no}"/></td>
												<td>${email.rnum }</td>
												<c:url value="/emp/emailView/send" var="viewURL">
													<c:param name="what" value="${email.email_no}" />
													<c:param name="sender_id" value="${email.sender_id}" />
												</c:url>
												<td>${email.receiver_name }</td>
												<td><a class="title" href="${viewURL}">
														${email.email_title }
													</a>
												</td>
												<td class="centering">${email.send_date }</td>
												<c:choose>
													<c:when test="${not empty email.receive_date}">
														<td class="centering">${email.receive_date}</td>
													</c:when>
													<c:otherwise>
														<td class="centering"><i class="bi bi-envelope-fill"></i></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
							
						</table>
					</div>
					<table class="table bootstrap-datatable countries">
							<tr>
								<td colspan="8">
									<form id="searchForm" action="${WCP}/emp/email">
										<input type="hidden" name="emp_id" value="${pagingVO.emp_id}" /> 
										<input type="hidden" name="searchType" value="${pagingVO.searchMap.searchType }" /> 
										<input type="hidden" name="searchWord" value="${pagingVO.searchMap.searchWord }" /> 
										<input type="hidden" name="minDate" value="${pagingVO.searchMap.minDate }" /> 
										<input type="hidden" name="maxDate" value="${pagingVO.searchMap.maxDate }" /> 
										<input type="hidden" name="email_type" value="${pagingVO.email_type }" /> 
										<input type="hidden" name="page" />
									</form>
									<div id="searchUI" class="form-inline d-flex justify-content-center">
										<select name="searchType" class="form-control mr-2">
											<option value>전체</option>
											<option value="title">제목</option>
											<option value="sender">작성자</option>
											<option value="content">내용</option>
										</select> 
										<input class="form-control mr-2" type="text" name="searchWord" 
											    value="${pagingVO.searchMap.searchWord }" />
										<input class="form-control mr-2" type="date" name="minDate"
											    value="${pagingVO.searchMap.minDate }" />
										<input class="form-control mr-2" type="date" name="maxDate"
											value="${pagingVO.searchMap.maxDate }" /> 
										<input class="btn btn-primary mr-2" id="searchBtn" type="button"
											value="검색" /> 
										<input class="goBtn btn btn-success mr-2" type="button" value="새글쓰기"
											data-gopage="<c:url value='/emp/sendEmail'/>" />
									</div>
									
									<div id="pagingArea" class="d-flex justify-content-center"> ${pagingVO.pagingHTMLBS }</div>
								</td>
							</tr>
					</table>
				</div>
			</div>
		</div>
		</div>
	</section>
</section>
<script>
//
	$(".goBtn").on("click", function(){
		let url = $(this).data("gopage");
		if(url)
			location.href = url;
	});
//
	let searchUI = $("#searchUI");
	searchUI.find("[name='searchType']").val("${pagingVO.searchMap.searchType }");
	$("#searchBtn").on("click", function(){
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input){
			let name = $(this).attr("name");
			let sameInput = searchForm.find("[name='"+name+"']");
			$(sameInput).val($(this).val());
		});
		searchForm.submit();
	});	
//
	let pagingArea = $("#pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		
		if(page){
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
	
	let listBody = $("#listBody");
	
	let searchForm = $("#searchForm").ajaxForm({
		dataType : 'json'
		, beforeSubmit:function(){
			searchForm.find("[name='page']").val("");
		}, success : function(resp){
			listBody.empty();
			pagingArea.empty();
			let trTags = [];
			if(resp.dataList){
				let viewURLPtrn = "${WCP}/emp/emailView/send?what=%d";
				$(resp.dataList).each(function(idx,email){
					let viewURL = viewURLPtrn.replace("%d", email.email_no);
					let aTag = $("<a>").html(email.email_title).
								attr("href",viewURL);
					if(email.email_del == 'N'){
						aTag.addClass('undeleted');
					}else{
						aTag.addClass("deleted");
					}
					//<input type="checkbox" name="chk" />
					
					let tr = $("<tr>").append(
							$("<td>").html('<input type="checkbox" name="chk" value="'+email.email_no +'""/>' )
							,$("<td>").html(email.rnum)
							,$("<td>").html(email.receiver_name)
							,$("<td>").html(aTag) 
							,$("<td class='centering'>").html(email.send_date)
							,$("<td class='centering'>").html('<c:choose><c:when test="${not empty email.receive_date}">${email.receive_date}</c:when><c:otherwise><i class="bi bi-envelope-fill"></i></c:otherwise></c:choose>')
						).data("email",email).css("cursor","pointer");
			
					trTags.push(tr);
				});
			}else{
				trTags.push(
					$("<tr>").html(
						$("<td>").attr("colspan","7")
					)
				);
			}
			listBody.html(trTags);
			pagingArea.html(resp.pagingHTMLBS);
		},error:function(xhr, resp, error){
			console.log(xhr);
		}
	});
	
	$("#pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
	
	$(document).ready(function(){
	    $("#checkall").click(function(){
	        if($("#checkall").prop("checked")){
	            $("input[name=chk]").prop("checked",true);
	        }else{
	            $("input[name=chk]").prop("checked",false);
	        }
	   	})
	})

	$(".goRead").on("click",function(){
		let emailList = [];
		if(confirm('삭제 처리할까요?')){
			$("input[name=chk]:checked").each(function() { 
				var test = $(this).val(); 
				
				emailList.push(test);
			});
			let readEmailURL = "/waterpark/emp/readEmailCheck"
			$.ajax({
				url : readEmailURL,
				dataType : "json",
				method : "post",
				data : {
					'emailList' : emailList
				},
				success : function(resp){
					if(resp.result == "OK"){
						alert("성공이다!");
					}else{
						alert("실패다!");
					}
				},error : function(){
					alert("에러")
				}
			});
		}else{
			alert("암것도 안일어남")
		}
	})
	
	
	
	
</script>
