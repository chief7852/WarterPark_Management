<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.login_container {
		margin-top: 150px;
		margin-bottom: 100px;
	}
	
	#container{
	    margin-top: 12%;
	}
	
	.form_container {
		padding: 30px;
	}
</style>
</head>
<body>
	<div id="container" class="main_container">
			<div class="form_container">
				<div>
					<div class="form-group">
						<h2>고객 아이디</h2>
					</div><br>
					<div>
						<c:choose>
							<c:when test="${not empty sessionScope.user_id}">
								<h3>${sessionScope.user_id}</h3>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
	</div>
</body>
</html>