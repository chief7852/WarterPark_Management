<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.info{
	margin-left: 450px;		
}
.mapCont{
	width:1000px;
	height:1200px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;		
}
.mapTab{
	width:1000px;
	height:50px;
	list-style: none;
	margin: auto;
	padding: 0;
	
}
.li1, .li2, .li3, .li4{
	width: 250px;
	height: 50px;
	float: right;
	border: 1px solid;
	padding: auto;	
}
.a{
  text-decoration: none;
  color: inherit;
  display: inline-block;
  line-height: 300%;
  
}
#mapTab{
	border: 1px solid;
	margin: auto;
}
.li4{
	background:#99FFFF;
}
.img{
	width: 1000px;
	height: 500px;
}
.img2{
	width: 190px;
	height: 200px;
	float: left;
}
.txt{
	width: 750px;
	height: 200px;
	float:right;
	text-align: left;
	margin-left: 20px;
	vertical-align: bottom;
}
#h4, #p{
	  line-height: 350%;
}
#p{
	height: 100px;
}
.red{
	color: red;
}
.blue{
	color: blue;
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
<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h1 class="info">오시는 길</h1>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="blog.html">이용 정보</a></li>
            <li>예매</li>
          </ol>
        </div>

      </div>
</section>
<section id="blog" class="blog pricing " style="padding-top: 0px;">
      <div class="container" data-aos="fade-up">

        <div class="row">
        <div class="col-lg-12 entries">
        <div class="entry">

<div class="introTop">

<br><br>
<div class="mapCont">
	<h2>현충원</h2>
<br>
	<div id="mapTab">
	<ul class="mapTab">
		<li class="li1"><a class="a" href="/waterpark/customer/use-info/map4">대전 IC</a></li>
		<li class="li2"><a class="a" href="/waterpark/customer/use-info/map3">세종시청</a></li>
		<li class="li3"><a class="a" href="/waterpark/customer/use-info/map2">대전역</a></li>
		<li class="li4"><a class="a" href="/waterpark/customer/use-info/map">현충원</a></li>
	</ul>
	</div>
	<div>
		<a target="_blank" href="https://map.naver.com/v5/directions/14170663.513175044,4351290.56319049,
		%EA%B5%AD%EB%A6%BD%EB%8C%80%EC%A0%84%ED%98%84%EC%B6%A9%EC%9B%90,12382008,PLACE_POI/14184328.860093888,
		4345414.322636198,%EB%8C%80%EB%8D%95%EC%9D%B8%EC%9E%AC%EA%B0%9C%EB%B0%9C%EC%9B%90,
		12454435,PLACE_POI/-/car?c=14173794.3293258,4348184.7083294,12,0,0,0,dh">
			<img class="img" src="${WCP }/resources/customer-assets/img/load1.png">
		</a>
	</div>
	<br>
	<div>
	<p>
		<img class="img2" src="${WCP }/resources/customer-assets/img/car.png">
	</p>	
	<div class="txt">
		<h4 id="h4">현충원 출발</h4>
		<p id="p">⊙ 현충원로 → 한밭대로 → 유등로</p>
	<hr>	
	</div>
	</div>
		<div>
	<p>
		<img class="img2" src="${WCP }/resources/customer-assets/img/bus.png">
	</p>	
	<div class="txt">
		<h4 id="h4">현충원 출발</h4>
		<p id="p">⊙ <span class="red">1002번</span> 버스(월드컵 경기장역 하차) → <span class="blue">지하철</span>(중구청역 하차) → 도보 100m</p>
	<hr>	
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