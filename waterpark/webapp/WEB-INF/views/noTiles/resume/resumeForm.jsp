<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript"
	src="${WCP}/resources/customer-assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${WCP}/resources/customer-assets/js/myjQueryPlugin.js"></script>
<script type="text/javascript"
	src="${WCP}/resources/customer-assets/js/jquery.form.min.js"></script>
<meta charset="UTF-8">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>이력서</title>
<style>
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
	height:16%;
}

.fileForm{
	margin:auto;
	text-align: center;
}

body {
	min-width: 1000px ;
}

table {
	margin: auto ;
}

.first {
	margin-top: 50px ;
}

input {
	border: none ;
}

.second {
	margin-bottom: 50px ;
}

.buttons {
	position: fixed ;
	right: 0 ;
	margin: auto 20px ;
}

.buttons-modal{
	float:right;
	padding:
}

.inputTag {
	text-align: center ;
	width: 100% ;
}

.first-width {
	width: 180px ;
}

.width-50 {
	width: 50px ;
}

.width-70 {
	width: 70px ;
}

.width-85 {
	width: 85px ;
}

.width-100 {
	width: 100px ;
}

.width-200 {
	width: 200px ;
}

.width-790 {
	width: 790px ;
}

.width-1000 {
	width: 1000px ;
}

.height-113 {
	height: 113px ;
}

.height-70 {
	height: 70px ;
}
.input-last{
	width:30px;
}
</style>
</head>
<body>
	<div id="pdf">
		<form:form modelAttribute="resume" id="resumeForm" action="${WCP}/emp/makeresume">
			<input type="hidden" name="emp.response_name" value="${resume.emp.response_name}"/>
			<div class="resume">
				<table border="1" class="first width-1000">
					<tr>
						<td rowspan="5" class="width-85 height-113"></td>
						<th colspan="9"><font size="5"> 개인 정보 현황 </font></th>
					</tr>
					<tr>
						<th rowspan="3" class="width-85 height-70" bgcolor="D5D5D5">성명</th>
					</tr>
					<tr>
						<th colspan="2" bgcolor="D5D5D5">한글</th>
						<td class="width-85"><input type="text" name="emp.emp_name" value="${resume.emp.emp_name}" /></td>
						<th bgcolor="D5D5D5">생 년 월 일</th>
						<th colspan="2" class="width-85" bgcolor="D5D5D5">E-mail</th>
					</tr>
					<tr>
						<th colspan="2" bgcolor="D5D5D5">한문</th>
						<td><input type="text" name="emp_chinese" value="${resume.emp_chinese}"/></td>
						<td><input type="text" name="birth" value="${resume.emp_birth }"/></td>
						<td colspan="2"><input type="text" name="emp.emp_mail" value="${resume.emp.emp_mail }" /></td>
					</tr>
					<tr>
						<th colspan="2" class="width-50" bgcolor="D5D5D5">연락처</th>
						<td colspan="2"><input type="text" class='inputTag'
							name="emp_hp" value="${resume.emp_hp }"/></td>
						<th colspan="1" class="width-50" bgcolor="D5D5D5">긴급 연락처(핸드폰)</th>
						<td colspan="2"><input type="text" class='inputTag'
							name="emergency_call" value="${resume.emergency_call}"/></td>
					</tr>
					<tr>
						<th bgcolor="D5D5D5">현주소</th>
						<td colspan="8"><input type="text" class='inputTag'
							name="address" style="width: 100%;" value="${resume.address}" /></td>
					</tr>
				</table>
				<table border="1" class="second" width="1000">
					<tr>
						<th colspan="5" class="width-790" bgcolor="D5D5D5">학력사항</th>
					</tr>
					<tr class="degreeTable">
						<th bgcolor="D5D5D5">학위</th>
						<th bgcolor="D5D5D5">기간</th>
						<th bgcolor="D5D5D5">학교명</th>
						<th bgcolor="D5D5D5">전공</th>
						<th bgcolor="D5D5D5">졸업</th>
					</tr>
					<c:if test="${not empty resume.degrees}">
						<c:forEach items="${resume.degrees}"  var="degree">
							<tr>
								<td><input type='text' class='inputTag' value="${degree.eh_degree}" /></td>
								<td><input type='text' class='inputTag' value="${degree.eh_date}" /></td>
								<td><input type='text' class='inputTag' value="${degree.eh_name}" /></td>
								<td><input type='text' class='inputTag' value="${degree.eh_major}" /></td>
								<td><input type='text' class='inputTag' value="${degree.eh_complete}" /></td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<th colspan="5" bgcolor="D5D5D5">전공경력사항</th>
					</tr>
					<tr class="experienceTable">
						<th class="first-width" bgcolor="D5D5D5">회사</th>
						<th class="width-200" bgcolor="D5D5D5">주소</th>
						<th class="width-100" bgcolor="D5D5D5">기간</th>
						<th class="width-100" bgcolor="D5D5D5">담당업무</th>
						<th colspan="2" class="width-70" bgcolor="D5D5D5">자격증</th>
					</tr>
					<c:if test="${not empty resume.careers}">
						<c:forEach items="${resume.careers}"  var="career">
							<tr>
								<td><input type='text' class='inputTag' value="${career.career_com}" /></td>
								<td><input type='text' class='inputTag' value="${career.career_com_addr}" /></td>
								<td><input type='text' class='inputTag' value="${career.career_start}${career.career_end}" /></td>
								<td><input type='text' class='inputTag' value="${career.career_position}" /></td>
								<td><input type='text' class='inputTag'  value="${career.lisence}" /></td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td colspan="5">
							<p style="text-align: center">위 기재 사항은 사실과 틀림이 없습니다.</p> <br />
							<br />
							<p style="text-align: center">20
							<input type="text" class="input-last" name="cont_year" value="${resume.cont_year}"/>
							년                                              
							<input type="text" class="input-last" name="cont_month" value="${resume.cont_month}"/>
							월                                              
							<input type="text" class="input-last" name="cont_date" value="${resume.cont_date}"/>
							일</p>
							<br /> <br />
							<p style="text-align: right">(인)&nbsp;&nbsp;&nbsp;</p>
						</td>
					</tr>
				</table>
			</div>
			<input type="hidden" id="pdf_content" name="pdf_content" />
			<input type="hidden" id="emp_id" name="emp_id"
				value="${resume.emp_id}" />
		</form:form>
		</div>
</body>
<script>
	$(document).ready(function(){
		  let pdfFormValue = $(".resume").html();
		  $("#pdf_content").val(pdfFormValue);
		  let resumeData = $("#resumeForm").serialize();
		  /* createInput(); */
		   $.ajax({
			url : "${WCP}/emp/makeresume",
			type : "post",
			datType:'json',
			data : resumeData,
			success : function(resp){
				if(resp.result == "OK"){
					Swal.fire({
					   title: '이력서 생성 성공',
					   text: '5초 뒤에 자동으로 창이 닫힙니다.',
					   icon: 'warning',
					   showCancelButton: true,
					   confirmButtonColor: '#3085d6',
					   cancelButtonColor: '#d33',
					})	
					setTimeout(function() {
						  window.close();
						}, 5000);
				}else{
					
				}
			},error : function(){
				console.log("tlfvofasdasd"); 	
			}
		  }) 	 	
	});
</script>
</html>