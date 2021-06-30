<%@page import="kr.or.waterpark.customer.common.join.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title><tiles:getAsString name="customerTitle" /></title>
<tiles:insertAttribute name="customerHeadData" />
<tiles:insertAttribute name="customerPreScript" />

<%-- <c:if test="${not empty message }"> --%>
<!-- 	<script type="text/javascript"> -->
<%-- // 		alert("${message}"); --%>
<!-- 	</script> -->
<%-- </c:if> --%>
</head>
<body>
	<header class="site-header sticky-top py-1">
		<tiles:insertAttribute name="customerHeaderMenu" />
	</header>
	<section id="customer-cover-section">
	<tiles:insertAttribute name="customerContent" />
	</section>
	<footer id="footerID" class="container py-5">
		<tiles:insertAttribute name="customerFooter" />
	</footer>
	<tiles:insertAttribute name="customerPostScript" />
</body>
</html>