<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script type="text/javascript" src="${WCP}/resources/ckeditor/ckeditor.js"></script>
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
					<li><i class="fa fa-laptop"></i>공지사항</li>
					<li><i class="fa fa-laptop"></i>글쓰기</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-13 col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-flag-o red"></i><strong>공지사항 등록</strong>
						</h2>
					</div>
					<div class="panel-body">
						<form action="${WCP }/emp/notice/noticeInsert" method="post">
						<div>
							<input type="hidden" name="report_no" class="form-control" required>
						</div>
						<div>
							<input type="hidden" name="emp_id" value="${sessionScope.EmpVO.emp_id}" class="form-control">
						</div>
						<div>
						<label for="report_title" class="col-form-label">제목:</label>
						
						<textarea rows="1" cols="100" name="report_title"></textarea>				
						</div>
						<div class="mb-3">
						<label for="recipient-name" class="col-form-label">내용</label><br>
						<textarea rows="10" cols="100" name="report_cont"></textarea>
						</div>
						<div>
							<input type="hidden" name="report_date" value="20210618" class="form-control">
						</div>						
						<div>
							<input type="hidden" name="lreport_code" value="NT" class="form-control">
						</div>
						<div>
							<input type="hidden" name="report_del" value="N" class="form-control">
						</div>
						<div>
							<input type="hidden" name="report_app_need" value="N" class="form-control">
						</div>
						<input class="goBtn btn btn-success mr-2" type="button" 
						value="목록" data-gopage="<c:url value='/emp/notice?lreportCode=NT' />" />
						<button type="reset" class="btn btn-warning mr-2">재입력</button>
						<button type="submit" class="btn btn-primary sendBtn" >등록</button>
						</form>
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

CKEDITOR.replace('report_cont',{
	filebrowserUploadUrl: '${WCP}/emp/noticeImages?type=Images'
		
});
</script>
