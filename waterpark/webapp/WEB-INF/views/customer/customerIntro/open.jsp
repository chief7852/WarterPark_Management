<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

.openCont{
	width: 1000px;
	height: 800px;
	margin-left: auto;
	margin-right: auto;	
}
#openImg{
	width: 1000px;
	height: 600px;
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
#blog{
	padding-top: 0px;
}
</style>

<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>개장 정보</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="blog.html">이용 정보</a></li>
            <li>예매</li>
          </ol>
        </div>

      </div>
</section>
<section id="blog" class="blog pricing ">
      <div class="container" data-aos="fade-up">

        <div class="row">
        <div class="col-lg-12 entries">
        <div class="entry">
<br><br>
<div class="introTop">
	<div class="openCont" style="position: relative;">
	
		<img id="openImg" src="${WCP }/resources/customer-assets/img/open1.png">
	</div>
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