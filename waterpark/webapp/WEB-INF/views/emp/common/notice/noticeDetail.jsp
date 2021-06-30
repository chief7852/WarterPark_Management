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

.noticeDetail {
	width: 90%;
	height: 300px;
	border: 1px solid;
	text-align: left;
	color: black;
	margin: auto;
	padding: auto;
}

.blue1 {
	background: #E0FFFF;
	border: 1px solid;
	width: 30px;
	text-align: center;
}

.panel-default {
	height: 700px;
	margin: 0;
	padding: 0;
}

.panel-body {
	height: 100%;
}

.dTd {
	vertical-align: middle;
	border: 1px solid;
}

#contTd {
	width: 90%;
	height: 150px;
	vertical-align: top;
}

#h33 {
	margin-left: 80px;
}

#buttonDiv {
	margin-left: 750px;
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
					<li><i class="fa fa-laptop"></i>상세보기</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-15">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-flag-o red"></i><strong>공지사항 상세보기</strong>
						</h2>
					</div>
					<div class="panel-body">
					<form action="${WCP }/emp/notice/noticeDelete" method="get">
						<h3 id="h33">상세보기</h3>
						<br>
						<table class="noticeDetail">
							<tbody id="detailBody">
								<tr>
									<td class="blue1" class="dTd">제목</td>
									<td class="dTd" colspan="3">
										${empNoticeDetail.report_title }</td>
								</tr>
								<tr>
									<td class="blue1" class="dTd">등록일</td>
									<td class="dTd">${empNoticeDetail.report_date}</td>
									<td class="blue1" class="dTd">작성자</td>
									<td class="dTd">${empNoticeDetail.emp_name }</td>
								</tr>
								<tr>
									<td class="blue1" class="dTd">첨부파일</td>
									<td class="dTd" colspan="3">${empNoticeDetail.file_no }</td>
								</tr>
								<tr>
									<td class="dTd" id="contTd" rowspan="3" colspan="4">
										${empNoticeDetail.report_cont }</td>
								</tr>
							</tbody>
						</table>
						<br>

						<div id="buttonDiv">
							<a href="/waterpark/emp/notice?lreportCode=NT"
								class="btn btn-primary">목록</a>
							<a href="/waterpark/emp/notice/noticeDelete?report_no=${empNoticeDetail.report_no }"
							 class="btn btn-danger" role="button">삭제</a>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
