<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>

.headPart{
	margin : 30px;
}

.email-content{
	width:100%;
	height:500px;
}

</style>
<!--main content start-->

<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> 쪽지 상세보기
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="index.html">홈</a></li>
					<li><i class="fa fa-laptop"></i>쪽지</li>
					<li><i class="fa fa-laptop"></i>상세보기</li>
				</ol>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-9 col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<c:choose>
								<c:when test="${not empty email }">
									<strong class="headPart">제목 : ${email.email_title}</strong>
									<strong class="headPart">보낸이 : ${email.sender_name}</strong>
									<strong class="headPart">송신 날짜 : ${email.send_date}</strong>
									<strong class="headPart">수신 날짜: ${email.receive_date}</strong>
									<c:url value="/emp/sendEmail" var="sendUrl">
										<c:param name="sender_id" value="${email.receiver_id}" />
										<c:param name="email_no" value="${email.email_no}" />
									</c:url>
								</c:when>
								<c:when test="${not empty emailList }" >
									<strong class="headPart">제목 : ${emailList[0].email_title}</strong>
									<strong class="headPart">수신 날짜: ${emailList[0].receive_date}</strong>
									<strong class="headPart">송신 날짜 : ${emailList[0].send_date}</strong><br>
									<strong class="headPart">받은 사람 : 
									<c:forEach items="${emailList}" var="email"> 
										${email.receiver_id}
										(${email.receiver_name})
									</c:forEach>
									</strong><br>
									<strong class="headPart">
										내가 전송한 파일 : 
									</strong>
									<c:forEach items="${emailList[0].fileList}" var ="file">
										<c:url value="/download" var="downloadURL">
											<c:param name="what" value="${file.file_no}" />
											<c:param name="order" value="${file.file_ord}" />
										</c:url>
										<a href="${downloadURL}"><span>${file.file_origin}</span></a>
									</c:forEach>
									<c:url value="/emp/sendEmail" var="sendUrl">
										<c:param name="sender_id" value="${emailList[0].receiver_id}" />
										<c:param name="email_no" value="${emailList[0].email_no}" />
									</c:url>
									
								</c:when>
							</c:choose>
						</h2>
					</div>
					<div class="panel-body">
						<div class="email-content">
						<c:choose>
							<c:when test="${not empty email }">
								${email.email_cont }
							</c:when>
							<c:when test="${not empty emailList }">
								${emailList[0].email_cont}
							</c:when>
						</c:choose>
						</div>
					<%-- <input class="answer btn btn-success mr-2"  type="button" value="답장하기 "
							data-gopage="${sendUrl}" /> --%>
						
						<%-- <input class="answer btn btn-success mr-2"  type="button" value="답장하기 "
								data-gopage="<c:url value='${WCP}/emp/sendEmail'/>" /> --%>
						<%-- <form id="buttons" method="post">
							<input class="replyBtn btn btn-success mr-2" type="button" value="답장하기" data-gopage="${sendUrl}"/>
							<input type="hidden" name="_method" value="delete" />
							<input type="hidden" name="email_no" value="${email.email_no}"/> 
							<button type="submit" class="btn btn-success mr-2" class="delete">삭제하기</button>
						</form> --%>
					</div>
					</div>
				</div>
			</div>
	</section>
</section>
