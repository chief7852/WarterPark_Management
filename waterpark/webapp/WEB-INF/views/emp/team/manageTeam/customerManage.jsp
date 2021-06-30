.
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="${WCP}/resources/customer-assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${WCP}/resources/customer-assets/js/myjQueryPlugin.js"></script>
<script type="text/javascript" src="${WCP}/resources/customer-assets/js/jquery.form.min.js"></script>

<style>
	.centering{
		text-align:center;
		cursor:pointer;
	}
	
	.tableBox{
		min-height : 70%;	
	}
	
	.panel-default{
		height:700px;
	}
	
	.panel-body{
		height:90%;
	}
	
	.swal2-html-container{
   	  width: 483px !important;
      height: 104px;
      text-align: center;
      margin-left: 18px;
	}
	
	 .swal2-popup {
	  font-size: 1.6rem !important;
	  font-family: Georgia, serif;
     }
     
     #table{
     width:100%;
     border : none;
     }
     
     #searchUI{
     	margin:auto;
     	width:61%;
     }
</style>

<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Dashboard
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="index.html">홈 </a></li>
					<li><i class="fa fa-laptop"></i>경영총무팀</li>
					<li><i class="fa fa-laptop"></i>고객 관리</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-15">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-flag-o red"></i><strong>고객 목록</strong>
						</h2>
					</div>
					<div class="panel-body">
						<div class="tableBox">
							<table class="table bootstrap-datatable countries">
							<colgroup>
								<col width="4%">
								<col width="7%">
								<col width="16%">
								<col width="16%">
								<col width="16%">
								<col width="16%">
							</colgroup>
							<thead>
								<tr height="1">
									<th class="centering">번호</th>
									<th class="centering">아이디</th>
									<th class="centering">이름</th>
									<th class="centering">이메일</th>
									<th class="centering">전화번호</th>
									<th class="centering">가입일</th>
									<th class="centering">탈퇴일</th>
									<th class="centering">맴버십만료일</th>
									<th class="centering">프로모션</th>
									<th class="centering">잠김여부</th>
								</tr> 
							</thead>
							<tbody id="listBody">
								<c:choose>
									<c:when test="${not empty pagingVO.dataList }">
										<c:forEach items="${pagingVO.dataList }" var="user">
											<tr class="email-item">
												<td class="centering">${user.rnum }</td>
												<td class="centering userId">${user.user_id}</td>
												<td class="centering">${user.user_name}</td>
												<td class="centering">${user.user_mail}</td>
												<td class="centering">${user.user_hp }</td>
												<td class="centering">${user.user_date}</td>
												<c:if test="${empty user.user_del}">
													<td class="centering">-</td>
												</c:if>
												<c:if test="${not empty user.user_del }">
													<td class="centering">${user.user_del}</td>
												</c:if>
												<c:if test="${empty user.membership_date}">
													<td class="centering">-</td>
												</c:if>
												<c:if test="${not empty user.membership_date }">
													<td class="centering">${user.membership_date}</td>
												</c:if>
												<td class="centering">${user.user_protect}</td>
												<td class="centering">${user.agreement_check}</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
						</div>
						<table class="table bootstrap-datatable countries">
							<tr>
								<td colspan="8">
									<form id="searchForm" action="${WCP}/emp/customermanage">
										<input type="hidden" name="emp_id" value="${pagingVO.emp_id}" /> 
										<input type="hidden" name="searchType" value="${pagingVO.searchMap.searchType }" /> 
										<input type="hidden" name="searchWord" value="${pagingVO.searchMap.searchWord }" /> 
										<input type="hidden" name="minDate" value="${pagingVO.searchMap.minDate }" /> 
										<input type="hidden" name="maxDate" value="${pagingVO.searchMap.maxDate }" /> 
										<input type="hidden" name="page" />
									</form>
									<div id="searchUI" class="form-inline d-flex justify-content-center">
										<select name="searchType" class="form-control mr-2">
											<option value="">전체</option>
											<option value="id">아이디</option>
											<option value="name">이름</option>
											<option value="email">이메일</option>
										</select> 
										<input class="form-control mr-2" type="text" name="searchWord" 
											    value="${pagingVO.searchMap.searchWord }" />
										<input class="form-control mr-2" type="date" name="minDate"
											    value="${pagingVO.searchMap.minDate }" />
										<input class="form-control mr-2" type="date" name="maxDate"
											value="${pagingVO.searchMap.maxDate }" /> 
										<input class="btn btn-primary mr-2" id="searchBtn" type="button"
											value="검색" /> 
									</div>
									<div id="pagingArea" class="d-flex justify-content-center"> 
										${pagingVO.pagingHTMLBS }
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<script type="text/javascript" src="${WCP}/resources/emp-js/customerManage.js"></script>













