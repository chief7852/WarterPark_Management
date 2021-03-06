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
<h2 class="info">???????????? ??????</h2>
<br>
<img src="${WCP }/resources/customer-assets/img/waterPark.jpg" style="display: block; margin: 0 auto; width:1000px; height:480px;" >
</div>
<br>
<div class="introCont1">
	
	<h3>????????? ?????? ????????????</h3>
	<p class="text1">
	?????? 12,000???????????? ?????? 2,000???, ?????? 8,500???, ?????? ??? ????????? ?????? ?????? ???????????? 1,500????????? ???????????? ?????????,
	?????? ?????? 10,000?????? ????????? ??? ?????? ????????? ????????? ????????? ???????????????.<br>
	????????? ????????? ????????? ??????????????? ????????? ????????? ????????? ?????? ???????????? ???????????? ??????????????? ???????????? ???????????? ??? ????????????.<br>
	</p>
</div>
<br>
<div class="introCont2">
	<h2>?????? ??????</h2>
	<br>
	<h3><span class="red">[??????!]</span> "????????? ????????? ?????? ????????????"</h3><br>
	<h4 class="h4">???????????? ??? ?????? ?????? ?????? ?????? ???????????????.</h4>
	<p class="text1">
	?????? ????????????????????? ?????? ?????????????????? <span class="blue">'??????'</span>??? <span class="blue">'??????'</span>??? ????????? ???????????? ???????????? ?????? ????????? ???????????? ????????? ????????? ????????? ????????????.<br>
	????????? ?????? ??? ????????? ????????? ????????? ?????? ?????? ????????? ????????? <span class="red">'?????? ?????????' ????????? ?????????</span> ????????????.<br>
	?????? ?????? ??????, ???????????? ??? ????????? ?????? ????????? ????????? <span class="red">'?????????, ???, ?????????, ?????? ?????? ??????'?????? ?????? ??? ????????? ??????</span>?????? ?????? ????????????.<br>
	?????? ???, ?????? ????????? ????????? ????????? ????????? ???????????? ?????? ????????? ???????????? ???????????? ?????? ??? ???????????????<br>
	?????? ???????????? ????????? ???????????? ????????? ?????? ??? ?????? ????????????.<br>
	????????? ??????????????????.<br>
	<br>
	??? ?????? ????????? ????????? ???????????? ??????, ????????? ???????????????(?????? ?????? X) ????????? ?????? ??????????????? ???????????? ?????? ?????? ????????? ?????? ?????? ??? ?????? ?????? ?????? ?????? ?????? ????????????, ???????????? 7??? ?????? (?????? ??????) ?????? ???????????????.
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
					<p>????????????(<span class="red">X</span>)</p>
				</th>
				<th>
				<br>
					<img src="${WCP }/resources/customer-assets/img/food2.png" style="display: block; margin: 0 auto; width:400px; height:200px;" >
					<br>
					<p>????????????(<span class="blue">O</span>)</p>
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
					<strong>??????, ?????????</strong>
					<ul>
					<li>??????, ??????, ?????????, ????????????,?????????, ??????, ?????? ???</li>
					</ul>
					</div>
					</li>
					<br>
					<li>
					<div class="icon">	
						<img src="${WCP }/resources/customer-assets/img/food8.png" style="display: block; margin: 0 auto; width:60px; height:50px;">
					</div>
					<div class="tableCont">
					<strong>?????? ??????, ???</strong>
					<ul>
					<li>??????????????? ?????? ?????? ??? ?????? ?????? ?????? ???????????? ??????</li>
					<li>?????????, ???????????? ?????? ????????? ????????????</li>
					</ul>
					</div>										
					</li>
					<br>
					<li>
					<div class="icon">	
						<img src="${WCP }/resources/customer-assets/img/food7.png" style="display: block; margin: 0 auto; width:60px; height:50px;">
					</div>
					<div class="tableCont">
					<strong>?????? ?????? ?????? ??????</strong>
					<ul>
					<li class="liIcon">
					<span class="red">
					????????????, ??????, ?????????, ????????? ?????? ??????(?????????, ??????, ?????? , ??????, ?????? ?????? ??????????????? ???), ?????? ????????? ??????(?????? ?????? 1M??????), ???, ????????? ???<br>
					??? ?????????, ??????, ?????? ??? ???????????? ??? ?????? ???????????? ?????? ????????????.<br>
					??? ???????????? (?????? ???????????? ???????????? ?????? 1??? ?????? 700ML)<br>
					??? ?????? ???????????? ?????? ??? ???????????? ????????? ????????????????????? ?????? ??? ???????????? ??? ????????????.<br>
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
					<strong>?????????</strong>
					<ul>
					<li>?????? ??? ????????? ????????? ????????? ?????????(?????? ?????? ??????)</li>
					<li>????????? ??? ????????? ??????(???, ????????? ????????? ?????? ?????????)</li>
					</ul>
					</div>
					</li>
					<br><br>
					<li>
					<div class="icon">	
						<img src="${WCP }/resources/customer-assets/img/food6.png" style="display: block; margin: 0 auto; width:60px; height:50px;">
					</div>
					<div class="tableCont">
					<strong>????????? ??? ?????????</strong>
					<ul>
					<li>???/????????? ????????? ??? ??????(???,??????) ???????????? ??? ???.</li>
					<li>?????? ????????? ??????, ????????? ???????????? ????????? ???????????? ????????? ??????</li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????? ?????? ????????????</li>
					</ul>
					</div>
					</li>
					<br><br>
					<li>
					<div class="icon">	
						<img src="${WCP }/resources/customer-assets/img/food9.png" style="display: block; margin: 0 auto; width:60px; height:50px;">
					</div>
					<div class="tableCont">
					<strong>?????????</strong>
					<ul>
					<li>PET?????? ?????? ?????????</li>
					</ul>
					</div>
					</li>														
					</ul>
				</td>
				</tr>
		</tbody>
</table>
<br><br>
	
	<h3 class="h3">????????????????????? ????????? ???????????? ?????????</h3>
	<br>
	<h5 class="h5">- ????????? ?????? ?????????(<span class="red">?????????, ??????</span>)??? ????????? ????????? ??????????????????.</h5>
	<br>
	<h5 class="h5">- ???????????? ????????? ???????????? ????????? ????????? ????????????????????? <span class="red">'????????? ??????/?????? ??????'??? ??????</span>?????????.<br>
	??? ????????? ????????? ??????????????? ?????? ???????????????.(????????? - ?????? ????????? ???, ?????? ?????? ???, ?????? ?????????(?????? - ???????????? ?????? ????????? ????????? ???)<br>
	??? ???????????? ??? ????????? '????????????' ?????????.<br>
	??? ????????? ????????? ???????????????(?????? ?????????)??? ?????? ?????? ????????????, ????????? ????????? ????????? ????????? ?????? ???????????? ????????? ?????? ??? ?????? ???????????? ????????????.<br>
	(?????? ????????? ?????? ?????? ??? ?????? ??????)
	</h5>
	<br><br>
	
	<h3 class="h3">???????????????????????? ????????? ??? ????????????</h3>
	<br>
	<h5 class="h5">
	- ???????????? ?????? ??? ????????? ????????? ?????? ??????????????? ?????????. (????????? ??????, ???????????? ??? ??????????????? ?????? ?????? ???????????????.)<br>
	- ??????????????? ???????????? ???????????? ??????????????? ????????? ???????????? ??? ????????????.<br>
	- ????????? ????????????, ????????????, ?????? ??? ??????????????? ????????? ?????? ??? ?????? ?????? ???????????????. (????????? ???????????? ???????????????.)<br>
	- ?????? ??? ?????? ????????? ???????????????.(?????? 1??? ?????? 700ml)<br>
	- ??????????????? ???????????? ???????????? ??? ????????????.(???????????? ??? ????????? ?????? ????????? ?????? ?????? ??????????????????)<br>
	- ????????? ??? ???????????? ????????? ????????? ?????? ?????? ????????????(???????????? ?????????, ???????????????, ????????? ???)??? ????????? ??????????????? ?????? ?????? ????????????.<br>
	  (?????????: 65??? ??????, ?????????: 120cm??????, ???????????????????????? 150cm??????)<br>
	- ???????????? ?????? ???, ???????????? ?????? ??? ?????????????????? ????????? ?????? ????????? ????????? ?????????.<br>
	- ????????????????????? 4??? 7?????? ??????????????? ?????? ????????? ??? ???????????? ??? 5??? ????????? ???, ?????? ?????? ????????? ???????????????.<br>
	(?????? ????????? ????????? ???????????? ???????????? ???????????? ??????????????????.)<br>
	- ????????? ????????????????????? ?????? ??????????????? ?????? ????????????.<br>
	- ?????? ??? ??????????????? ????????? ????????? ?????? ?????? ??? ????????? ????????????, ??? ??? ??????????????? ????????? ?????? ????????? ?????? ??????????????????.<br>
	</h5>
<div class="quickmenu"class="scroll">
	<p class="quickCont">
		<img class="quickImg" src="${WCP }/resources/emp-img/DaeDeokWaterParkLogo.png">
	</p>
	<ul class="quickUl">
	<li class="icon1">
		<a class="aa" href="/waterpark/customer/use-info/reserve">
		<img class="iconImg" src="${WCP}/resources/customer-assets/img/smartReserve.png"><br>????????? ??????</a>
	</li>
	<li class="icon2">
		<a class="aa" href="/waterpark/customer/info/customerIntro">
		<img class="iconImg" src="${WCP}/resources/customer-assets/img/company.png"><br>????????????</a>
		
	</li>
	<li class="icon3">
		<a class="aa" href="/waterpark/customer/use-info/ticket">
		<img class="iconImg" src="${WCP}/resources/customer-assets/img/credit.png"><br>????????????</a>
	</li>
	<li class="icon4">
		<a class="aa" href="/waterpark/customer/use-info/map">
		<img class="iconImg" src="${WCP}/resources/customer-assets/img/map.png"><br>????????????</a>
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