<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--sidebar start-->
<style>
#empInfo{
	width: 180px;
	height: 180px;
	margin-top: 70px;
	padding: 0;
}
.sidebar-menu{
	box-sizing: border-box;
}
#sidebar{
	box-sizing: border-box;
}
.dropdown{
	margin-top: 35px;
	
}
.thumbTable{
	width: 180px;
	height: 180px;
	border: 1px solid white;
	margin: auto;
	padding: auto;
	text-align: center;
	background: #f7f9fa;
}
.tdCont{
	text-align: left;
	vertical-align: top;
}
#nameTd{
	vertical-align: bottom;
}

.td1{
	width: 90px;
	border: 1px solid;
}

.unread{
	color: #FFEB3B;
	text-align:center;
}
.tr1{
	border: 1px solid;
}
.black{
	color: black;
}
.blue{
	color: blue;
}
.prod-img{
	width: 55px;
	height: 55px;
}
#alert_notificatoin_bar, #mail_notificatoin_bar{
	list-style: none;
	margin: auto;
	padding: auto;
}
#alert_notificatoin_bar{
	width: 87px;
	height: 30px;
	vertical-align: middle;
}
#mail_notificatoin_bar{
	width: 87px;
	height: 30px;
	vertical-align: middle;
}
.mailTag{
	vertical-align: bottom;
}

 .dropdown-toggle::after {
  display:none; 
 } 
 .nav-collapse{
  z-index: 1000;
 }
</style>	
<aside>
	<div id="sidebar" class="nav-collapse ">
    	<div id="empInfo">
    	<div class="top-nav notification-row">
	<table class="thumbTable">
		<tr>
			<td rowspan="2" colspan="2"><img class="prod-img" src="${WCP }/resources/emp-img/employee2.png"></td>
			<td class="tdCont" id="nameTd" colspan="4"><span class="black">${sessionScope.EmpVO.emp_name}님<span></span></td>

		</tr>
		<tr>
			<td class="tdCont" colspan="4"><span class="blue">${sessionScope.EmpVO.team_name}</span></td>
		</tr>
		<tr class="tr1">

			<td class="td1" colspan="1">

<div class="dropdown" style="margin-top: 0;">
  <a  class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
    <i class="icon-bell-l"></i> <span class="badge bg-important">0</span>
  </a>

  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<!--         불러오는 목록 시작 -->
        <li>
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
			<div class="dropdown-body" style="padding: 0px;">

			</div>
          
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
       
<!--         불러오는 목록 끝 -->
	</li>
  </ul>
</div>
			</td>
			<td colspan="3"><a href="${WCP }/emp/logout" class="active">로그아웃</a></td>
		</tr>
		
	</table>
	</div>
    	</div>	
		<!-- sidebar menu start-->
		<ul class="sidebar-menu">
			<c:choose>
				<c:when test="${not empty unReadCnt}">
					<c:if test="${unReadCnt > 0}">
						<li class="emailServiceBar unread">읽지 않은 글 ${unReadCnt}+</li>
					</c:if>
				</c:when>
			</c:choose>
			<li class="emailServiceBar"><a href="${WCP}/emp/sendEmail">
			<i class="bi bi-pencil-square"></i>쪽지 쓰기</a></li>
			<li><a class="" href="${WCP}/emp/email"><i class="bi bi-envelope-fill"></i><span>받은 쪽지함</span>
			</a></li>
			<li><a class="" href="${WCP}/emp/email?email_type=send"> 
			<i class="bi bi-forward"></i><span>보낸 쪽지</span>
			</a></li>
			<li><a class="" href="${WCP}/emp/email?email_type=trash"><i class="bi bi-trash-fill"></i><span>휴지통</span>
			</a></li>
		</ul>
		<!-- sidebar menu end-->
	</div>

</aside>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script src="${WCP }/resources/emp-js/webSocket.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 서버의 url주로를 가져와서 init메소드에 넣어주면서 접속한다 */
		var datas = {
				"emp_id" : '${EmpVO.emp_id}',
				"emp_name" : '${EmpVO.emp_name}',
				"team_name" : '${EmpVO.team_name}',
				"response_name" : '${EmpVO.response_name}',
				"fc_name" : '${EmpVO.fc_name}'
			}
		var url = '${WCP}/chat';
		websocketStart(datas, url)
	});
	$(document).on("click","#dropdownMenuLink",function(){
		$(".dropdown-menu").toggle();
		let url = '${WCP}';
		let emp_id = '${EmpVO.emp_id}';
		dbAlarm(url,emp_id)
	})
	//알림 세부 클릭시 email location으로 이동
	$(document).on("click",".email",function(){
		let url = '${WCP}';
		let alarm_no = $(this).attr('id');
		
		emailListLocation("${WCP}/emp/email",url,alarm_no)
	})

</script>