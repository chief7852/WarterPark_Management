<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="header-main">
<nav class="main-header navbar navbar-expand navbar-white navbar-light" id="headed">
          <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a id="snackMain" class="nav-link" data-widget="pushmenu" href="javascript:void(0);" role="button"><img href="javascript:void(0);" src="${WCP }/resources/assets/images/icons/title.JPG"></a>
      </li>
    </ul>
    <!-- 시간타이머 -->
<ul class="navbar-nav ml-auto">
	<li><div id="clock"></div></li>
</ul>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      
      <li class="nav-item dropdown">
        <a id='deadlined' class="nav-link" data-bs-toggle="modal" role="button" href="#" >
          <i class="bi bi-calendar2-check"></i>
        </a>
		
      </li>
      
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a id="alamss" class="nav-link" data-toggle="dropdown" href="#" aria-expanded="false">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">0</span>
        </a>
<!--         불러오는 목록 시작 -->
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"  aria-labelledby="dropdownMenuLink" style="left: inherit; right: 0px;">
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
			<div class="dropdown-body" style="padding: 0px;">
			
			</div>
          
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
<!--         불러오는 목록 끝 -->
      </li>
 
      <li class="nav-item">
        <a class="nav-link" id="goFS" data-widget="fullscreen" href="javascript:void(0);" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      
      <li class="nav-item dropdown">
		<a href="javascript:void(0);" class="nav-link nav-profil nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false">
                <div class="nav-profile-image">
                <!-- 회원 첨부파일 프로필사진 -->
                  <img src="${WCP }/resources/emp-img/noime.png" alt="profile">
                  <span class="login-status online"></span>
                  <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column ">
                  <span class="font-weight-bold mb-1">${EmpVO.emp_name }</span>
                  <span class="text-secondary text-small">${EmpVO.response_name }</span>
                </div>
		</a>

          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a id="proLog" class="dropdown-item" href="javascript:void(0);">관리자변경</a></li>
            <li><a id="empMain" class="dropdown-item" href="${WCP}/emp">직원메인</a></li>
          </ul>
      </li>
    </ul>
</nav>

</section>
<!-- Modal -->
<div class="modal fade" id="deadline" tabindex="-1" aria-labelledby="deadline" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="headDead">개시 마감</h5><h6>&nbsp;&nbsp;&nbsp;&nbsp;당일업무가 마감되었습니다.</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i class="bi bi-x"></i></button>
      </div>
      <div class="modal-body">
<table class="table">
  <thead>
  </thead>
  <tbody>
    <tr>
      <th scope="row">영업 일자</th>
      <td id="Bday" colspan="3">Larry the Bird</td>
    </tr>
    <tr>
      <th scope="row">이용객</th>
      <td id="Tuser" colspan="3"></td>
    </tr>
    <tr>
      <th scope="row">당일 매출</th>
		<td id="Tsales" colspan="3">
			<hr align="center"><i class="bi bi-cash-coin">&nbsp;</i><p>dd</p><hr align="center">
			<i class="bi bi-cash-stack">&nbsp;</i><p>dd</p><hr align="center">
			<i class="bi bi-currency-exchange">&nbsp;</i><p>dd</p><hr align="center">
		</td>
    </tr>
    <tr>
      <th scope="row">처리 시간</th>
		<td id="Ntime" colspan="3">Larry the Bird</td>
    </tr>
    <tr>
      <th scope="row">관리자</th>
      <td id="Nmanager" colspan="3">${EmpVO.emp_name }</td>
    </tr>
  </tbody>
</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary closing">업무마감</button>
        <form id="closis" action="${WCP }/snack/close" method="get">
        </form>
      </div>
    </div>
  </div>
</div>

<!-- websocket 연결 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script src="${WCP }/resources/emp-js/webSocket-pos.js"></script>
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
// 	$(document).on("click","#alams",function(){
// 		$(this).find(".dropdown-menu").toggle();
// 		let url = '${WCP}';
// 		let emp_id = '${EmpVO.emp_id}';
// 		dbAlarm(url,emp_id)
// 	})
	//알림 세부 클릭시 email location으로 이동
	$(document).on("click",".email",function(){
		let url = '${WCP}';
		let alarm_no = $(this).attr('id');
		
		emailListLocation("${WCP}/emp/email",url,alarm_no)
	})
	$(document).on("click",'.btn-secondary',function(){
		$("#deadline").modal("hide");
	})
	$(document).on("click",".closing",function(){
		
		$("#closis").submit();
		$("#deadline").modal("hide");
		$('.btn').attr("disabled","disabled");
		$('.btn').unbind('click');
		$('.btn').click(function () {Swal.fire('마감 되었습니다.');return false;});
		
	})
</script>