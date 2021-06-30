<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.info{
		text-align:center;
}
#ticketTop{
	width:1000px;
	height:3000px;
	margin-left:auto;
	margin-right:auto;
}
.ticketTable{
	width:1000px;
	height:220px;
	text-align: center;
	margin-left:auto;
	margin-right:auto;
}
.rentTable{
	width:1000px;
	height:220px;
	text-align: center;
	margin-left:auto;
	margin-right:auto;	
}
table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
}
.red{
	color:red;
	margin-left:auto;
	margin-right:auto;
}
#saleInfo{
	background:#DDDDDD;
}
.blue{
	color:blue;
}
th{
	background: #FFD9EC;
}
.membershipTable {
	width:1000px;
	height:150px;
	text-align: center;

}
.membershipTable .ltd{
	text-align: left;
}
.cardTable{
	width:1000px;
	height:500px;
	text-align: center;
	margin: auto;
	padding: auto;
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
<section id="blog" class="blog pricing ">
      <div class="container" data-aos="fade-up">

        <div class="row">
        <div class="col-lg-12 entries">
        <div class="entry">
<br><br>
<div class="introTop">
<br><br>
<div id=ticketTop>
	
	<h1 class="info">이용 요금</h1>
<br>
<table class="ticketTable" border="1">
	<thead>
	<tr>
		<th rowspan="2">종류</th>	
		<th colspan="3">주간권(종일)</th>	
		<th colspan="3">야간권(14:30)</th>
	</tr>
	<tr>
		<th>성인</th>
		<th>청소년</th>
		<th>소인/경로</th>
		<th>성인</th>
		<th>청소년</th>
		<th>소인/경로</th>
	</tr>			
	</thead>
	<tbody>
		<tr>
			<td>일일이용권</td>
			<td>56,000원</td>
			<td>47,000원</td>
			<td>44,000원</td>
			<td>46,000원</td>
			<td>40,000원</td>
			<td>37,000원</td>
		</tr>
		<tr>
			<td>유공자우대권</td>
			<td>40,000원</td>
			<td>31,000원</td>
			<td>28,000원</td>
			<td>30,000원</td>
			<td>21,000원</td>
			<td>18,000원</td>		
		</tr>
		<tr>
			<td>장애인우대권</td>
			<td>41,000원</td>
			<td>32,000원</td>
			<td>29,000원</td>
			<td>31,000원</td>
			<td>22,000원</td>
			<td>19,000원</td>		
		</tr>
		<tr>
			<td>군인우대권</td>
			<td>41,000원</td>
			<td>32,000원</td>
			<td>29,000원</td>
			<td>31,000원</td>
			<td>22,000원</td>
			<td>19,000원</td>		
		</tr>
		<tr>
			<td>다자녀우대권</td>
			<td>44,000원</td>
			<td>35,000원</td>
			<td>32,000원</td>
			<td>34,000원</td>
			<td>25,000원</td>
			<td>22,000원</td>		
		</tr>								
	</tbody>
</table>
<br>
<p><span class="red">※현장매표소에서는 제휴카드, 장애인/국가유공자/다자녀/문화누리카드 요금으로만 구매 가능합니다.<br>
			방문 전 홈페이지에서 예약일을 지정해주시고, 우대 조건 및 증빙서류를 미리 확인해주세요.</span></p>
<br>
<h3>★우대정보</h3>	

<div id="saleInfo">
	<ul>
		<li>
			<strong>연령에 따른 우대</strong>&nbsp;(나이 확인이 가능한 신분증 또는 서류 제시)
			<br>
			- 경로 : 만 65세 ~
			<br>
			- 소인 : 36개월 ~ 만 12세
			<br>
			- 36개월 미만 : 무료 이용
		</li>
		<li>
			<strong>장애인 우대</strong>&nbsp;(방문일 예약 후 현장매표소 결제)
			<br>
			- 장애인등록증 제시 후 1일 이용권 우대가로 구입 가능
			<br>
			- 장애의 정도가 심한 장애인 : 본인 + 동반 1인
			<br>
			- 장애의 정도가 심하지 않은 장애인 : 본인
		</li>
		<li>
			<strong>국가유공자 우대</strong>&nbsp;(방문일 예약 후 현장매표소 결제)
			<br>
			- 증명서류 제시
			<br>
			- 본인 한정 이용권 우대가로 구입가능
		</li>
		<li>
			<strong>다자녀 가정 우대</strong>&nbsp;(방문일 예약 후 현장매표소 결제)
			<br>
			- 건강보험증, 등본 등 다자녀 증명서류 제시
			<br>
			- 우대 대상 : 막내 자녀가 만 15세 이하인 3명 이상의 다자녀 가정의 부부와 직계자녀
			<br>
			- 해당 가정 내 일부 가족만 이용 시에도 혜택 적용
		</li>
	</ul>
</div>
<br><br>
<h1 class="info">연간이용권(멤버십) 요금</h1>
<br>
<table class="ticketTable">
	<thead>
		<tr>
			<th>종류</th>
			<th>구분</th>
			<th>신규</th>
			<th>재가입</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan="2">레귤러<br>(regular)</td>
			<td>대인/청소년</td>
			<td>220,000원</td>
			<td>170,000원</td>
		</tr>
		<tr>
			<td>소인</td>
			<td>180,000원</td>
			<td>130,000원</td>
		</tr>
		<tr>
			<td rowspan="2">셀렉트<br>(select)</td>
			<td>대인/청소년</td>
			<td>140,000원</td>
			<td>140,000원</td>
		</tr>
		<tr>
			<td>소인</td>
			<td>120,000원</td>
			<td>120,000원</td>
		</tr>
		<tr>
			<td>시니어<br>(senior)</td>
			<td>만 65세 이상</td>
			<td>120,000원</td>
			<td>120,000원</td>
		</tr>			
	</tbody>
</table>
<p><span class="red">※ 재가입 혜택은 레귤러만 적용 가능하며, 만기 후 1년 이내 가입 시 제공된다. 
예) 2021.01.01일 만기 시 2022.01.01까지만 재가입 혜택 가능</span></p>
<p><span class="red">※ 레귤러권 이외 다른 권종에서 레귤러권으로 재가입시에는 연차 적용이 가능하다. 예)셀렉트 2년차 만료 후 1년 이내 레귤러 가입 시 레귤러 3년차 혜택 제공</span></p>
<p><span class="red">※ 소인 : 만 3세 ~ 12세, 시니어 : 만 65세 이후 가입 가능합니다.</span><br>
<span class="red">&nbsp;&nbsp;&nbsp;소인, 시니어 신규 가입 시에는 나이 확인을 위해 필수 서류 지참후 현장가입만 가능하다.</span><br>
<span class="red">&nbsp;&nbsp;&nbsp;필수 서류 - 주민등록등본, 건강보험증, 자동차 운전 면허증, 여권</span></p>
<br>
<h3>★연간이용권 혜택</h3>
<table class="membershipTable">
<thead>
	<tr>
		<th>종류</th>
		<th>내용</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>공통</td>
		<td class="ltd"> 
		- 워터파크 1년동안 무제한 이용 가능(단, 셀렉트권은 약 300여일 이용 가능)<br>
		- 포인트 적립이 가능하다.<br>
		- 가입기간 내 이벤트 참여 기회가 제공된다.
		</td>
	</tr>
	<tr>
		<td>레귤러(연차혜택)</td>
		<td class="ltd"> 
		- 재가입시 가입비 5만원 할인 혜택을 제공한다.<br>
		- 3~4년차 : 가입비 5만원 할인, 포인트 10,000점 적립 혜택을 제공한다.<br>
		- 5년차 이상 : 가입비 5만원 할인, 포인트 30,000점 적립 혜택을 제공한다.
		</td>
	</tr>
	<tr>
		<td>셀렉트</td>
		<td class="ltd"> 
		- 1년 중 약 300여일 이용이 가능하다.(성수기 휴일, 샌드위치데이, 크리스마스 등 혼잡일 이용 제한한다.)<br>
		- 불가일 이용 시 본인 이용권 40% 우대한다.
		</td>
	</tr>		
</tbody>	
</table>
<br><br><br>
<h3>★제휴카드</h3>
<table class="cardTable">
	<thead>
		<tr>
			<th rowspan="2">종류</th>
			<th rowspan="2">적용 대상</th>
			<th rowspan="2">유형</th>
			<th rowspan="2">할인률</th>
			<th colspan="4">최종 결제 금액</th>
		</tr>
		<tr>
			<th>구분</th>
			<th>대인</th>
			<th>청소년</th>
			<th>소인/경로</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan="2">KB국민카드</td>
			<td rowspan="2">당사 전 회원</td>
			<td rowspan="2">현장 결제</td>
			<td rowspan="2">최대 60% 할인</td>
			<td>주간권</td>
			<td>22,400원</td>
			<td>18,800원</td>
			<td>17,600원</td>
		</tr>
		<tr>
			<td>야간권</td>
			<td>18,400원</td>
			<td>16,000원</td>
			<td>14,800원</td>
		</tr>
		<tr>
			<td rowspan="2">현대M포인트</td>
			<td rowspan="2">당사 전 회원</td>
			<td rowspan="2">현장 결제/온라인결제</td>
			<td rowspan="2">50%(포인트 차감)</td>
			<td>주간권</td>
			<td>28,000원</td>
			<td>-</td>
			<td>-</td>
		</tr>
		<tr>
			<td>야간권</td>
			<td>23,000원</td>
			<td>-</td>
			<td>-</td>
		</tr>
		<tr>
			<td rowspan="2">KT멤버십</td>
			<td rowspan="2">당사 전 회원(본인)</td>
			<td rowspan="2">현장 결제</td>
			<td rowspan="2">30%(포인트 차감)</td>
			<td>주간권</td>
			<td>32,900원</td>
			<td>32,900원</td>
			<td>30,800원</td>
		</tr>
		<tr>
			<td>야간권</td>
			<td>32,200원</td>
			<td>28,000원</td>
			<td>25,900원</td>
		</tr>
		<tr>
			<td rowspan="2">LGU+멤버십</td>
			<td rowspan="2">당사 전 회원(본인)</td>
			<td rowspan="2">현장결제</td>
			<td rowspan="2">60%(포인트 차감)</td>
			<td>주간권</td>
			<td>39,200원</td>
			<td>32,900원</td>
			<td>30,800원</td>
		</tr>
		<tr>
			<td>야간권</td>
			<td>32,200원</td>
			<td>28,000원</td>
			<td>25,900원</td>
		</tr>		
		<tr>
			<td rowspan="2">KB국민카드</td>
			<td rowspan="2">당사 전 회원</td>
			<td>온라인 결제</td>
			<td>최대 60%</td>
			<td rowspan="2">주간권</td>
			<td>22,400원</td>
			<td>18,800원</td>
			<td>17,600원</td>
		</tr>
		<tr>
			<td>현장결제</td>
			<td>최대 55%</td>
			<td>25,200원</td>
			<td>21,150원</td>
			<td>19,800원</td>
		</tr>						
	</tbody>
</table>
<p><span class="red">※ 제휴 카드사의 정책에 따라 상이한 할인을 받을 수 있다.</span></p>
<p><span class="red">※ 스낵/대여물 등 일부 시설에서는 제휴 카드를 사용할 수 없다.(별도 요금)</span></p>
<p><span class="red">※ 타 할인 프로모션 및 우대사항과 중복 할인을 받을 수 없다.</span></p>
<p><span class="red">※ 당일 결제 1회에 한하여 적용된다.</span></p>
<br><br>
<h3>★대여요금</h3>
<table class="rentTable">
	<thead>
		<tr>
			<th>종류</th>
			<th>이용요금</th>
			<th>대여료</th>
			<th>보증금</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>구명자켓</td>
			<td>5,000원</td>
			<td>5,000원</td>
			<td>-</td>
			<td>-</td>
		</tr>
		<tr>
			<td>튜브</td>
			<td>5,000원</td>
			<td>5,000원</td>
			<td>-</td>
			<td>-</td>
		</tr>
		<tr>
			<td>모자</td>
			<td>10,000원</td>
			<td>10,000원</td>
			<td>-</td>
			<td>조기 소진 될 수 있습니다.</td>
		</tr>				
	</tbody>
</table>
<p class="blue">⊙ 스마트 예약을 통해 빌리지 대여가 가능합니다. (방문 예정일 1일 전까지 예약 가능,방문 당일 환불 및 취소 불가)</p>

<p class="blue">⊙ 잔여분이 있는 경우에만 현장에서 대여할 수 있습니다.</p>

<p class="blue">⊙ 빌리지 보증금 5천원 별도부과(단, 데이베드는 보증금 제외)</p>

<p class="blue">⊙ 상황에 따라 운영 시설 및 시즌별 요금이 변경될 수 있습니다.</p>
		
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
</div>
</div>
</div>
</div>
</div>

</section>
<script>

$(window).scroll(function() {
	if($(this).scrollTop() > 300){
		$(".quickmenu").addClass("scroll");
	}else{
		$(".quickmenu").removeClass("scroll");
	}
});

</script>

