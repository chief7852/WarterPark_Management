<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link href="/waterpark/resources/bootstrap-5.0.0-dist/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="/waterpark/resources/emp-css/bootstrap-theme.css"
	rel="stylesheet">
<script type="text/javascript" src="${WCP}/resources/js/priceFormmating.js"></script>
<style>
.centering {
	text-align: center;
}

.right-position {
	float: right;
	font-size: 50px;
}

.panel-body {
	padding: 29px;
}

#searchUI{
	width: 70%;
    text-align: center;
    margin: auto;
    line-height: 31px
}

.labels{
	width:75%;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-9 col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2>
						<i class="fa fa-flag-o red"></i><strong>연간 이용권</strong>
					</h2>
				</div>
				<div class="panel-body">
					<table class="table bootstrap-datatable countries">
						<thead>
							<tr>
								<th class="centering">번호</th>
								<th class="centering">종류</th>
								<th class="centering">구입일</th>
								<th class="centering">만료일</th>
								<th class="centering">결제수단</th>
								<th class="centering">금액</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty ticketList}">
									<c:forEach items="${ticketList}" var="ticket"
										varStatus="status">
										<tr>
											<td class="centering">${ticket.rnum}</td>
											<td class="centering">${ticket.com_code_name}</td>
											<td class="centering">${ticket.pay_date}</td>
											<td class="centering">${ticket.membership_end}</td>
											<td class="centering">${ticket.pay_method}</td>
											<td class="centering">${ticket.pay_amount}원</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="centering" colspan="6">구매한 연간 이용권이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<c:if test="${not empty ticketList}">
						<div class="right-position">연간 이용권 구매 횟수 -
							${fn:length(ticketList)}</div>
					</c:if>
				</div>
				<div class="panel-heading">
					<h2>
						<i class="fa fa-flag-o red"></i><strong>이용 내역</strong>
					</h2>
				</div>
				<div class="panel-body">
					<table class="table bootstrap-datatable countries">
						<thead>
							<tr>
								<th class="centering">번호</th>
								<th class="centering">구매일</th>
								<th class="centering">이용 예정일</th>
								<th class="centering">이용일</th>
								<th class="centering">환불</th>
								<th class="centering">할인</th>
								<th class="centering">금액</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty infoList}">
									<c:forEach items="${infoList}" var="info">
										<tr>
											<td class="centering">${info.rnum}</td>
											<td class="centering">${info.res_date}</td>
											<td class="centering">${info.res_predate}</td>
											<c:if test="${not empty info.use_date }">
												<td class="centering">${info.use_date}</td>
											</c:if>
											<c:if test="${empty info.use_date }">
												<td class="centering">-</td>
											</c:if>
											<c:if test="${empty info.res_cancel }">
												<td class="centering">-</td>
											</c:if>
											<c:if test="${not empty info.res_cancel}">
												<td class="centering">${info.res_cancel}</td>
											</c:if>
											<c:if test="${not empty info_sale_id }">
												<td class="centering">${info.sale_id}</td>
											</c:if>
											<c:if test="${empty info_sale_id }">
												<td class="centering">-</td>
											</c:if>
											<td class="centering">${info.pay_amount}원</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="centering" colspan="6">사용 내역이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<div class="panel-heading">
					<h2>
						<i class="fa fa-flag-o red"></i><strong>총 결제 금액</strong>
					</h2>
				</div>
				<div class="panel-body">
					<c:choose>
						<c:when test="${not empty total}">
							<div class="right-position">${total}원</div>
						</c:when>
						<c:otherwise>
							<div class="centering">사용 내역이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>

			</div>
		</div>
	</div>
</body>
</html>