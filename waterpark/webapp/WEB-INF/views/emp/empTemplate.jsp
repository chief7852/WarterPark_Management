<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<title><tiles:getAsString name="empTitle" /></title>
	<tiles:insertAttribute name="empHeadData"/>
</head>
<body>
	 <section id="container" class="">
	 	<tiles:insertAttribute name="empHeaderMenu"/>
	 	<tiles:insertAttribute name="empAsideBar"/>
	 	<tiles:insertAttribute name="empContent"/>
	</section>
	
	<tiles:insertAttribute name="empPostScript" />
</body>
</html>