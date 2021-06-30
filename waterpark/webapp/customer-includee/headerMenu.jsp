<%@page import="kr.or.waterpark.customer.common.join.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center">
	<div class="container d-flex align-items-center">

		<c:url value="/customer/info" var="infoURL" />
		<c:url value="/" var="CURL" />
		<c:url value="/customer/use-info" var="useInfoURL" />
		<h1 class="logo me-auto">
			<a href="${CURL }">대덕 워터파크</a>
		</h1>
		<nav id="navbar" class="navbar">
			<ul>
				<li><a href="${WCP }" class="active">홈으로</a></li>

				<li class="dropdown"><a href="${infoURL }/customerIntro"><span>워터파크
							소개</span> <i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="${WCP}/customer/info/customerIntro">회사소개</a></li>
						<li><a href="${WCP}/customer/info/openInfo">개장정보</a></li>
						<li><a href="${WCP}/customer/info/facilities">시설소개</a></li>
					</ul></li>

				<li class="dropdown"><a href="#"><span>이용정보</span> <i
						class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="${WCP }/customer/use-info/ticket">이용권 안내</a></li>
						<li><a href="${WCP }/customer/use-info/coin">포켓코인</a></li>
						<li><a href="${WCP }/customer/use-info/map">오시는길</a></li>
						<li><a href="${WCP }/customer/use-info/reserve">예매</a></li>
						<li><a href="${WCP }/customer/use-info/reserveInfo">예매내역</a></li>
					</ul></li>

				<li class="dropdown"><a href="#"><span>고객대응게시판</span>
						<i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="${WCP }/customer/use-info/notice?luboardCode=NT">공지사항</a></li>
						<li><a href="${WCP }/customer/use-info/faq?luboardCode=FQ">FAQ</a></li>
						<li><a href="${WCP }/customer/use-info/lost?luboardCode=LO">분실/유실물</a></li>
					</ul></li>

				<li><a href="${WCP }/customer/qna"><span>문의사항</span></a></li>
				<c:choose>
					<c:when test="${not empty sessionScope.UserVO}">
						<li><a href="${WCP }/customer/logout" class="active">로그아웃</a></li>
						<li><a href="${WCP }/emp/empLogin" target='_blank' class="active">직원로그인</a></li>
					</c:when>

					<c:otherwise>
						<li><a href="${WCP }/customer/login" class="active">로그인</a></li>
						<li><a href="${WCP }/emp/empLogin" target='_blank' class="active">직원로그인</a></li>
						<li><a href="${WCP }/customer/clause" class="getstarted">회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
		<!-- .navbar -->
	</div>
</header>
<!-- End Header -->