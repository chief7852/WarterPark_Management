<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.form-control {
	width: 15%;
}

.allCheckBox {
	margin-left: 7px !important;
	margin-right: 10px !important;
}

.table {
	height: 300px;

	
}

.panel-default {
	height: 700px;
	margin: 0;
	padding: 0;
}

.panel-body {
	height: 100%;
}
td{
	vertical-align: middle;
}
</style>
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Dashboard
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="${WCP}/emp">홈 </a></li>
					<li><i class="fa fa-laptop"></i>공지사항</li>
					<li><i class="fa fa-laptop"></i>목록</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-15">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-flag-o red"></i><strong>공지사항 목록</strong>
						</h2>
					</div>
					<div class="panel-body">
					<h3>공지사항</h3>
						<table class="table">
							<thead>
								<tr align="center">
									<th scope="col">NO</th>
									<th scope="col">제목</th>
									<th scope="col">구분</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody id="listBody">
							<c:choose>
							<c:when test="${not empty empNoticeList }">
								<c:forEach var="empNotice" items="${empNoticeList }">
									<tr align="left"> 
										<td>${empNotice.report_no}</td>
										<td>
										<a href="notice/noticeDetail?report_no=${empNotice.report_no }">
										${empNotice.report_title }
										</a>
										</td>
										<td>${empNotice.lreport_code }</td>
										<td>${empNotice.report_date }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								이게 나오면 안되는데...
							</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<br>
						<input class="goBtn btn btn-success mr-2" type="button" 
						value="새글쓰기" data-gopage="<c:url value='/emp/notice/noticeForm' />" />
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<script>
$(".goBtn").on("click", function(){
	let url = $(this).data("gopage");
	if(url)
		location.href = url;
});
</script>

