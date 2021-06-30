<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="${WCP }/resources/customer/common/css/viewform.css" rel="stylesheet">
<%-- <link href="${WCP }/resources/customer/common/css/commonview.css" rel="stylesheet"> --%>
<link href="${WCP }/resources/customer/common/css/viewcomunity.css" rel="stylesheet">
<style>
.text-left{

}
tr.hide {
	display: none;
}
td.hide {
	display: none
}
a {
	text-decoration: none;
}

.sub_content{
	font-size: x-large;
}
#customer-cover-section{

 background-image: url("${WCP}/resources/customer/common/img/notice.jpg");
}
fieldset{
margin-right: 22px;
}
.tc{
	text-align: center;
}
.board_search{
    padding-top: 80px;
}
.sub_content{
	width: 70%;
    margin-left: 15%;
    background-color: white;
   
}
.table {
	width: 1000px;
	margin: auto;
}
.listForm{
	width: 1000px;
	margin: auto;
}
.info {
	margin-left: 460px;
	
}
h2 {
	margin-left: 130px;
}
#writeBtn{
	float: right;
	width: 70px;
    height: 30px;
    color: white;
}
.quickmenu{
    margin-top: 22px;
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
td{
	border: 1px solid #dee2e6;
}
td>a{
	font-size: large;
}
th{
	text-align: center;
	font-size: x-large;
}
</style>
<br>
<br>
<br>
<section>
<div class="back-image">
<div class="sub_content">
    <div class="board_search">
        <fieldset>
            <legend>분실물</legend>
 
            <label for="Module1_ctl00_DropSerch" class="blind"></label>
            <select name="Module1$ctl00$DropSerch" id="Module1_ctl00_DropSerch" title="구분선택" class="category_select">
	<option selected="selected" value="All">전체</option>
	<option value="TITLE">제목</option>
	<option value="CONTENTS">내용</option>

</select>
            <span class="input_form">
                <label for="Module1_ctl00_search_board" class="value_txt" style="left: 9px; top: 5px; cursor: text; position: absolute; visibility: visible;">검색어 입력</label>
                <input name="Module1$ctl00$search_board" type="text" id="Module1_ctl00_search_board" class="input1" style="width: 130px;vertical-align:baseline;">
            </span>
            <a id="Module1_ctl00_ImgSearch" type="button" class="btn_type1" title="게시판 검색" href="javascript:__doPostBack('Module1$ctl00$ImgSearch','')" style="vertical-align:baseline;"><span>검색</span></a>
        </fieldset>
    </div>
    <!-- //게시판 검색폼 -->
    <!-- board s -->
    <div class="tbl_list">
        <table summary="번호, 제목, 첨부파일, 작성일, 조회수로 구분된 공지사항 리스트">

            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col" class="title">제목</th>
                    <th scope="col">첨부파일</th>
                    <th scope="col">분류</th>
                    
                    <th scope="col" class="last">습득일</th>
                </tr>
            </thead>
<tbody id="listBody">
			<c:choose>
				<c:when test="${not empty lostList }">
					<c:forEach var="lost" items="${lostList }">
						<tr align="center">
							<td class="lostno">${lost.uboard_no }</td>
							<td><a href="#readCont" name="trigger">${lost.uboard_title }</a></td>
							<td>${lost.file_no }<i class="bi bi-file-earmark-arrow-down-fill"></i></td>
							<td>${lost.llost_code }</td>
							<td>${lost.uboard_date }</td>
							<td class="noticeno">${lost.uboard_hit }</td>
						</tr>
						<tr name="article" class="hide">
							<td colspan="3"><a name="readCont"
								id="readCont">${lost.uboard_cont }</a>
								
							<br>
							<c:if test="${not empty EmpVO }">
							<a href="/waterpark/customer/use-info/lostDelete?uboard_no=${lost.uboard_no }"
							 class="btn btn-danger" role="button">삭제</a>	
							</c:if>	
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				
			</c:otherwise>
			</c:choose>
		</tbody>
        </table>
<!--         <table class="table bootstrap-datatable countries"> -->
<!-- 		<tr> -->
<!-- 			<td colspan="8"> -->
<%-- 				<form id="searchForm" action="${WCP}/customer/use-info/lost?luboardCode=LO"> --%>
<%-- 					<input type="hidden" name="searchType" value="${pagingVO.searchMap.searchType }" /> --%>
<%-- 					<input type="hidden" name="searchWord" value="${pagingVO.searchMap.searchWord }" /> --%>
<%-- 					<input type="hidden" name="minDate" value="${pagingVO.searchMap.minDate }" /> --%>
<%-- 					<input type="hidden" name="maxDate" value="${pagingVO.searchMap.maxDate }" /> --%>
<!-- 					<input type="hidden" name="page" /> -->
<!-- 				</form> -->
<!-- 				<div id="searchUI" class="form-inline d-flex justify-content-center"> -->
<!-- 				<div id="btnArea"> -->
<%-- 				<c:if test="${not empty EmpVO }"> --%>
				
<%-- 				</c:if> --%>
<!-- 				</div> -->
<!-- 					<select name="searchType" class="form-control mr-2"> -->
<!-- 						<option value>전체</option> -->
<!-- 						<option value="title">제목</option> -->
<!-- 						<option value="cont">내용</option> -->
<!-- 						<option value="llostCode">분류</option>					 -->
<!-- 					</select>  -->
<%-- 					<input class="form-control mr-2" type="text" name="searchWord" value="${pagingVO.searchMap.searchWord }" />  --%>
<%-- 					<input class="form-control mr-2" type="date" name="minDate" value="${pagingVO.searchMap.minDate }" />  --%>
<%-- 					<input class="form-control mr-2" type="date" name="maxDate"value="${pagingVO.searchMap.maxDate }" />  --%>
<!-- 					<input class="btn btn-primary mr-2" id="searchBtn" type="button" value="검색" /> -->
<!-- 					</div>	 -->

	</table>
	<!-- 등록 모달창 -->
<div class="modal fade" id="insertModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">분실물 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="${WCP }/customer/use-info/lostInsert" method="post">
					<div>
						<input type="hidden" name="uboard_no" class="form-control" required>
					</div>
					<div>
						<label for="uboard_title" class="col-form-label">제목</label>
						<input type="text" class="form-control" name="uboard_title" style="width:470px;height:40px;" required>				
					</div>
					<div>
						<label for="llost_code" id="llostCode" class="col-form-label">분류:</label> 
						<select id="llost" name="llost_code">
							<option value="LE">전자기기</option>
							<option value="LV">귀중품</option>
							<option value="LC">의류</option>
							<option value="LS">신발</option>
							<option value="LG">안경</option>
							<option value="LO">기타</option>
						</select>
					</div>
					<div class="mb-3">
						<input type="hidden" name="luboard_code" value="LO" class="form-control" required> 
					</div>
					<div class="mb-3">
						 <input type="hidden" class="form-control" name="uboard_del" value="N">
					</div>
					<div>
						<input type="hidden" name="uboard_date" value="20210617" class="form-control" required>
					</div>

					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">내용</label><br>
						<textarea rows="10" cols="63" name="uboard_cont" style="width:470px;height:300px;"></textarea>
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
</div>
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
   <div class="paging tc">
    
    <a href="#ankpoint"><i class="bi bi-chevron-double-left"></i></a><a href="#ankpoint"><i class="bi bi-chevron-left"></i></a><strong>1</strong> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=2"><span>2</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=3"><span>3</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=4"><span>4</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=5"><span>5</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=6"><span>6</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=7"><span>7</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=8"><span>8</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=9"><span>9</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=10"><span>10</span></a><a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=2"><i class="bi bi-chevron-right"></i></a><a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=11"><i class="bi bi-chevron-double-right"></i></a>
    <c:if test="${not empty EmpVO }">
	<button type="button" class="btn btn-primary mr-2" id="writeBtn"
					data-bs-toggle="modal" style="float: right;" data-bs-target="#insertModal"
					data-bs-whatever="@mdo">글쓰기</button>
</c:if>
    </div>
</section>

<script type="text/javascript">
	$(function() {
		$("a[name='trigger']").click(function() {
			var i = $("a[name='trigger']").index(this);
			if (!$(this).is(':hidden'))
				$("tr[name='article']").eq(i).show('fast');
			$("tr[name='article']").hide();

		})
	});

	let searchUI = $("#searchUI");
	searchUI.find("[name='searchType']").val(
			"${pagingVO.searchMap.searchType }");
	$("#searchBtn").on("click", function() {
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input) {
			let name = $(this).attr("name");
			let sameInput = searchForm.find("[name='" + name + "']");
			$(sameInput).val($(this).val());
		});
		searchForm.submit();
	});

	let pagingArea = $("#pagingArea").on("click", "a", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		console.log("내가 받은 페이지 : " + page);
		if (page) {
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
	
	$(window).scroll(function() {
		if($(this).scrollTop() > 300){
			$(".quickmenu").addClass("scroll");
		}else{
			$(".quickmenu").removeClass("scroll");
		}
	});
	
	
</script>

        
    </div>
    <!-- //board e -->
    <!-- paging -->
        <!-- //paging -->
</div>
</div>
</section>






