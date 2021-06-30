<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#qna {
	margin-bottom: 10px;
	
}

.table {
	width: 1000px;
	margin: auto;
}

.info {
	margin-left: 460px;
	
}

h2 {
	margin-left: 460px;
	
}

tr.hide {
	display: none;
}

td.hide {
	display: none
}

#writeBtn {
	margin-left: 460px;
}
.quickmenu{
	display: inline-block;
    position: fixed;
    top: 130px;
    left: 80%;
    margin-left: 120px;
    width: 100px;
    -webkit-transition: all 0.3s;
    transition: all 0.3s;
}
.icon1{
	background: yellow;
	width: 100px;
	height: 100px;
	margin: 0;
	padding: 0;
	border: 0;
	
}
.icon2{
	margin: 0;
	padding: 0;
	border: 0;
	width: 100px;
	height: 100px;
	
}
.icon3{
	margin: 0;
	padding: 0;
	border: 0;
	width: 100px;
	height: 100px;
	
}
.icon4{
	margin: 0;
	padding: 0;
	border: 0;
	width: 100px;
	height: 100px;
	
}
.aa{
  text-decoration: none;
  color: inherit;
  display: block;
  padding-top: 15px;
  height: 37px;
  font-size: 14px;
  font-weight: 600;
  color: #444;
  text-align: center;
  
} 
.quickUl{

	display: inline-block;
    width: 100px;
    border: 1px solid #e1e0e0;
    border-top: 0;
    border-bottom: 2px solid #e1e0e0;
    padding-top: 20px;
    padding : 0;
}
.quickImg{
	width: 100px;
	height: 100px;
}
.icon1, .icon2, .icon3, .icon4{
  text-decoration: none;
  color: inherit;
  display: inline-block; 
  border-bottom: 1px solid #e5e5e5;
}
.quickCont{
	margin:0;
	padding:0;
	border:0;
}
.quickmenu .quickCont{
	position: relative;
    width: 100%;
    font-size: 0;
    line-height: 0;
    z-index: 1;
}
.iconImg{
	width: 30px;
	height: 30px;
	margin:5px;
}
</style>
<section>
	<br><br><br><br>
	<div id="qna" class="qnaForm-header">

		<h2>문의게시판</h2>
		<p class="info">대덕워터파크를 이용하시는 고객님들을 위한 문의게시판입니다.</p>
	</div>
	<table class="table">
		<thead>
			<tr align="center">
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">제목</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody id="listBody">
			<c:choose>
				<c:when test="${not empty qnaList }">
					<c:forEach var="qna" items="${qnaList }">
						<tr class="answer" align="center">
							<td class="qno">${qna.qna_no }</td>
							<td>${qna.lqna_code }</td>
							<td><a href="#readCont" name="trigger">${qna.qna_title }</a></td>
							<td>${qna.qna_date }</td>
						</tr>
						<tr name="article" class="hide">
							<td colspan="3">
								<table>
									<tr>
										<td><a name="readCont" id="readCont">${qna.qna_cont }</a>
											<br>
										<br> <!-- 삭제버튼 위치 -->
											<c:if test="${not empty EmpVO }">
											<button type="button" id="deleteBtn" class="btn btn-danger"
												data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button>
											</c:if>
										</td>
									</tr>
									<tr>
										<td>[답변내용]<br>
										<a name ="readAnswer" id="readAnswer">${qna.qna_answer }</a> <br>
										<br>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
	<br>
<!-- 글쓰기 버튼 클릭 -->
<c:if test="${not empty EmpVO }">
<button type="button" class="btn btn-primary" id="writeBtn"
	data-bs-toggle="modal" data-bs-target="#insertModal"
	data-bs-whatever="@mdo">글쓰기</button>
</c:if>
	
<div class="quickmenu"class="scroll">
	<p class="quickCont">
		<img class="quickImg" src="${WCP }/resources/emp-img/DaeDeokWaterParkLogo.png">
	</p>
	<ul class="quickUl">
	<li class="icon1">
		<a class="aa" href="/waterpark/customer/use-info/reserve">
		<img class="iconImg" src="${WCP}/resources/customer-assets/img/smartReserve.png"><br>스마트 예약</a>
	</li>
	<li class="icon2">
		<a class="aa" href="/waterpark/customer/info/customerIntro">
		<img class="iconImg" src="${WCP}/resources/customer-assets/img/company.png"><br>회사소개</a>
		
	</li>
	<li class="icon3">
		<a class="aa" href="/waterpark/customer/use-info/ticket">
		<img class="iconImg" src="${WCP}/resources/customer-assets/img/credit.png"><br>이용요금</a>
	</li>
	<li class="icon4">
		<a class="aa" href="/waterpark/customer/use-info/map">
		<img class="iconImg" src="${WCP}/resources/customer-assets/img/map.png"><br>오시는길</a>
	</li>
	</ul>	
</div>	
</section>


<!-- 등록 모달창 -->
<div class="modal fade" id="insertModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">문의글 작성하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="${WCP }/customer/qna" method="post">
					<div>
						<input type="hidden" name="qna_no" class="form-control" required>
					</div>
					<div>
<!-- value값 고치기 --><input type="hidden" value="park123" name="user_id"
							class="form-control" required>
					</div>
					<div class="mb-3" id="titleDiv">
						<label for="qna_title" class="col-form-label">제목:</label> 
						<textarea rows="1" cols="55" name="qna_title"></textarea>
					</div>
					<div>
						<label for="lqna_code" class="col-form-label">분류:</label> <select
							id="lqna" name="lqna_code">
							<option value="RF">환불</option>
							<option value="HU">홈페이지 이용</option>
							<option value="LT">분실</option>
							<option value="OT">기타</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">내용:</label><br>
						<textarea rows="10" cols="55" name="qna_cont"></textarea>
					</div>
					<div>
						<input type="hidden" name="qna_answer" class="form-control"
							value="${qna_answer }">
					</div>
					<div>
<!-- value값 고치기 -->						<input type="hidden" name="qna_date" class="form-control"
							value="20210527" required>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="reset" class="btn btn-warning mr-2">재입력</button>
						<button type="submit" class="btn btn-primary" >등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 삭제 모달창 -->
<div class="modal fade" id="deleteModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<form action="${WCP }/customer/qna" method="post" name="deleteForm">
		<input type="hidden" name="_method" value="delete">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삭제 창</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="deleteModalBody">
					<a>게시글을 삭제하시겠습니까?</a><input id="deleteModalHidden" type="hidden"
						name="qna_no" class="form-control" value="${qna.qna_no }">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-danger">확인</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$("a[name='trigger']").click(function() {
			var i = $("a[name='trigger']").index(this);
			if (!$(this).is(':hidden'))
				$("tr[name='article']").eq(i).show('fast');
			$("tr[name='article']").hide();
	    
		let test = $(this).parent("td").siblings(".qno").text();
		console.log(test);
	    $("#deleteModalHidden").attr("value", test)
			
		});
// 		$('#listBody >tr').on('click', function() {

// 			let no = $(this).find('td.eq(0)').text();
// 			$('#deleteModalHidden').val(no);
// 			console.log(no);
// 		})
	});
	$(window).scroll(function() {
		if($(this).scrollTop() > 300){
			$(".quickmenu").addClass("scroll");
		}else{
			$(".quickmenu").removeClass("scroll");
		}
	});
</script>
