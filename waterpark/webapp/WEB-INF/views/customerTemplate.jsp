<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title><tiles:getAsString name="title"/></title>
	<tiles:insertAttribute name="headData" />
	<tiles:insertAttribute name="preScript" />
		
	<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message}");
	</script>
</c:if>
</head>
<body>
	   
<header class="site-header sticky-top py-1">
  <tiles:insertAttribute name="headerMenu" />
</header>

<tiles:insertAttribute name="content" />

<footer id = "footerID" class="container py-5">
 	<tiles:insertAttribute name="footer" /> 
</footer>	
	<tiles:insertAttribute name="postScript"/>
</body>
</html>