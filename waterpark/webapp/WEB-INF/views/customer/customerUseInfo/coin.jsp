<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.coin{
	width:1000px;
	height:2350px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;		
}
.coin2{
	width:1010px;
	height:930px;
	border: 1px solid;
	margin-left: auto;
	margin-right: auto;	
}
#img1{
	width:1000px;
	height:928px;
	margin-left: auto;
	margin-right: auto;
}
.img{
	width:155px;
	height: 155px;
}
dl{
	width:1000px;
	height: 175px;
}
dt {
  float: left;
  width: 170px;
  height: 155px;
  padding: 0;
  margin: 0;
}
dd {
  width: 550px;
  height: 98px;
  margin-right: 750px;
  padding: 50px;
}
hr{
	width:775px;
	margin-left: 155px;
}
h3{
	text-align: left;
}
p{
	text-align: left;
	width: 750px;
}
.img2{
	width:495px;
	height:285px;
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
<br><br><br><br>	
	<div class="coin">
		<h1>포켓코인 소개</h1>
		<br>
		<div class="coin2">
			<img id="img1" src="${WCP }/resources/customer-assets/img/coin.png">
		</div>	
	<br><br>
	
	<img class=img2 src="${WCP }/resources/customer-assets/img/charge.png">
	<img class=img2 src="${WCP }/resources/customer-assets/img/charge2.png">
	
	<br><br><br>	
	<div class="coinCont">
		<dl>
			<dt>
				<img class="img" src="${WCP }/resources/customer-assets/img/coin1.png">			
			</dt>
			<dd>
				<h3>포켓코인이란?</h3>
				<p>ㆍ워터파크 내 모든시설을 이용함에 있어 사용되는 화폐</p>
			</dd>
		</dl>
		<hr>
		<dl>
			<dt>
				<img class="img" src="${WCP }/resources/customer-assets/img/coin2.png">
			</dt>
			<dd>
				<h3>충전 방법</h3>
				<p>ㆍ신용/체크카드로 1만원 단위로 충전(20,000원 O , 12,000원 X)</p>
			</dd>
		</dl>
		<hr>
		<dl>
			<dt>
				<img class="img" src="${WCP }/resources/customer-assets/img/coin3.png">
			</dt>
			<dd>
				<h3>충전시 유의사항</h3>
				<p>ㆍ충전 시 락카 키와 별도로 코인밴드로 충전되며 결재수단은 한 가지로만 가능합니다.<p>
				<p>ㆍ법인카드 이용시 사용제한이 있을수도 있으니, 직원에게 문의 바랍니다.</p>
			</dd>
		</dl>
		<hr>
		<dl>
			<dt>
				<img class="img" src="${WCP }/resources/customer-assets/img/coin4.png">
			</dt>
			<dd>
				<h3>환불 방법</h3>
				<p>ㆍ신용/체크카드 : 카드사 영업일 기준 2~3일 이내 미사용 금액 자동 환불</p>
				<p>(사용내역은 현장 또는 홈페이지에서 조회 가능)</p>
			</dd>
		</dl>						
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