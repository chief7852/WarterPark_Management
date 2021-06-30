<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.info {
	text-align: center;
	font-weight: bold;
	
}
.introCont1{
	text-align : center;
	width: 1000px;
	height: 150px;
	margin : auto;
}
.introCont2{
	width: 1000px;
	height: 2000px;
	text-align : center;
	margin : auto;
}
.red{
	color : red;
}
.td1{
	text-align:left;
	vertical-align: top;
}
.blue{
	color : blue;
}
.foodTable{
	width:1000px;
	height:628px;
	border:1px solid;
}
  th, td {
    border: 1px solid;
  }
.icon{
	float:left;
	margin-right:10px;
}
ul{
	 list-style:none;
	 
}
th{
	margin:10px;
}
.tableCont{
	text-align:left;
}
.h5{
	text-align : left;
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
.text1{
	text-align: left;
}
.h3, .h4{
	text-align: left;
}
</style>
<br><br>
<section id="blog" class="blog pricing ">
      <div class="container" data-aos="fade-up">

        <div class="row">
        <div class="col-lg-12 entries">
        <div class="entry">
<br><br>
<div class="introTop">
<h2 class="info">워터파크 소개</h2>
<br>
<img src="${WCP }/resources/customer-assets/img/waterPark.jpg" style="display: block; margin: 0 auto; width:1000px; height:480px;" >
</div>
<br>
<div class="introCont1">
	
	<h3>충청권 최대 워터파크</h3>
	<p class="text1">
	전체 12,000평부지에 실내 2,000평, 실외 8,500평, 광장 및 주차장 등의 고객 편의시설 1,500평으로 이루어져 있으며,
	하루 최대 10,000명을 수용할 수 있는 영남권 최대급 규모를 자랑합니다.<br>
	다양한 물놀이 시설과 편의시설을 갖추고 있으며 사계절 내내 안전하고 건강하게 워터파크의 즐거움을 만끽하실 수 있습니다.<br>
	</p>
</div>
<br>
<div class="introCont2">
	<h2>이용 안내</h2>
	<br>
	<h3><span class="red">[필독!]</span> "안전과 위생을 위한 주의사항"</h3><br>
	<h4 class="h4">워터파크 내 물품 반입 허용 기준 안내입니다.</h4>
	<p class="text1">
	대덕 워터파크에서는 다중 이용시설로써 <span class="blue">'안전'</span>과 <span class="blue">'위생'</span>을 최우선 고려하여 모두에게 보다 쾌적한 워터파크 환경이 되도록 힘쓰고 있습니다.<br>
	깨끗한 환경 및 여름철 식중독 예방을 위해 온도 변화에 취약한 <span class="red">'외부 음식물' 반입을 금하고</span> 있습니다.<br>
	또한 수질 유지, 화재예방 및 안전한 환경 조성을 위하여 <span class="red">'화기류, 칼, 유리병, 바퀴 달린 제품'등의 반입 및 사용이 금지</span>됨을 알려 드립니다.<br>
	입장 시, 반입 불가한 항목의 소지로 인하여 불필요한 입장 지연이 초래되고 있으므로 방문 전 참고하셔서<br>
	모든 과정에서 즐거운 워터파크 경험이 되실 수 있길 바랍니다.<br>
	협조에 감사드립니다.<br>
	<br>
	■ 반입 불가한 항목을 지참하신 경우, 입장전 자율보관소(냉동 제품 X) 유료로 사용 가능하시며 찾아가지 않은 보관 물품을 이용 시간 내 찾지 않을 경우 당일 폐기 처리되며, 분실물은 7일 이후 (당일 포함) 폐기 처리됩니다.
	</p>
<table class="foodTable">
	<colgroup>
		<col width="50%">
		<col>
	</colgroup>
		<thead>
			<tr>
				<th>
				<br>
					<img src="${WCP }/resources/customer-assets/img/food1.png" style="display: block; margin: 0 auto; width:400px; height:200px;" >
					<br>
					<p>반입금지(<span class="red">X</span>)</p>
				</th>
				<th>
				<br>
					<img src="${WCP }/resources/customer-assets/img/food2.png" style="display: block; margin: 0 auto; width:400px; height:200px;" >
					<br>
					<p>반입가능(<span class="blue">O</span>)</p>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="td1">
					<ul class="text1">
					<li>
					<div class="icon">	
						<img src="${WCP }/resources/customer-assets/img/food3.jpg" style="display: block; margin: 0 auto; width:50px; height:50px;">
					</div>
					<div class="tableCont">
					<strong>식사, 간식류</strong>
					<ul>
					<li>김밥, 초밥, 주먹밥, 샌드위치,과자류, 젤리, 사탕 등</li>
					</ul>
					</div>
					</li>
					<br>
					<li>
					<div class="icon">	
						<img src="${WCP }/resources/customer-assets/img/food8.png" style="display: block; margin: 0 auto; width:60px; height:50px;">
					</div>
					<div class="tableCont">
					<strong>유리 용기, 캔</strong>
					<ul>
					<li>유리소재의 모든 제품 및 캔에 담긴 모든 음료류와 음식</li>
					<li>이유식, 환자식도 유리 용기에 반입불가</li>
					</ul>
					</div>										
					</li>
					<br>
					<li>
					<div class="icon">	
						<img src="${WCP }/resources/customer-assets/img/food7.png" style="display: block; margin: 0 auto; width:60px; height:50px;">
					</div>
					<div class="tableCont">
					<strong>기타 반입 불가 물품</strong>
					<ul>
					<li class="liIcon">
					<span class="red">
					개인배드, 매트, 돗자리, 바퀴가 달린 제품(유모차, 수레, 웨건 , 카트, 바퀴 달린 아이스박스 등), 대형 물놀이 용품(가로 세로 1M이상), 칼, 화기류 등<br>
					※ 소시지, 계란, 과자 등 껍질제거 및 용기 보관해도 반입 안됩니다.<br>
					※ 주류안내 (맥주 이외주류 반입금지 성인 1인 기준 700ML)<br>
					※ 대덕 워터파크 입장 시 반입금지 물품은 자율보관소에서 보관 후 입장하실 수 있습니다.<br>
					</span>
					</li>
					</ul>
					</div>										
					</li>
					</ul>
				</td>
				<td class="td1">
					<ul class="text1">
					<li>
					<div class="icon">	
						<img src="${WCP }/resources/customer-assets/img/food5.jpg" style="display: block; margin: 0 auto; width:60px; height:50px;">
					</div>
					<div class="tableCont">
					<strong>과일류</strong>
					<ul>
					<li>씨앗 및 껍질을 완전히 제거한 과일류(밀폐 용기 보관)</li>
					<li>생체로 된 과일만 가능(단, 가공된 식품은 반입 불가능)</li>
					</ul>
					</div>
					</li>
					<br><br>
					<li>
					<div class="icon">	
						<img src="${WCP }/resources/customer-assets/img/food6.png" style="display: block; margin: 0 auto; width:60px; height:50px;">
					</div>
					<div class="tableCont">
					<strong>이유식 및 환자식</strong>
					<ul>
					<li>영/유아가 취식할 수 있는(죽,미음) 음식물에 한 함.</li>
					<li>특정 음식물 이외, 섭취가 불가능한 환자를 대상으로 지정된 음식</li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유리 용기 반입불가</li>
					</ul>
					</div>
					</li>
					<br><br>
					<li>
					<div class="icon">	
						<img src="${WCP }/resources/customer-assets/img/food9.png" style="display: block; margin: 0 auto; width:60px; height:50px;">
					</div>
					<div class="tableCont">
					<strong>음료류</strong>
					<ul>
					<li>PET병에 담긴 음료류</li>
					</ul>
					</div>
					</li>														
					</ul>
				</td>
				</tr>
		</tbody>
</table>
<br><br>
	
	<h3 class="h3">★워터파크에서 반드시 챙겨야할 준비물</h3>
	<br>
	<h5 class="h5">- 수영장 기본 준비물(<span class="red">수영복, 수모</span>)은 반드시 챙겨서 이용해주세요.</h5>
	<br>
	<h5 class="h5">- 고객님의 안전과 낙상사고 예방을 위하여 워터파크내에서 <span class="red">'아쿠아 슈즈/양말 착용'을 권장</span>합니다.<br>
	※ 아쿠아 슈즈는 로고샵에서 구입 가능합니다.(로고샵 - 로비 아쿠아 샵, 별관 로고 샵, 야외 마린샵(위치 - 실내에서 야외 나가는 출입구 옆)<br>
	※ 슬리퍼는 물 안에서 '착용불가' 합니다.<br>
	※ 토렌트 리버와 스톰웨이브(야외 파도풀)의 경우 일반 운동화형, 바닥이 딱딱한 아쿠아 슈즈는 다른 고객에게 상해를 가할 수 있어 통제하고 있습니다.<br>
	(잠시 벗어서 별도 보관 후 이용 권장)
	</h5>
	<br><br>
	
	<h3 class="h3">★워터파크내에서 지켜야 할 이용규칙</h3>
	<br>
	<h5 class="h5">
	- 수영장을 이용 시 수영복 재질의 옷을 착용하셔야 합니다. (웨이크 바지, 래쉬가드 등 수상스포츠 전문 웨어 가능합니다.)<br>
	- 일반적으로 거리에서 입으시는 옷차림으로 물속에 들어가실 수 없습니다.<br>
	- 모자는 수영모자, 야구모자, 두건 등 머리카락을 완전히 덮을 수 있는 것은 가능합니다. (수모는 로고샵에 판매합니다.)<br>
	- 맥주 외 주류 반입을 금지합니다.(성인 1인 기준 700ml)<br>
	- 애완동물을 동반하여 출입하실 수 없습니다.(주변소음 및 청결한 수질 유지를 위해 협조 부탁드립니다)<br>
	- 노약자 및 어린이는 부상의 위험이 있어 일부 놀이시설(슬라이드 전기종, 토렌트리버, 파도풀 등)의 이용이 제한되오니 이점 양해 바랍니다.<br>
	  (노약자: 65세 이상, 어린이: 120cm이하, 토네이도슬라이드 150cm이하)<br>
	- 워터파크 이용 시, 깨끗하게 샤워 후 이용해주시면 청결한 수질 유지에 도움이 됩니다.<br>
	- 공중위생관리법 4조 7항의 시행규칙에 따라 목욕실 및 탈의실에 만 5세 이상의 남, 녀는 동반 입장이 불가합니다.<br>
	(락카 직원의 도움이 필요하신 고객님은 직원에게 문의바랍니다.)<br>
	- 블루원 워터파크에서는 야외 노점판매를 하지 않습니다.<br>
	- 로비 내 로고샵에서 구매한 물품에 한해 교환 및 환불이 가능하며, 이 외 물품에서는 책임을 지지 않으니 이점 참고바랍니다.<br>
	</h5>
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