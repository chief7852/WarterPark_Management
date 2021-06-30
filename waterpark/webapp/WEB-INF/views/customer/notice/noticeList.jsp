<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${WCP }/resources/customer/common/css/viewform.css" rel="stylesheet">
<%-- <link href="${WCP }/resources/customer/common/css/commonview.css" rel="stylesheet"> --%>
<link href="${WCP }/resources/customer/common/css/viewcomunity.css" rel="stylesheet">
<style>
.goBtn{
	float:right;
	width: 100px;
	height: 30px;
}
.text-left{

}
.sub_content{
	font-size: x-large;
	height: 700px;
}
#header{
  z-index: 1;
}
#customer-cover-section{
  width: 100%;
  height: 100%;
  text-align: center;
  position: relative;
  z-index: 1;

}
#customer-cover-section::after {
  width: 100%;
  height: 100%;
  content: "";
   background-image: url("${WCP}/resources/customer/common/img/notice.jpg");

  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;

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
   display: flex;
   flex-direction: column;
   justify-content: space-between;
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
	margin-left : 460px;
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
.back-image{
	padding: 60px 0;
}
.tbl_list{
    margin-top: -165px;
}
.btn-primary{
	color: white;
}
</style>
<section>
<br>
<div class="back-image">
<div class="sub_content">
    <div class="board_search">
        <fieldset>
            <legend>공지사항</legend>
 
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
                    <th scope="col">작성일</th>
                    <th scope="col" class="last">조회수</th>
                </tr>
            </thead>
		<tbody >
			<c:choose>
				<c:when test="${not empty noticeList }">
					<c:forEach var="notice" items="${noticeList }">
						<tr align="center">
							<td class="noticeno">${notice.uboard_no }</td>
							<td class="text-left">
							<a href="noticeDetail?uboard_no=${notice.uboard_no}">
							${notice.uboard_title }	              
							</a>
							</td>
							<td>${notice.file_no }<i class="bi bi-file-earmark-arrow-down-fill"></i></td>
							<td>${notice.uboard_date }</td>
							<td class="noticeno">${notice.uboard_hit }</td>
						</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				나오나여?
			</c:otherwise>
	</c:choose>
        </table>
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

    </div>
    <!-- //board e -->
    <!-- paging -->
    <div class="paging tc">
    
    <a href="#ankpoint"><i class="bi bi-chevron-double-left"></i></a><a href="#ankpoint"><i class="bi bi-chevron-left"></i></a><strong>1</strong> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=2"><span>2</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=3"><span>3</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=4"><span>4</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=5"><span>5</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=6"><span>6</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=7"><span>7</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=8"><span>8</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=9"><span>9</span></a> <a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=10"><span>10</span></a><a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=2"><i class="bi bi-chevron-right"></i></a><a href="/Pages/Community/Notice/Notice.aspx?mid=3&amp;pid=&amp;Se=All&amp;Sestr=&amp;page=11"><i class="bi bi-chevron-double-right"></i></a>
    <c:if test="${not empty EmpVO }">
	<input class="goBtn btn btn-primary mr-2" type="button" 
	value="새글쓰기" data-gopage="<c:url value='/customer/use-info/noticeForm' />" />
</c:if>
    </div>
    <!-- //paging -->
</div>
</div>
<!-- 글쓰기 버튼 클릭 -->

</section>
<script>
$(window).scroll(function() {
	if($(this).scrollTop() > 300){
		$(".quickmenu").addClass("scroll");
	}else{
		$(".quickmenu").removeClass("scroll");
	}
});

$(".goBtn").on("click", function(){
	let url = $(this).data("gopage");
	if(url)
		location.href = url;
});
</script>
