<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!--sidebar start-->
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
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
		<ul class="sidebar-menu">
			<li class="active" id="empManagement"><a class="" href="${WCP}/emp/manageteam"><i class="bi bi-kanban"></i> <span>
						직원 관리 </span>
			</a></li>
			<li class="active"><a class="" href="${WCP}/emp/customermanage"><i class="bi bi-people-fill"></i> <span>
						고객 관리</span>
			</a></li>
			<li class="active"><a class="" href="${WCP }/emp/budget"><i class="bi bi-currency-dollar"></i> <span>
						매출 관리 </span>
			</a></li>
			<!-- <li class="active"><a class="" href="empVacation"><i class="bi bi-file-earmark"></i> <span>
						보고서 관리 </span>
			</a></li> -->
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
	WCP = '${WCP}'
	//알림 세부 클릭시 email location으로 이동
	$(document).on("click",".email",function(){
		let url = '${WCP}';
		let alarm_no = $(this).attr('id');
		
		emailListLocation("${WCP}/emp/email",url,alarm_no)
	})

	</script>