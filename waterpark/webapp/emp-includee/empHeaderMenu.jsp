
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="header dark-bg">
	<nav id="empHeadnav" class="navbar navbar-dark bg-dark">

	<!--logo start-->
	<img id="titleImage" src="${WCP }/resources/emp-img/empHeadTitle.JPG"><a href="${WCP}/emp" class="logo"></a>&nbsp;
	<!--logo end-->
	<ul id="navMenu">
		<li class="liList"><a class="aList" href="${WCP}/emp" class="menuList">홈으로 </a></li>
		
		<li class="liList"><a class="aList" href="${WCP}/emp/email" class="menuList">메모 관리</a></li>
		<li class="liList"><a class="aList" href="${WCP}/emp/notice?lreportCode=NT" class="menuList">공지사항</a></li>
		<li class="liList"><a class="aList" href="${WCP }/customer/use-info/lost?luboardCode=LO" class="menuList">분실물</a></li>
		<!--각 content들은 알아서 수정! views/emp/sales안에 있음 -->
			
		<c:choose>
			<c:when test="${not empty sessionScope.EmpVO }">
				<c:if test="${'MN' eq sessionScope.EmpVO.user_auth}">
					<li><a class="aList" href="${WCP}/emp/manageteam" class="menuList">경영총무팀 업무</a></li>
				</c:if>
				<c:if test="${'TO' eq sessionScope.EmpVO.user_auth}">
					<li><a class="aList" href="${WCP}/emp/sales/boxOffice" class="menuList">매표소 업무</a></li>
				</c:if>
				<c:if test="${'SN' eq sessionScope.EmpVO.user_auth}">
					<li><a class="aList" href="${WCP}/snack" class="menuList">스낵팀 업무</a></li>
				</c:if>
			</c:when>
		</c:choose>
		
	</ul>

	</nav>
</header>