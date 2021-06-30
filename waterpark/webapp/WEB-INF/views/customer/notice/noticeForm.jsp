<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${WCP}/resources/ckeditor/ckeditor.js"></script>
<style>
.row{
	width: 1000px;
	margin: auto;
}
</style>
<br><br>
<section>
		<div class="row">
			<div class="col-lg-13 col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
						<br>
							<i class="fa fa-flag-o red"></i>공지사항 등록
						</h2>
					</div>
					<div class="panel-body">
						<form action="${WCP }/customer/use-info/noticeInsert" method="post">
						<div>
							<input type="hidden" name="uboard_no" class="form-control" required>
						</div>
						<div>
						<label for="uboard_title" class="col-form-label">제목</label>
						<textarea rows="1" cols="119" name="uboard_title"></textarea>				
						</div>
						<div class="mb-3">
						<label for="recipient-name" class="col-form-label">내용</label><br>
						<textarea rows="10" cols="100" name="uboard_cont"></textarea>
						</div>
						<div>
							<input type="hidden" name="uboard_date" value="20210618" class="form-control">
						</div>						
						<div>
							<input type="hidden" name="luboard_code" value="NT" class="form-control">
						</div>
						<div>
							<input type="hidden" name="uboard_del" value="N" class="form-control">
						</div>
						<div>
							<input type="hidden" name="llost_code" class="form-control">
						</div>
						<input class="goBtn btn btn-success mr-2" type="button" 
						value="목록" data-gopage="<c:url value='/customer/use-info/notice?luboardCode=NT' />" />
						<button type="reset" class="btn btn-warning mr-2">재입력</button>
						<button type="submit" class="btn btn-primary" >등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>	
</section>
<script>
$(".goBtn").on("click", function(){
	let url = $(this).data("gopage");
	if(url)
		location.href = url;
});

CKEDITOR.replace('uboard_cont',{
	filebrowserUploadUrl: '${WCP}/emp/noticeImages?type=Images'
	
});
</script>