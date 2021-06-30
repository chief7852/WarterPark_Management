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
 .infoma{
  color: #ff6961;
  font-size: smaller;
 }
 .form-select{
  font-size: medium;
 }
</style>		
<!--sidebar start-->
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
  <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
    <i class="icon-bell-l"></i> <span class="badge bg-important">0</span>
  </a>

  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<!--         불러오는 목록 시작 -->
        <li>
          <span class="dropdown-item dropdown-header">새로운 알림</span>
          <div class="dropdown-divider"></div>
			<div class="dropdown-body" style="padding: 0px;">

			</div>
          
          <a href="#" class="dropdown-item dropdown-footer"></a>
       
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
            <li class="sub-menu">
                <a href="javascript:;" class="">
                    <span><i class="bi bi-calendar4-week"></i>근태관리</span>
                    <span class="menu-arrow arrow_carrot-right"></span>
                </a>
                <ul class="sub">
                    <li><a class="" href="empWork"><i class="bi bi-file-earmark-person"></i>개인 근무 내역</a></li>
                    <li><a class="" href="empWorkResponsible"><i class="bi bi-person-lines-fill"></i>근무 담당자 관리</a></li>
                    <li><a class="" href="empWorkAdd">추가 근무 신청</a></li>
                </ul>
            </li>
            <li class="active">
                <a class="" href="#">
                    <span><i class="bi bi-calendar2-plus"></i>내 휴가관리 </span>
                </a>
            </li>
            <li>
                <a class="" href="#">
                    <span><i class="bi bi-file-earmark-ruled"></i>산재 신청</span>
                </a>
            </li>
            <li>
                <a class="" href="#">
                    <span><i class="bi bi-coin"></i>월급조회</span>
                </a>
            </li>
            <li>
                <a class="reportProd" href="#">
                    <span><i class="bi bi-clipboard-plus"></i>근무 물품 신청</span>
                </a>
            </li>
            <!-- <li class="sub-menu"><a href="javascript:;" class=""> <span>경영
						총무팀</span> <span class="menu-arrow arrow_carrot-right"></span>
			</a>
				<ul class="sub">
					<li><a class="" href="basic_table.html">멤버십 관리 </a></li>
					<li><a class="" href="basic_table.html">상품 관리 </a></li>
					<li><a class="" href="basic_table.html">직원 관리  </a></li>
					<li><a class="" href="basic_table.html">예산관리</a></li>
					<li><a class="" href="basic_table.html">보고서</a></li>
					<li><a class="" href="basic_table.html">시설물 관리</a></li>
				</ul></li> -->

        </ul>
        <!-- sidebar menu end-->
    </div>
 <div class="modal fade" id="reportProd" tabindex="1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">근무물품 신청</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="${WCP }/emp/reportProd" method="post" >
        <input type="text" name="emp_id" hidden value="${EmpVO.emp_id }">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">신청물품:</label>
            <label class="infoma">현재 무전기,근무복,호루라기,구명조끼,근무모자,아쿠아슈즈 만 신청 가능합니다.</label>
            <select id="prodkind" name="report_title" class="form-select" aria-label="Default select example">
			  <option  selected value="무전기" >무전기</option>
			  <option value="근무복">근무복</option>
			  <option value="호루라기">호루라기</option>
			  <option value="구명조끼">구명조끼</option>
			  <option value="근무모자">근무모자</option>
			  <option value="아쿠아슈즈">아쿠아슈즈</option>
			</select>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용:</label>
            <textarea class="form-control" name="report_cont" id="message-text"></textarea>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">금액:</label>
            <input type="text" readonly="readonly" class="form-control" name="report_money" id="message-money" value="36,000">
          </div>
          <input type="text" name="lreport_code" hidden value="GD">
          <input type="text" name="report_del" hidden value="N">
          <input type="text" name="report_app_need" hidden value="N">
       	  
      </div>
      <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="신청">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
         </form>
      </div>
    </div>
  </div>
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
	//알림 클릭시 알림목록을 불러와 찍어준다
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
	<script>
		$(document).on("click",".reportProd",function(){
			$("#reportProd").modal("show");
		})
		$(document).on("click",".btn-secondary",function(){
			$("#reportProd").modal("hide");
		})
		$(document).on("click",".btn-close",function(){
			$("#reportProd").modal("hide");
		})
		$(document).on("change","#prodkind",function(){
			
			if($(this).val() == '무전기'){
				$("#message-money").val("36,000");
			}
			else if($(this).val() == '근무복'){
				$("#message-money").val("73,000");
			}
			else if($(this).val() == '호루라기'){
				$("#message-money").val("6,000");
			}
			else if($(this).val() == '구명조끼'){
				$("#message-money").val("42,000");
			}
			else if($(this).val() == '근무모자'){
				 $("#message-money").val("14,000");
			}
			else if($(this).val() == '아쿠아슈즈'){
				$("#message-money").val("20,000");
			}
// 			switch($(this).val()) {
// 						  case '무전기':  // if (x === 'value1')
// 						     $("#message-money").val("36,000");
// 						    break;
						
// 						  case '근무복':  // if (x === 'value2')
// 							  $("#message-money").val("73,000");
// 							  break;
						
// 						  case '호루라기':  // if (x === 'value2')
// 							  $("#message-money").val("6,000");
// 							  alert($(this).val())
// 							  break;
						
// 						  case '구명조끼':  // if (x === 'value2')
// 							  $("#message-money").val("42,000");
// 							  break;
						
// 						  case '근무모자':  // if (x === 'value2')
// 							  $("#message-money").val("14,000");
// 							  break;
						
// 						  case '아쿠아슈즈':  // if (x === 'value2')
// 							  $("#message-money").val("20,000");
// 							  break;
						
// 						  default:
// 							  $("#message-money").val("36,000");
// 						  break;
// 						}
		})
	</script>