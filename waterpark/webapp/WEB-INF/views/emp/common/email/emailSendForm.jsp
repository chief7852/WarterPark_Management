<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript" src="${WCP}/resources/ckeditor/ckeditor.js"></script>

<style>
.head-info {
	width: 100px;
	margin-top: 10px;
	margin-bottom: 10px;
}

#receivers{
	text-indent:1em;
	height:16px;
	width:100%;
}

.info-input {
	width: 90%;
}

.email_receiver {
	border: 1px solid black;
}

.clone-p {
	display: flex;
}

.Areas {
	display: flex;
}

.plusArea {
	display: flex;
}

.fileArea {
	display: flex;
}

.sendBtn {
	margin-left: 20px;
}

.empInfo {
	outline: none;
	border: none;
	width: 20%;
}

.sendBtn {
	width: 10%;
}

.plusBtn {
	width: 35px;
	height: 35px;
}

.select-editable {
	position: relative;
	background-color: white;
	height: 18px;
	border: 1px solid black;
	width:16%;
	margin-top: 10px;
}

.select-editable select {
	position: absolute;
	top: 0px;
	left: 0px;
	font-size: 14px;
	border: none;
	width: 155px;
	margin: 0;
}

.select-editable input {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 138px;
	padding: 1px;
	font-size: 12px;
	border: none;
}

.dropdown-menu1{
	margin-top:20px;
	background-color:#fcf9e8;
	border-radius : 3px;

}

.select-editable select:focus, .select-editable input:focus {
	outline: none;
}

.bunch{
	display:flex;
}

.display-flex{
	display:flex!important;
}
</style>

<section id="main-content">
	<section class="wrapper">
		<form:form modelAttribute="email" id="emailForm" method="post"
			enctype="multipart/form-data">
			<input type="hidden" value="${sessionScope.EmpVO.emp_id}"
				name="sender_id" id="emp_id" />
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">
						<i class="fa fa-laptop"></i> 쪽지
					</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">홈</a></li>
						<li><i class="fa fa-laptop"></i>쪽지</li>
						<li><i class="fa fa-laptop"></i>쪽지 쓰기</li>
					</ol>
				</div>
				<div class="col-lg-12">
					<div class="bunch">
					<label class="head-info">직원 검색</label> 
					<br>
						<div class="select-editable form-control">
						<input class="email_receiver form-control" placeholder="직원 이름 입력" id="receivers" name="format" class="email_receiver" type="text" />
						<ul class="dropdown-menu1" aria-labelledby="dropdownMenuButton2">
  						</ul>
						</div>
						</div>
						<div class="receiver-bucket">
							<c:if test="${not empty email }">
							</c:if>
						</div>
						<div class="display-flex">
							<label class="head-info">제목</label> 
							<input class="email_title info-input form-control" type="text" name="email_title"value="${email.email_title}" />
						</div>
						<form:errors path="email_title" element="span" cssClass="error" />
						<div class="Areas">
							<div class="plusArea">
								<label class="head-info">파일 첨부</label> <span
									class="plusBtn btn btn-secondary">+</span>
							</div>
							<div class="fileArea">
								<p class="clone-p">
									<!-- <input class="form-control" type="file" name="email_files">
							<span class="delBtn btn btn-danger">-</span> -->
								</p>
							</div>
						</div>
						<br>
						<input type="hidden" name="email_cont" id="hidden_email_cont"/> 
						<textarea class="form-control" rows="5" cols="100" name="email_cont" id="email_cont">${email.email_cont }</textarea>
						<form:errors path="email_cont" element="span" cssClass="error" />
					</div>
					<br>
					<!--<input type="button" class="btn btn-info sendBtn" value="이메일 전송"/> -->
					<button type="button" class="btn btn-info sendBtn">쪽지 전송</button>
				</div>
		</form:form>
	</section>
</section>
<script>	
	WCP = "${WCP}";
</script>
<script type="text/javascript" src="${WCP}/resources/emp-js/emailSend.js"></script>
