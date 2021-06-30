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
.li3{
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
	<h2>대전역</h2>
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
		<a target="_blank" href="https://map.naver.com/v5/directions/14185910.25364815,4346449.112592176,
		%EB%8C%80%EC%A0%84%EC%97%AD%20%EA%B2%BD%EB%B6%80%EC%84%A0(%EA%B3%A0%EC%86%8D%EC%B2%A0%EB%8F%84),
		13479709,PLACE_POI/14184328.860093888,4345414.322636198,%EB%8C%80%EB%8D%95%EC%9D%B8%EC%9E%AC%EA%B0%9C%EB%B0%9C%EC%9B%90,12454435,
		PLACE_POI/-/transit?c=14184619.1924578,4345921.5284880,15,0,0,0,dh">
			<img class="img" src="${WCP }/resources/customer-assets/img/load2.png">
		</a>
	</div>
	<br>
	<div>
	<p>
		<img class="img2" src="${WCP }/resources/customer-assets/img/car.png">
	</p>	
	<div class="txt">
		<h4 id="h4">대전역 출발</h4>
		<p id="p">⊙ 중앙로 → 대종로 → 중교로</p>
	<hr>	
	</div>
	</div>
		<div>
	<p>
		<img class="img2" src="${WCP }/resources/customer-assets/img/bus.png">
	</p>	
	<div class="txt">
		<h4 id="h4">대전역 출발</h4>
		<p id="p">⊙ <span class="blue">지하철</span>(중구청역 하차) → 도보 100m</p>
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