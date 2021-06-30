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
	height:140px;
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
	height:25px;
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

.plus-degree, .plus-experience, .sub-experience, .sub-degree{
	position:relative;
	float:right;
}

</style>
</head>
<body>
	<div id="pdf">
		<div class="buttons">
			<button type="button" class="enroll">이력서 생성</button>
			<button type="button" class="fileEnroll">이력서 등록</button>
		</div>
		<br>
		<form:form modelAttribute="resume" id="resumeForm">
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
						<td><input type="text" name="emp_chinese" /></td>
						<td><input type="text" name="emp_birth" /></td>
						<td colspan="2"><input type="text" name="emp.emp_mail" value="${resume.emp.emp_mail }" /></td>
					</tr>
					<tr>
						<th colspan="2" class="width-50" bgcolor="D5D5D5">연락처</th>
						<td colspan="2"><input type="text" class='inputTag'
							name="emp_hp" value="${resume.emp.emp_hp }"/></td>
						<th colspan="1" class="width-50" bgcolor="D5D5D5">긴급 연락처(핸드폰)</th>
						<td colspan="2"><input type="text" class='inputTag'
							name="emergency_call" /></td>
					</tr>
					<tr>
						<th bgcolor="D5D5D5">현주소</th>
						<td colspan="8"><input type="text" class='inputTag'
							name="address" style="width: 100%;" /></td>
					</tr>
				</table>
				<table border="1" class="second" width="1000">
					<tr>
						<th colspan="5" class="width-790" bgcolor="D5D5D5">학력사항<button type="button" class="sub-degree">학력 삭제</button><button type="button" class="plus-degree">학력 추가</button></th>
					</tr>
					<tr class="degreeTable">
						<th bgcolor="D5D5D5">학위</th>
						<th bgcolor="D5D5D5">기간</th>
						<th bgcolor="D5D5D5">학교명</th>
						<th bgcolor="D5D5D5">전공</th>
						<th bgcolor="D5D5D5">졸업</th>
					</tr>
					<tr>
						<th colspan="5" bgcolor="D5D5D5" class="width-790">전공경력사항	<button type="button" class="sub-experience">경력 삭제</button><button type="button" class="plus-experience">경력 추가</button></th>
					</tr>
					<tr class="experienceTable">
						<th class="first-width" bgcolor="D5D5D5">회사</th>
						<th class="width-200" bgcolor="D5D5D5">주소</th>
						<th class="width-100" bgcolor="D5D5D5">기간</th>
						<th class="width-100" bgcolor="D5D5D5">담당업무</th>
						<th colspan="2" class="width-70" bgcolor="D5D5D5">자격증</th>
					</tr>
					<tr>
						<td colspan="5">
							<p style="text-align: center">위 기재 사항은 사실과 틀림이 없습니다.</p> <br />
							<br />
							<p style="text-align: center">20
							<input type="text" class="input-last" name="cont_year"/>
							년
							<input type="text" class="input-last" name="cont_month"/>
							월
							<input type="text" class="input-last" name="cont_date"/>
							일</p>
							<br /> <br />
							<p style="text-align: right">(인)&nbsp;&nbsp;&nbsp;</p>
						</td>
					</tr>
				</table>
			</div>
			<input type="hidden" id="pdf_content" name="pdf_content" />
			<input type="hidden" id="emp_id" name="emp_id" value="${resume.emp.emp_id}" />
		</form:form>
		
		<form:form modelAttribute="resume" id="resumeForm2" method="post">
			<input type="hidden" class="input-last" name="cont_month"/>
			<input type="hidden" class="input-last" name="cont_date"/>
			<input type="hidden" class="input-last" name="cont_year"/>
			<input type="hidden" name="emp.response_name" value="${resume.emp.response_name}"/>
			<input type="hidden" name="emp.emp_name" value="${resume.emp.emp_name}" />
			<input type="hidden" name="emp.emp_mail" value="${resume.emp.emp_mail }" />
			<input type="hidden" class='inputTag' name="emp_hp" value="${resume.emp.emp_hp }"/>
			<input type="hidden" class='inputTag' name="emergency_call" />
			<input type="hidden" class='inputTag' name="emp_birth" />
			<input type="hidden" class='inputTag' name="address" style="width: 100%;" />
			<input type="hidden" name="emp_chinese" />
			<input type="hidden" name="birth" />
		</form:form>
		
		<div id="modal" class="searchModal">
			<div class="search-modal-content">
				<div class="page-header">
					<h1>이력서 등록하기</h1>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="row">
						</div>
					</div>
				</div>
				<hr>
				<div class="fileForm">
					<form:form id="fileEnrollForm" action="${WCP}/emp/resumeenroll" ModelAttribute="resume" method="post" enctype="multipart/form-data">
						<input type="file" name="resume_files"/>
						<input type="hidden" id="emp_id2" name="emp_id" value="${resume.emp.emp_id}" />
						<input type="hidden" name="emp.response_name" value="${resume.emp.response_name}"/>
						<input type="hidden" name="emp.emp_name" value="${resume.emp.emp_name}" />
					</form:form>
				</div>
				<div class="buttons-modal">
					<button class="sendFile" type="button">보내기</button>
					<button class="close" onClick="closeModal();" type="button">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${WCP}/resources/emp-js/resume.js">	</script>
</html>