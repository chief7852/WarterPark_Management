<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--sidebar start-->
    <link rel="stylesheet" href="${WCP}/resources/calender/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="${WCP}/resources/calender/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='${WCP}/resources/calender/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='${WCP}/resources/calender/vendor/css/bootstrap-datetimepicker.min.css' />
   <link rel="stylesheet" href="${WCP}/resources/calender/css/main.css">
<style>
body{
background-color: #eeeeee;
}
 .dropNewEvent{
 	margin: -273px -222px 0;
 }
 .modal-dialog{
 	left: 0%;
 }
 .homeGrid{
 	display: grid;
 	grid-template-columns:1fr 1fr;
 	margin-top: 50px
 }
 .flexer{
  flex-direction: column !important;
 }
 .row{
 	    margin-left: 20px !important ;
    margin-right: 20px !important;
 }
 .hie{
 	height: 698px !important;
 }
 th{
	text-align: center;
}
.ts{
	text-align: center;
	overflow     : hidden; 
	vertical-align:middle !important;
}
.table-reponsive{
	overflow: auto;
	height: 330px !important;
}

</style>

<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
	<c:if test="${not empty message }">
		<script>
			Swal.fire({
			  title: '접근 불가',
			  text: "접근 권한이 없습니다",
			  icon: 'info',
			  showCancelButton: false,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '확인'
			})
		</script>
	</c:if>
	<div class="homeGrid">
		<div class="row">
			<div class="col-lg-12 col-md-12 marge">
				<div id="calenderManage" class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-flag-o red"></i><strong>근무표</strong>
						</h2>
					</div>
					<div class="panel-body hie">
						<div class="container col-lg-12">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">작성</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="1" role="dialog" id="eventModal" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                       

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input value="근무" class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
	<script>
		WCP = '${WCP}';
		EmpVO = "${EmpVO.emp_id}"
		ename = "${EmpVO.emp_name}"
	</script>
    <script src="${WCP}/resources/calender/vendor/js/jquery.min.js"></script>
    <script src="${WCP}/resources/calender/vendor/js/bootstrap.min.js"></script>
    <script src="${WCP}/resources/calender/vendor/js/moment.min.js"></script>
    <script src="${WCP}/resources/calender/vendor/js/fullcalendar.min.js"></script>
    <script src="${WCP}/resources/calender/vendor/js/ko.js"></script>
    <script src="${WCP}/resources/calender/vendor/js/select2.min.js"></script>
    <script src="${WCP}/resources/calender/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${WCP}/resources/calender/js/main.js"></script>
    <script src="${WCP}/resources/calender/js/addEvent.js"></script>
    <script src="${WCP}/resources/calender/js/editEvent.js"></script>
    <script src="${WCP}/resources/calender/js/etcSetting.js"></script>
					</div>

				</div>

			</div>
			<!--/col-->


			<!--/col-->

		</div>

		<!-- statics end -->

		<!-- project team & activity start -->
		<div class="row flexer">
			<div class="col-md-13 col-sm-13 col-xs-13">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                	공지사항
                                	<a href="${WCP }/emp/notice" style="float: right;"><  more  ></a>
                            </div> 
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="col-md-1">NO.</th>
                                                <th class="col-md-3">제목</th>
                                                <th class="col-md-3">구분</th>
                                                <th class="col-md-2">작성일</th>
                                                <th class="col-md-2">작성자</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="empNotice" items="${empNoticeList }">
                                        	<tr>
                                                <td class="ts col-md-1">${empNotice.report_no }</td>
                                                <td class="ts col-md-3">${empNotice.report_title }</td>
                                                <td class="ts col-md-2">공지사항</td>
                                                <td class="ts col-md-2">${empNotice.report_date }</td>
                                                <td class="ts col-md-2">관리자</td>
                                                
                                            </tr>
                                        </c:forEach>
                                           

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>

			<div class="col-md-13 col-sm-13 col-xs-13">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                	물품 신청 내역
                            </div> 
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="col-md-1">팀명</th>
                                                <th class="col-md-1">신청자</th>
                                                <th class="col-md-3">신청물품</th>
                                                <th class="col-md-3">내용</th>
                                                <th class="col-md-2">금액</th>
                                                <th class="col-md-2">승인여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="empProd" items="${empProdList }">
                                        	<tr>
                                                <td class="ts col-md-1">${EmpVO.team_name }</td>
                                                <td class="ts col-md-1">${EmpVO.emp_name }</td>
                                                <td class="ts col-md-3">${empProd.report_title }</td>
                                                <td class="ts col-md-3">${empProd.report_cont }</td>
                                                <td class="ts col-md-2">${empProd.report_cont }</td>
                                                <td class="ts col-md-2">-</td>
                                            </tr>
                                        </c:forEach>
                                           

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
		</div>
		<br> <br>

	</div>
		<!-- project team & activity end -->

	</section>
	<div class="text-right">
		<div class="credits">
			<!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
          -->
			
		</div>
	</div>

<c:if test="${'직원' eq EmpVO.response_name}">
<script>
fieldsetDisable();
function fieldsetDisable()  {
	  const fieldset = document.getElementById('calenderManage');
	  fieldset.disabled = true;
	}
</script>
</c:if>
</section>