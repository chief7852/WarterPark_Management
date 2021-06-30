<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.errorBox {
	color: red;
}

.form_submit_button{
	background-color : dodgerblue;
}

.title-align{
	margin-top : 50px;
}	

</style>

<section>
<div id="container" class="main_container">
	<div class="login_container">
		<div class="form_container">
			<form method="post" action="/waterpark/customer/login">
				<div class="form_title_div">
					<p class="form_title_p title-align">
						<a href="customerMain">대덕 워터파크</a>
					</p>
				</div>
				<div>
					<div>
						<a class="form_item_name">유저 아이디</a>
					</div>
					<div>
						<c:choose>
							<c:when test="${cookie.savedUserId.name eq 'savedUserId' }">
								<input id="userId" type="text" name="user_id"
								placeholder="Enter UserId" class="form-control form_input"
								value="${cookie.savedUserId.value}" />
							</c:when><c:otherwise>
								<input id="userId" type="text" name="user_id"
								placeholder="Enter UserId" class="form-control form_input"
								value="${sessionScope.idFailCnt.user_id}" />
							</c:otherwise>
					    </c:choose>
						<form:errors path="user_id" element="span" cssClass="error" />
					</div>
				</div><br>
				<div>
					<div>
						<a class="form_item_name">비밀번호 </a>
					</div>
					<div>
						<input type="password" name="user_pass"
							placeholder="Enter Password" class="form-control form_input" />
						<form:errors path="user_pass" element="span" cssClass="error" />
					</div>
				</div>
				<br>
				<div style="height: 10px;"></div>
				<c:choose>
						<c:when test="${cookie.savedUserId.name eq 'savedUserId' }">
               	       		<input type="checkbox" id="idRemember" name="idRemember" checked>아이디 기억하기                                 
                        </c:when>
                        <c:otherwise>
                            <input type="checkbox" id="idRemember" name="idRemember">아이디 기억하기
                        </c:otherwise>
                </c:choose>
				<input class="form_submit_button form-control" type="submit" id="login" value="로그인">
			</form>
			<br>
			<div class="errorBox">
				<c:if test="${not empty sessionScope.idFailCnt }">
						${sessionScope.idFailCnt.errorMsg}
				</c:if>
			</div>
			<br>
			<div>아이디 혹은 비밀번호가 기억이 안난다면?</div>
			<br>
			<div>
				<a href="${WCP}/customer/findid" class="active">아이디 찾기</a> / <a
					href="${WCP}/customer/findpass" class="active">비밀번호 찾기</a>
		</div>
		
		<form method="post" action="/waterpark/customer/login">
			<input type="submit" value="테스트 로그인"/>
			<input name="user_id" type="hidden" value="ddit302"/>
			<input type="hidden" name="user_pass"value="java" />
		</form>
		</div>
	</div>
</div>
</section>















