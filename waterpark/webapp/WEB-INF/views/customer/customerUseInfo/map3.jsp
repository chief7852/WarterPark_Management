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
.li2{
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
	<h2>세종시청</h2>
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
		<a target="_blank" href="https://map.naver.com/v5/directions/14169754.355761785,4366872.908768782,
		%EC%84%B8%EC%A2%85%ED%8A%B9%EB%B3%84%EC%9E%90%EC%B9%98%EC%8B%9C%EC%B2%AD,
		21817929,PLACE_POI/14184328.860093888,4345414.322636198,%EB%8C%80%EB%8D%95%EC%9D%B8%EC%9E%AC%EA%
		B0%9C%EB%B0%9C%EC%9B%90,12454435,PLACE_POI/-/car?c=14169115.6379195,4356126.1443992,11,0,0,0,dh">
			<img class="img" src="${WCP }/resources/customer-assets/img/load3.png">
		</a>
	</div>
	<br>
	<div>
	<p>
		<img class="img2" src="${WCP }/resources/customer-assets/img/car.png">
	</p>	
	<div class="txt">
		<h4 id="h4">세종시청 출발</h4>
		<p id="p">⊙ 구즉세종로 → 천변도시고속화도로 → 대전천동쪽자전거2길</p>
	<hr>	
	</div>
	</div>
		<div>
	<p>
		<img class="img2" src="${WCP }/resources/customer-assets/img/bus.png">
	</p>	
	<div class="txt">
		<h4 id="h4">세종시청 출발</h4>
		<p id="p">⊙ <span class="red">급행 B1(BRT)</span>버스 (대전역 하차) → <span class="blue">201번</span>버스 (중구청역 하차)</p>
	<hr>	
	</div>
	</div>		
</div>
</div>
</div>
</div>
</div>
</div>

</section>