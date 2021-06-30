<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css'
	rel='stylesheet' type='text/css'>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
<link href="${WCP }/resources/emp-css/emplogin.css" type="text/css"
	rel="stylesheet">

<link rel="stylesheet" href="${WCP }/resources/fakeloader/css/demo.css">
<link rel="stylesheet" href="${WCP }/resources/fakeloader/css/fakeLoader.min.css">
<script type="text/javascript" src="${WCP}/resources/customer-assets/js/jquery-3.6.0.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body >

<c:if test="${not empty authority }">
	<script type="text/javascript">

Swal.fire({
	  icon: 'error',
	  title: '접근 권한이 없습니다.',
	  text: '${authority}'
	})
	</script>

</c:if>


        <div class="fakeloader"></div>
        
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-2"></div>
			<div class="col-lg-6 col-md-8 login-box">
				<div class="col-lg-12 login-title">
					<img src="${WCP }/resources/emp-img/titleName.JPG">
				</div>
				<div class="col-lg-12 login-key">
					<i class="fa fa-key" aria-hidden="true"></i>직원 로그인
				</div>

				<div class="col-lg-12 login-form">
					<div class="col-lg-12 login-form">
						<form method="post" action="/waterpark/emp/empLogin">
							<div class="form-group">
								<label class="form-control-label">아이디</label> <input type="text"
									class="form-control" name="user_id"
									value="${sessionScope.idFailCntEmp.user_id}"> 
							</div>
							<div class="form-group">
								<label class="form-control-label">비밀번호</label> <input
									type="password" class="form-control" name="user_pass">
							</div>

							<div class="col-lg-12 loginbttm">
								<div class="col-lg-6 login-btm login-text">
									<!-- Error Message -->
								</div>
								<div class="col-lg-6 login-btm login-button">
									<button class="visibleBorderLeftRight" type="submit" class="btn btn-outline-primary">로그인</button>
								</div>
							</div>

							<div class="errorBox">
								<c:if test="${not empty sessionScope.idFailCntEmp}">
									${sessionScope.idFailCntEmp.errorMsg}
									<c:remove var="sessionScope.idFailCntEmp" />
								</c:if>
							</div>
						</form>
						<form method="post" action="${WCP}/emp/empLogin">
							<input type="submit" value="경영총무"/>
							<input name="user_id" type="hidden" value="EP2021062501"/>
							<input type="hidden" name="user_pass" value="java" />
						</form>
						<form method="post" action="${WCP}/emp/empLogin">
							<input type="submit" value="스낵"/>
							<input name="user_id" type="hidden" value="EP2021062502"/>
							<input type="hidden" name="user_pass" value="java" />
						</form>
						<form method="post" action="/waterpark/emp/empLogin">
							<input type="submit" value="매표소" /> 
							<input name="user_id" type="hidden" value="EP2021062601" /> 
							<input type="hidden" name="user_pass" value="java" />
						</form>
					</div>
				</div>
				<div class="col-lg-3 col-md-2"></div>
			</div>

		</div>
        <script src="${WCP }/resources/fakeloader/js/fakeLoader.min.js"></script>
        <script>
            $(document).ready(function(){
                $.fakeLoader({
                    timeToHide:600,
                    bgColor:"#222D32",
                    spinner:"spinner3"
                });
            });

        </script>

        <div class="fakeLoader"></div>

    </body>
</html>