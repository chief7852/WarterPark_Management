<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
	.clauseListForm{
		width:60%;
		margin:130px auto;
	}	
	.clauseList{
		border:1px solid black;
		margin: 30px auto;
		padding : 20px;
		overflow:scroll; 
		height:800px;
	}
	.title{
		font-weight: 600;
	}
	
	.allCheckBox{
		margin-top:10px;
	}
</style>

<div class="clauseListForm">
	<c:choose>
		<c:when test="${not empty clauseList}">
			<div class="title">약관 내용</div>
			<label>전체 동의</label><input class = "allCheckBox" type="checkbox" id="checkall"/>
			<c:forEach items="${clauseList}" var="clauseVO" varStatus="status">
				<div class="clauseList">
					<span class="title">${clauseVO.clause_title }</span>
					<br><br>
					${clauseVO.clause_cont }
					<br><br>
					<div class="agreement${status.index}" data-require="${clauseVO.clause_require}" data-num="${clauseVO.clause_no}">
						<input type="radio" name="agree${status.index}" class="agree" value="Y"><label>동의</label>
						<input type="radio" name="agree${status.index}" class="agree" value="N"><label>비동의</label>
					</div>
				</div>
			</c:forEach>
			
		</c:when>
	</c:choose>
	<button type="button" class="submitBtn btn  btn-info">다음으로</button>
</div>

<script>
	$(".submitBtn").on("click",function(){
		let agreeList = [];
		let checks = $(".agree:checked");
		$(checks).each(function(index,check){
			let classes = ".agreement"+index;
			let idx = $(check).parents($(".clauseList")).find($(classes)).data("num");
			let require = $(check).parents($("")).data("require");
			agreeList.push
			({clause_no : idx,
				agreement_check : $(check).val(),
				clause_require : require});
		});
		
		let URL = "/waterpark/customer/clause";
		$.ajax({
			url : URL,
			data : {
				agreementList :JSON.stringify(agreeList),
			},
			type : "post",
			dataType : "json",
			success : function(resp){
				if(resp.result == "OK"){
					location.href="/waterpark/customer/join";
				}else{
					Swal.fire({
					  title: '필수 항목 선택 누락',
					  text: '필수 항목에 대해 동의해주세요!',
					  icon: 'warning',
					  showCancelButton: false,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					});
				}
			},error : function(){
				alert("error!");
			}			
		}) 
	}); 
	
	$('.allCheckBox').on("click",function(){
		$(".agree").attr("");
		$('input:radio[class=agree]:input[value="Y"]').attr("checked", true);
		var offset = $('.submitBtn').offset();
		$('html').animate({scrollTop : offset.top}, 100);
	});
	
	
	
</script>
