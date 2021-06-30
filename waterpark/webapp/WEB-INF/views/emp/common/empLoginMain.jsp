<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/customer-includee/preScript.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    html{
    	height: 100vh;
    	width: 100%;
    }
    body{	
    	background: #3C4858;
    	height:100%;
    	width:100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
.grid-container{
	height:100%;
	width:100%;
    display: grid;
    max-width: 100%;
    padding:3%;
    
    border-radius: 10px;
    grid-template-columns: repeat(3,1fr);
/*     grid-template-rows: repeat(3,1fr); */
    grid-gap: 10px;
    grid-auto-rows: minmax(100px, auto);
}

.one img{
	width: 100%;
    height: 100%;
}

.one{
    grid-column: 1/3;
    grid-row:1/3;
/*      #1A2226; */
    background: white;
    text-align: center;
    box-shadow: 0 3px 6px rgb(0 0 0 / 16%), 0 3px 6px rgb(0 0 0 / 23%);
}
.after,.before{
	background-color: white;
	text-align: center;
}
.after>button,.before>button{
	width: 100%;
	height: 100%;
	font-size: 3em;
}
.after>button:hover,.before>button:hover{
    padding: 12px 24px;
    background-color: hsl(222, 100%, 95%);
    color: hsl(243, 80%, 62%);
    border-radius: 6px;
    box-shadow: 0 0 0 0 rgba(230, 237, 255, 0.7);
    animation: pulse 1.75s infinite cubic-bezier(0.66, 0, 0, 1);
}
.postrans{
	width: 100%;
	height: 100%;
	text-align: center;
}

.pulseBtn {

}

@keyframes pulse {
    to {
      box-shadow: 0 0 0 30px rgba(230, 237, 255, 0);
    }
}

</style>
<!-- 애니메이션 모음 -->
<style type="text/css">
.slide-in-blurred-bottom{-webkit-animation:slide-in-blurred-bottom .6s cubic-bezier(.23,1.000,.32,1.000) both;animation:slide-in-blurred-bottom .6s cubic-bezier(.23,1.000,.32,1.000) both}
.slide-in-blurred-right{-webkit-animation:slide-in-blurred-right .6s cubic-bezier(.23,1.000,.32,1.000) both;animation:slide-in-blurred-right .6s cubic-bezier(.23,1.000,.32,1.000) both}
.flip-scale-down-hor{-webkit-animation:flip-scale-down-hor .5s linear both;animation:flip-scale-down-hor .5s linear both}
.slide-out-top{-webkit-animation:slide-out-top .5s cubic-bezier(.55,.085,.68,.53) both;animation:slide-out-top .5s cubic-bezier(.55,.085,.68,.53) both}
.slide-in-blurred-top{-webkit-animation:slide-in-blurred-top .6s cubic-bezier(.23,1.000,.32,1.000) both;animation:slide-in-blurred-top .6s cubic-bezier(.23,1.000,.32,1.000) both}
@-webkit-keyframes slide-in-blurred-bottom{0%{-webkit-transform:translateY(1000px) scaleY(2.5) scaleX(.2);transform:translateY(1000px) scaleY(2.5) scaleX(.2);-webkit-transform-origin:50% 100%;transform-origin:50% 100%;-webkit-filter:blur(40px);filter:blur(40px);opacity:0}100%{-webkit-transform:translateY(0) scaleY(1) scaleX(1);transform:translateY(0) scaleY(1) scaleX(1);-webkit-transform-origin:50% 50%;transform-origin:50% 50%;-webkit-filter:blur(0);filter:blur(0);opacity:1}}@keyframes slide-in-blurred-bottom{0%{-webkit-transform:translateY(1000px) scaleY(2.5) scaleX(.2);transform:translateY(1000px) scaleY(2.5) scaleX(.2);-webkit-transform-origin:50% 100%;transform-origin:50% 100%;-webkit-filter:blur(40px);filter:blur(40px);opacity:0}100%{-webkit-transform:translateY(0) scaleY(1) scaleX(1);transform:translateY(0) scaleY(1) scaleX(1);-webkit-transform-origin:50% 50%;transform-origin:50% 50%;-webkit-filter:blur(0);filter:blur(0);opacity:1}}
@-webkit-keyframes flip-scale-down-hor{0%{-webkit-transform:scale(1) rotateX(0);transform:scale(1) rotateX(0)}50%{-webkit-transform:scale(.4) rotateX(90deg);transform:scale(.4) rotateX(90deg)}100%{-webkit-transform:scale(1) rotateX(180deg);transform:scale(1) rotateX(180deg)}}@keyframes flip-scale-down-hor{0%{-webkit-transform:scale(1) rotateX(0);transform:scale(1) rotateX(0)}50%{-webkit-transform:scale(.4) rotateX(90deg);transform:scale(.4) rotateX(90deg)}100%{-webkit-transform:scale(1) rotateX(180deg);transform:scale(1) rotateX(360deg)}}
@-webkit-keyframes slide-in-blurred-right{0%{-webkit-transform:translateX(1000px) scaleX(2.5) scaleY(.2);transform:translateX(1000px) scaleX(2.5) scaleY(.2);-webkit-transform-origin:0 50%;transform-origin:0 50%;-webkit-filter:blur(40px);filter:blur(40px);opacity:0}100%{-webkit-transform:translateX(0) scaleY(1) scaleX(1);transform:translateX(0) scaleY(1) scaleX(1);-webkit-transform-origin:50% 50%;transform-origin:50% 50%;-webkit-filter:blur(0);filter:blur(0);opacity:1}}@keyframes slide-in-blurred-right{0%{-webkit-transform:translateX(1000px) scaleX(2.5) scaleY(.2);transform:translateX(1000px) scaleX(2.5) scaleY(.2);-webkit-transform-origin:0 50%;transform-origin:0 50%;-webkit-filter:blur(40px);filter:blur(40px);opacity:0}100%{-webkit-transform:translateX(0) scaleY(1) scaleX(1);transform:translateX(0) scaleY(1) scaleX(1);-webkit-transform-origin:50% 50%;transform-origin:50% 50%;-webkit-filter:blur(0);filter:blur(0);opacity:1}}
@-webkit-keyframes slide-out-top{0%{-webkit-transform:translateY(0);transform:translateY(0);opacity:1}100%{-webkit-transform:translateY(-1000px);transform:translateY(-1000px);opacity:0}}@keyframes slide-out-top{0%{-webkit-transform:translateY(0);transform:translateY(0);opacity:1}100%{-webkit-transform:translateY(-1000px);transform:translateY(-1000px);opacity:0}}
@-webkit-keyframes slide-in-blurred-top{0%{-webkit-transform:translateY(-1000px) scaleY(2.5) scaleX(.2);transform:translateY(-1000px) scaleY(2.5) scaleX(.2);-webkit-transform-origin:50% 0;transform-origin:50% 0;-webkit-filter:blur(40px);filter:blur(40px);opacity:0}100%{-webkit-transform:translateY(0) scaleY(1) scaleX(1);transform:translateY(0) scaleY(1) scaleX(1);-webkit-transform-origin:50% 50%;transform-origin:50% 50%;-webkit-filter:blur(0);filter:blur(0);opacity:1}}@keyframes slide-in-blurred-top{0%{-webkit-transform:translateY(-1000px) scaleY(2.5) scaleX(.2);transform:translateY(-1000px) scaleY(2.5) scaleX(.2);-webkit-transform-origin:50% 0;transform-origin:50% 0;-webkit-filter:blur(40px);filter:blur(40px);opacity:0}100%{-webkit-transform:translateY(0) scaleY(1) scaleX(1);transform:translateY(0) scaleY(1) scaleX(1);-webkit-transform-origin:50% 50%;transform-origin:50% 50%;-webkit-filter:blur(0);filter:blur(0);opacity:1}}
</style>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>


	<div class="grid-container">
            <div class="one"><img src="${WCP }/resources/emp-img/postiltle.png"></div>
            <div class="side after five" onclick="location.href='${WCP }/snack'" style="display: none"><button>스낵 POS</button></div>
            
            <div class="side after s6" onclick="location.href='${WCP }/emp/ticketOffice'" style="display: none"><button>매표소POS</button></div>
            <div class="bottom after s7" style="display: none"><button>영업관리</button></div>
            <div id="POSbuttons" class="bottom before two"><button>POS</button></div>
            <div class="bottom before four"  onclick="location.href='${WCP }/emp'"><button>직원 홈</button></div>
            

        </div>
        <script type="text/javascript">
        	$("#POSbuttons").on("click",function(){
//         		$(".one").addClass("swing-out-top-bck");  
//         		sleep(1000);
//         		$(".one").remove("swing-out-top-bck");  
//         		sleep(1000);
				$(".one").addClass("slide-out-top"); 
        		$(".after").css("display","block");
        		$(".side").addClass("slide-in-blurred-right");
        		$(".bottom").addClass("slide-in-blurred-bottom");
        	})
        	$(document).on("click",".s7",function(){
        		Swal.fire({
        			  title: '업데이트 준비중입니다.',
        			  width: 600,
        			  padding: '3em',
        			  background: '#fff url(/images/trees.png)',
        			  backdrop: `
        			    rgba(0,0,123,0.4)
        			    url("${WCP}/resources/emp-img/giphy-unscreen.gif")
        			    left top
        			    no-repeat
        			  `
        			})
        	})
        	var ani = document.querySelector(".one");
        	ani.addEventListener("animationend", function(e) {
        		$(".one").addClass("slide-in-blurred-top");
        	}, false);
        	
        	let frag = $(".swal2-title").is(":visible");
        	console.log(frag)
        	if(!frag){
        	   $("body").css("padding", "0");
        	}
        </script>
        <div>2021-06-12 업데이트 ah puh eo pu v1.4 </div>
</body>
</html>