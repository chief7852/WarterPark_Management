<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${WCP }/resources/customer/common/css/faqcommon.css" rel="stylesheet">
<link href="${WCP }/resources/customer/common/css/faqui.css" rel="stylesheet">
<style>
#writeBtn{
	float: right;
}
#customer-cover-section{

 background-image: url("${WCP}/resources/customer/common/img/notice.jpg");
}
#contents{
	width: 70%;
    margin-left: 15%;
    margin-top: 2%;
    font-size: x-large;
    background-color: white;
}
.table {
	width: 1000px;
	margin: auto;
	
}
.firstOne.no, .section, .lastOne.title{
	font-size: 21px;
}
.info {
	margin-left: 450px;
	
}

h2 {
	margin-left: 130px;
}

tr.hide {
	display: none;
}

td.hide {
	display: none
}
#writeBtn{
	margin-left : 460px;
}
.quickmenu{
	display: inline-block;
	margin-top:22px;
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
.questionTr>td{
	font-size: 21px;
}
.postscript_area{
	overflow: hidden;
    margin-bottom: 30px;
    background-color: #e7e7e7;
    border-top: 4px solid #4c5365;
    border-bottom: 1px solid #4c5365;
    padding: 30px 21px 20px 21px;
}
.clfix>a{
    border: 1px solid #e7e7e7;
   
}
.clfix>a:hover{
	 color: #007bff;
}
</style>
<br>
<br>
<section>
  
<div id="contents">
				<div> 
				        <div class="postscript_area">
                            <ul class="post_con">
                                <li class="post_title">고객님들의 편의를 알려주기위한 공지 게시판입니다.</li>
                                <li class="post_font">문의사항은 문의글을 작성해주시면 감사하겠습니다. 여러분의 소중한 의견을 기다립니다.<br>
                                   
                                </li>
                            </ul>

                        </div> 
</div>

						<div class="tabStyle boardTab clfix">
							
										<a href="#" class="tab1"><span>전체보기</span></a>
									
										<a href="#" class="tab2"><span>이용정보</span></a>
										
										<a href="#" class="tab3"><span>온라인예매</span></a>
										
										<a href="#" class="tab4 last off"><span>기타</span></a>
										
						</div>

						<!-- 리스트 뿌리기 //-->
					
									<div class="faqContents">
										<h2 class="hidden">구분 별 번호와 제목으로 구성된 자주 묻는 질문 게시판 - 전체보기</h2>
										<table class="listColTable">
											<caption>구분 별 번호와 제목으로 구성된 자주 묻는 질문 게시판</caption>
											<colgroup>
												<col>
												<col>
												<col>
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="firstOne no">번호</th>
													<th scope="col" class="section">구분</th>
													<th scope="col" class="lastOne title">제목</th>
												</tr>
											</thead>
											<tbody>
												
														<tr class="questionTr"><!-- 2013-03-25 질문 tr마다 클래스 추가 -->
															<td class="firstOne">12</td>
															<td>이용정보</td>
															<td class="subjectTd lastOne">
																<div class="question">
																	<p><a href="#">부녀만 가려고 하는데 5살 여자아이 아빠랑 같이 남성 락커룸 입장 가능한가요?</a></p>
																</div>
																<div class="answer">
																	<strong>[답변내용]</strong>
																	<p></p><p style="line-height: 1.2;">어린이 손님의 이성락커 출입은 만 5세 미만, 100cm 이하 손님이라면 가능하십니다.<br>이성락커 출입이 제한될 시, 롯데워터파크에서는 손님의 편의와 안전을 위해 간단한 탈의 등의 도우미 서비스를 실시하고&nbsp;있사오니, 락커룸 입장하실 때 가까운 직원에게 문의 부탁드립니다.</p><p></p>
																</div>
															</td>
														</tr>
													
														<tr class="questionTr"><!-- 2013-03-25 질문 tr마다 클래스 추가 -->
															<td class="firstOne">11</td>
															<td>이용정보</td>
															<td class="subjectTd lastOne">
																<div class="question">
																	<p><a href="#">수영복과 수영 모자를 꼭 착용해야 하나요?</a></p>
																</div>
																<div class="answer">
																	<strong>[답변내용]</strong>
																	<p></p><p>수질 보호와 쾌적한 이용 환경을 위해서 수영복 및 수영모자는 반드시 착용해 주시기 바랍니다.</p><br><p>&nbsp;</p><p></p>
																</div>
															</td>
														</tr>
													
														<tr class="questionTr"><!-- 2013-03-25 질문 tr마다 클래스 추가 -->
															<td class="firstOne">10</td>
															<td>이용정보</td>
															<td class="subjectTd lastOne">
																<div class="question">
																	<p><a href="#">유모차나 휠체어 대여 및 반입이 가능한가요?</a></p>
																</div>
																<div class="answer">
																	<strong>[답변내용]</strong>
																	<p></p><p>유모차는 반입 금지 품목으로 대여는 불가합니다.<br>단, 유모차 보관소에 무료로 보관 후 입장 가능합니다.</p><p></p>
																</div>
															</td>
														</tr>
													
														<tr class="questionTr"><!-- 2013-03-25 질문 tr마다 클래스 추가 -->
															<td class="firstOne">9</td>
															<td>이용정보</td>
															<td class="subjectTd lastOne">
																<div class="question">
																	<p><a href="#">베이비 서비스 센터에 자녀를 맡길 수 있나요?</a></p>
																</div>
																<div class="answer">
																	<strong>[답변내용]</strong>
																	<p></p><p>베이비 서비스 센터는 수유 및 기저귀 교환 등 손님 편의를 위한 공간입니다. 별도로 아이들을 돌봐 드리는 서비스는 제공되지 않습니다.</p><p></p>
																</div>
															</td>
														</tr>
													
														<tr class="questionTr"><!-- 2013-03-25 질문 tr마다 클래스 추가 -->
															<td class="firstOne">8</td>
															<td>이용정보</td>
															<td class="subjectTd lastOne">
																<div class="question">
																	<p><a href="#">입장 시 복장의 규정이 있나요?</a></p>
																</div>
																<div class="answer">
																	<strong>[답변내용]</strong>
																	<p></p><p>롯데워터파크 내에서는 수영복 재질의 옷을 착용하셔야 하며 웨이크복 또는 수상스포츠 전문 웨어를 착용하셔야 합니다. 모자는 수영모자, 야구모자, 두건 등 머리카락을 완전히 덮을 수 있어야 합니다.<br> 강한 급류와 파도로 인해 찰과상의 우려가 있으므로 아쿠아슈즈 착용을 적극 권장합니다.<br>노천탕, 이벤트탕 이용 시 복장은 풀에 입장하시는 것과 동일하게 적용되며, 탕 내에서는 구명 재킷, 튜브 사용을 금지합니다.</p><p></p>
																</div>
															</td>
														</tr>
													
														<tr class="questionTr"><!-- 2013-03-25 질문 tr마다 클래스 추가 -->
															<td class="firstOne">7</td>
															<td>기타</td>
															<td class="subjectTd lastOne">
																<div class="question">
																	<p><a href="#">구명 자켓 사이즈가 어떻게 되나요?</a></p>
																</div>
																<div class="answer">
																	<strong>[답변내용]</strong>
																	<p></p><p>롯데워터파크 구명자켓 사이즈는 일괄로 적용되어 있습니다.<br>구명자켓은 본인의 체중에 맞게 이용하셔야 합니다. </p><br><p>XXL : 체중 100kg~120kg <br><br>XL : 체중 90kg~100kg <br><br>L : 체중 70kg~90kg <br><br>M : 체중 55kg~70kg <br><br>S : 체중 35kg~55kg <br><br>XS : 체중 25kg~35kg <br><br>XXS : 체중 15kg~25kg <br>XXXS : 체중 ~ 15kg </p><br><p>&nbsp;</p>만 12개월 미만 유아 또는 체구가 작은 유아는 대여 구명자켓 사이즈가 맞지 않을 수 있으니, <br>별도준비 필요(부력은 맞으나 사이즈가 안 맞을 수 있음)<p></p>
																</div>
															</td>
														</tr>
													
														<tr class="questionTr"><!-- 2013-03-25 질문 tr마다 클래스 추가 -->
															<td class="firstOne">6</td>
															<td>이용정보</td>
															<td class="subjectTd lastOne">
																<div class="question">
																	<p><a href="#">카바나 이용 시간은 어떻게 되나요? 숙박도 가능한가요?</a></p>
																</div>
																<div class="answer">
																	<strong>[답변내용]</strong>
																	<p></p><p>운영 시간은 개장 시간부터 야외 폐장 시간까지입니다. 숙박시설이 아닌 휴식공간이기 때문에 숙박은 불가합니다.</p><p></p>
																</div>
															</td>
														</tr>
													
														<tr class="questionTr"><!-- 2013-03-25 질문 tr마다 클래스 추가 -->
															<td class="firstOne">5</td>
															<td>기타</td>
															<td class="subjectTd lastOne">
																<div class="question">
																	<p><a href="#">상품점에서 구입할 수 있는 편의 용품은 어떤 것이 있나요?</a></p>
																</div>
																<div class="answer">
																	<strong>[답변내용]</strong>
																	<p></p><p>상품점에서는 수영복, 수영모, 타월, 세면도구세트, 여성용품, 기저귀, 물티슈, 방수팩, 방수 일회용 카메라 등을 판매하고 있습니다.</p><p></p>
																</div>
															</td>
														</tr>
													
														<tr class="questionTr"><!-- 2013-03-25 질문 tr마다 클래스 추가 -->
															<td class="firstOne">4</td>
															<td>이용정보</td>
															<td class="subjectTd lastOne">
																<div class="question">
																	<p><a href="#">음식물을 가지고 들어갈 수 있나요?</a></p>
																</div>
																<div class="answer">
																	<strong>[답변내용]</strong>
																	<p></p><p>워터파크 특성상 쾌적한 환경과 수질관리를 위하여 음식물 반입이 금지됩니다. <br><br> 음식물 보관소에 보관하시고, 입장 후 보관된 음식을 식사할 시에는 외부에 설치된 피크닉 광장을 이용하시기 바랍니다.<br><br>(※ 음식물 보관소 : 성수기 시즌 운영 예정, 음식물 보관소 미운영 시 본관 코인락커 이용 바랍니다.)<br><br> 보관함 1회 이용료 - 냉장 보관함 : 코인 3개 (3천원)&nbsp;<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 일반 보관함 : 코인 2개 (2천원)&nbsp;<br><br> ※ 단 이유식, 환자식, 씨앗과 껍질을 제거한 과일류, 페트병류, 식수, 음료수는 반입 가능<br>※ 유리병류, 취사도구, 오리발, 애완견, 유모차 등 기타 당사가 정한 물품은 반입 금지</p><p></p>
																</div>
															</td>
														</tr>
													
														<tr class="questionTr"><!-- 2013-03-25 질문 tr마다 클래스 추가 -->
															<td class="firstOne">3</td>
															<td>이용정보</td>
															<td class="subjectTd lastOne">
																<div class="question">
																	<p><a href="#">돗자리 반입이 가능한가요?</a></p>
																</div>
																<div class="answer">
																	<strong>[답변내용]</strong>
																	<p></p><p>손님의 안전과 쾌적한 환경을 위하여 돗자리 반입을 제한하고 있습니다.</p><p></p>
																</div>
															</td>
														</tr>
													
											</tbody>
										</table>
										<div class="paging">
											<a href="list.asp?currtPg=1&amp;cmsCd=CM0323&amp;pDvsn=" class="btn_first" title="처음페이지 이동">처음</a>
<a class="btn_page on" href="#;" title="1 페이지">1</a>
<a href="list.asp?currtPg=2&amp;cmsCd=CM0323&amp;pDvsn=" class="btn_page" title="2 페이지">2</a>
<a href="list.asp?currtPg=2&amp;cmsCd=CM0323&amp;pDvsn=" class="btn_last" title="마지막페이지 이동">마지막</a>

										</div>
																			<c:if test="${not empty EmpVO }">
<button type="button" class="btn btn-primary" id="writeBtn"
	data-bs-toggle="modal" data-bs-target="#insertModal"
	data-bs-whatever="@mdo">글쓰기</button>
</c:if>
									</div>

			</div>
<br>

	
<!-- 등록 모달창 -->
<div class="modal fade" id="insertModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">FAQ 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="${WCP }/customer/use-info/faqInsert" method="post">
					<div>
						<input type="hidden" name="uboard_no" class="form-control" required>
					</div>
					<div>
						<label for="uboard_title" class="col-form-label">제목:</label>
						<textarea rows="1" cols="55" name="uboard_title"></textarea>				
					</div>
					<div>
						<input type="hidden" name="llost_code" class="form-control">
					</div>
					<div class="mb-3">
						<input type="hidden" name="luboard_code" value="FQ" class="form-control" required> 
					</div>
					<div class="mb-3">
						 <input type="hidden" class="form-control" name="uboard_del" value="N">
					</div>
					<div>
						<input type="hidden" name="uboard_date" class="form-control" value="21/06/02" required>
					</div>
					
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">내용</label><br>
						<textarea rows="10" cols="55" name="uboard_cont"></textarea>
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

<script type="text/javascript">
	$(function() {
		$("a[name='trigger']").click(function() {
			var i = $("a[name='trigger']").index(this);
			if (!$(this).is(':hidden'))
				$("tr[name='article']").eq(i).show('fast');
			$("tr[name='article']").hide();
	
		})	
});
	$(window).scroll(function() {
		if($(this).scrollTop() > 300){
			$(".quickmenu").addClass("scroll");
		}else{
			$(".quickmenu").removeClass("scroll");
		}
	});
	
	$(document).on("click",".question",function(){
		$(this).parent('.lastOne').find(".answer").toggle()
	})
</script>

