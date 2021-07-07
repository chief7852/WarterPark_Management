<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel ="stylesheet" href="${WCP}/resources/emp-css/manageTeamMain.css" >

<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="bi bi-kanban"></i> 직원관리
				</h3>
				<ol class="breadcrumb">
					<li><i class="bi bi-house-fill"></i>홈</li>
					<li><i class="bi bi-bank"></i>경영총무팀</li>
					<li><i class="bi bi-kanban"></i>직원관리</li>
				</ol>
			</div>
		</div>
		<div class="bodyPart">
			<div class="row">
				<div class="col-md-3 empBar">
					<div class="panel selectBar">
						<label class="head-info">팀</label> 
						<select id="teamBox">
							<option value="">선택</option>
							<c:choose>
								<c:when test="${not empty teamMaps}">
									<c:forEach items="${teamMaps}" var="team">
										<option value='${team["COM_CODE"]}'>${team["COM_CODE_NAME"]}</option>
									</c:forEach>
								</c:when>
							</c:choose>
						</select> <label class="head-info">직책</label> <select id="responseBox">
							<option value="">선택</option>
							<c:choose>
								<c:when test="${not empty respMaps}">
									<c:forEach items="${respMaps}" var="position">
										<option value='${position["COM_CODE"]}'>${position["COM_CODE_NAME"]}</option>
									</c:forEach>
								</c:when>
							</c:choose>
						</select><br> <label class="head-info">근무여부</label> <select
							id="isWorking">
							<option value="">선택</option>
							<option value="Y">근무자</option>
							<option value="N">퇴사자</option>
						</select> <label class="head-info">검색</label> <input
							class="head-info searchForm " type="text" name="search" />
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="head">이름</div>
							<div class="head">부서</div>
							<div class="head">직책</div>
						</div>
						<div class="panel-body empBarBody" id="empBarBody">
							<c:choose>
								<c:when test="${not empty empList}">
									<c:forEach items="${empList}" var="emp">
										<div class="hr"></div>
										<div class="barItems" data-id="${emp.emp_id}">
											<div class="barItem">
												<strong>${emp.emp_name }</strong>
											</div>
											<div class="barItem">
												<strong>${emp.team_name}</strong>
											</div>
											<div class="barItem">
												<strong>${emp.response_name}</strong>
											</div>
										</div>
									</c:forEach>
									<div class="hr"></div>
								</c:when>
								<c:otherwise>
									<div class="barItems">
										<div class="barItem">존재하지 않음.</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<!--Project Activity start-->
				<section class="panel adjust-panel">
					<div class="first">
						<form:form modelAttribute="emp" method="post" id="inputForm" enctype="multipart/form-data" >
							<div class="picture">
								<input type="file" id='picture-form' name='emp_files' /> 
							</div>
							<div class="empInfo">
								<div class="empInfo1">
									<input type="hidden" class="team_code" name="team_code" /> 
									<input type="hidden" class="response_code" name="response_code" /> 
									<input type="hidden" class="response_name" name="response_name" /> 
									<input type="hidden" class="fc_id" name="fc_id" />
									<input type="hidden" class="file_no" name="file_no" /> 
									<div class="item-wrapper"> 
										<label class="info-item">직원 아이디</label> 
										<input class="emp_id onlyread form-control checking" name="emp_id" type="text" readonly />
									</div>
									<div class="item-wrapper">
										<label class="info-item"> 이름</label> 
										<input class="emp_name form-control checking" name="emp_name" type="text" readonly /> 
									</div>
									<div class="item-wrapper">
										<label class="info-item beforeResponse"> 직책</label> 
										<input class="response_name form-control checking" name="response_name" type="text" readonly />
									</div>
									<div class="item-wrapper">
										<label class="info-item">이메일</label> 
										<input class="emp_mail form-control checking" name="emp_mail" type="text" readonly />
									</div>
								</div>
								<div class="empInfo2">
									<div class="item-wrapper">
										<label class="info-item beforeTeam">팀명</label> 
										<input class="team_name form-control checking" name="team_name" type="text" readonly /> 
									</div>
									<div class="item-wrapper">
										<label class="info-item">입사일</label> 
										<input class="emp_hire form-control checking" type="text" name="emp_hire" readonly /> 
									</div>
									<div class="item-wrapper">
										<label class="info-item"> 퇴사일</label> 
										<input class="emp_fire form-control checking" type="text" name="emp_fire" readonly />
									</div>
									<div class="item-wrapper">
										<label class="info-item beforeFC"> 담당 구역</label>
										<input class="fc_name form-control checking" type="text" name="fc_name" readonly />
									</div>
									<div class="item-wrapper">
										<label class="info-item beforeHP"> 휴대폰 번호</label>
										<input class="emp_hp form-control checking" name="emp_hp" type="text" readonly />
									</div>
								</div>
							</div>
							<!-- <button type="submit">전송하기</button> -->
						</form:form>
						<div class="buttons">
							<table>
								<tr>
									<th><button class="button btn btn-info" data-info="create">등록</button>     </th>      
									<th><button class="button btn btn-info" data-info="update">수정</button>   </th>        
								</tr>
								<tr>
									<th><button class="button btn btn-info" data-info="fire">퇴사</button>            </th>    
									<th><button class="button btn btn-info" data-info="resume">이력서</button>        </th>      
								</tr>
							</table>
						</div>
					</div>
					<div class="bottom-part">
						<div class="licenses">	
							<table class="table table-hover personal-task">
								<tbody>
									<tr class="lisence">
										<th class="lisence-rnum">자격증</th>
										<th class="lisence-width">이름</th>
										<th>취득일</th>
										<th>만기일</th>
										<th class='lisence-width'>발행서</th>
									</tr>
								</tbody>
							</table> 
						</div>
						<div class="experience">
						<table class="table table-hover personal-task">
							<tbody>
								<tr class="report">
									<th>보고서</th>
									<th class="report-title">제목</th>
									<th class="report-title">분류</th>
									<th class="report-title">날짜</th>
									<th>승인</th>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
					<div class="pdfPosition">
					
					</div>
				</section>
			</div>
			<div id="modal" class="searchModal">
			<div class="search-modal-content">
				<div class="page-header">
					<h1>이력서 등록하기</h1>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="row">
						</div>
					</div>
				</div>
				<hr>
				<div class="fileForm">
					<form:form id="fileEnrollForm" action="/waterpark/emp/resume" ModelAttribute="resume" method="post" enctype="multipart/form-data">
						<input type="file" name="resume_files"/>
						<input type="hidden" id="emp_id" name="emp_id" value="${resume.emp_id}" />
					</form:form>
					</div>
					<div class="buttons-modal">
						<button class="sendFile close" type="button">보내기</button>
						<button class="close" onClick="closeModal();" type="button">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
	
<script type="text/javascript" src="${WCP}/resources/emp-js/manageTeamMain.js"></script>

<script>
function createForm(facilityList) {
	lock = true;
    $(".empInfo").empty();
    $(".empInfo").append(createTag);
    $(".buttons").empty();
    $(".buttons").append('<button type="button" class="button btn btn-info" data-info="check">확인</button>');
    $(".buttons").append('<button class="button btn btn-info" data-info="cancel">취소</button>');
    $(".buttons").append('<button class="button btn btn-info" data-info="testBtn" style="width:87px;">데이터 버튼</button>');
	$(".emp_id").attr("readonly",true);
    $(".emp_id").addClass("onlyread");
    
    $('.team_name').remove();
    $(".beforeResponse").after(
      '<select id="selectTeam" class="team_name form-control checking2" name="team_name">'
        +'<option>선택</option>' 
  	   <c:forEach items="${respMaps}" var="position">
		+'<option value="${position["COM_CODE"]}" name="team_name">${position["COM_CODE_NAME"]}</option>'						
	   </c:forEach>
     +'</select>'		
    );
    
    $('.response_name').remove();
    $('.beforeTeam').after(
		'<select id="selectPosition" class="response_name form-control checking2" name="response_name">'
		 + '<option>선택</option>'  
  		 <c:forEach items="${teamMaps}" var="team">
			+'<option value="${team["COM_CODE"]}" name="response_name">${team["COM_CODE_NAME"]}</option>'						
		 </c:forEach>
	     +'</select>'	
    );
 
   $('.fc_name').remove();
    let fcTag= "";
    fcTag += "<select id='selectFC' class='fc_id form-control checking2'>";
    fcTag += "<option>선택</option>";
    $(facilityList).each(function(idx,facility){
    	fcTag += '<option value='+facility.fc_id+' name='+ facility.fc_id+'>'+facility.fc_name +'</option>';
    }); 
    fcTag += "</select>";
    $('.beforeFC').after(fcTag); 
}	

$(document).on("click",".barItems",function(){
	let empId = $(this).attr("data-id");
	if(lock == true){
		intercept('현재 진행중인 작업이 있습니다.','기존에 하던 작업을 마무리 지어주세요!','warning');
		return;
	}
	$.ajax({
		url : findURL,
		data : {
			'empId' : empId			
		},
		success:function(resp){
			if(resp.empDetail != null){
				$(".emp_id").val(resp.empDetail.emp_id).attr("readonly",true);
				$(".emp_name").val(resp.empDetail.emp_name).attr("readonly",true);
				$(".response_name").val(resp.empDetail.response_name).attr("readonly",true);
				$(".emp_mail").val(resp.empDetail.emp_mail).attr("readonly",true);
				$(".team_name").val(resp.empDetail.team_name).attr("readonly",true);
				$(".emp_hire").val(resp.empDetail.emp_hire).attr("readonly",true);
				$(".emp_fire").val(resp.empDetail.emp_fire).attr("readonly",true);
				$(".fc_id").val(resp.empDetail.fc_id).attr("readonly",true);
				$(".fc_name").val(resp.empDetail.fc_name).attr("readonly",true);
				$(".emp_hp").val(resp.empDetail.emp_hp).attr("readonly",true);
				$(".response_code").val(resp.empDetail.response_code).attr("readonly",true);
				$(".team_code").val(resp.empDetail.team_code).attr("readonly",true);
				$(".picture").empty();
				$(".pdfPosition").empty();
			}else{
				
				
			}
			if(resp.empDetail.fileList != null){
				$(resp.empDetail.fileList).each(function(idx,file){
					let maxIdNo = 0;
					let maxIdOrd = 0;
					
					if(file.lempf_code =='ID'){
					
						if(file.file_no > maxIdNo){
							maxIdNo = file.file_no;
							maxIdOrd = file.file_ord;
						}
						$(".picture").empty();
						const URLPATTERN = "<c:url value= '/download' />?what=%W&order=%O";
						let pictureURL = URLPATTERN.replace("%W",maxIdNo).replace("%O",maxIdOrd);
						let pictureTag = $("<img>").attr("src",pictureURL).attr("id","img");
						$(".picture").append(pictureTag);
					}else{
						let pictureTag = $("<img>").attr("src",'${WCP}/resources/emp-img/water_no_img_emp.png').attr("id","img");
						$(".picture").append(pictureTag);
					}
				});
				if(resp.empDetail.fileList == ""){
					
					let pictureTag = $("<img>").attr("src",'${WCP}/resources/emp-img/water_no_img_emp.png').attr("id","img");
					$(".picture").append(pictureTag);
				}
			}
				
			
			if(resp.empDetail.reportList != ""){
				let trTags = [];
				$('.report-item').empty();
			    $(resp.empDetail.reportList).each(function(idx,report){
			    	let report_title = report.report_title;
			    	if(report_title.length >10){
			    		report_title = report_title.substring(0,9) + "...";
			    	}
			    	let report_app = report.report_app;
			    	if(report_app == "" || report_app == null ){
			    		report_app = "-";
			    	}
			    	let year = report.report_date.substring(0,4);
			    	let month = report.report_date.substring(4,6);
			    	let date = report.report_date.substring(6,8);
			    	let replaceDate = year + "-" + month + "-" + date;
			    	
					let tr = $("<tr>").append(
						 $("<td>").html(report.rnum),
						 $("<td>").html(report_title),
						 $("<td class='type'>").html(report.report_type),
						 $("<td>").html(replaceDate),
						 $("<td>").html(report_app)
						).css({"text-align":"center","cursor":"pointer"}).addClass("report-item").attr("data-num",report.report_no);
					trTags.push(tr);
				})
			    $(".report").after(trTags);
			}else{
				$('.report-item').empty();
			}
			if(resp.empDetail.lisenceList != ""){
				$('.lisence-item').empty();
				let trTags = [];
				$(resp.empDetail.lisenceList).each(function(idx,lisence){
					let tr = $("<tr>").append(
							 $("<td class='lisence-rnum'>").html(lisence.rnum),
							 $("<td class='lisence-width'>").html(lisence.lisence_name),
							 $("<td>").html(lisence.lisence_get),
							 $("<td>").html(lisence.lisence_exp),
							 $("<td class='lisence-width'>").html(lisence.lisence_pub)
							 ).css({"text-align":"center","cursor":"pointer"}).addClass("lisence-item");
					trTags.push(tr);
				  });
				$(".lisence").after(trTags);
			}else{
				$('.lisence-item').empty();
			}
			
		},error : function(){
		}
	})
})
</script>
