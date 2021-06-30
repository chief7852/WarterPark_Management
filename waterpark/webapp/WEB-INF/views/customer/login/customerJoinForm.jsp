
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${WCP}/resources/customer-assets/css/customerJoinCss.css"/>
<style>
	.form-head{
		margin-top:100px;
	}
	.form-control1{
		width:40%;
	}
	.distance{
		width : 100px;
	}
	.design{
/* 		background-image :url("${WCP}/resources/customer-assets/img/join_background.png");  */
		background-repeat: no-repeat;
		background-size : 100% 100%;
	}
	.design > div {
		width: 50%;
		margin : auto;
	}
	.error{
		color:red;
	}
	
</style>
<article class="container row" id="joinForm" >
	<div class="joinForm-header col-lg-4">
		<h1 class="joinForm-header">
			회원가입 <small>Sign up</small>
		</h1>
	</div>
	<form:form commandName="user" method="post" id="userForm"
		class="col-lg-8">
		<div class="design">
			<div>
				<div class="form-group">
					<label for="InputId" id="idForm" class="form-head distance">아이디</label> 
					<input type="text" class="form-control1" name="user_id" id="idInputForm" placeholder="아이디" value="${user.user_id}">
					<form:errors path="user_id" element="span" cssClass="error" />
				</div>
		
				<div class="form-group">
					<label for="InputPassword1" class="distance">비밀번호</label> <input type="password"
						class="form-control1" name="user_pass" id="user_pass"
						placeholder="비밀번호" value="${user.user_pass}">
					<form:errors path="user_pass" element="span" cssClass="error" />
				</div>
		
				<div class="form-group">
					<label for="InputPassword2" class="distance">비밀번호 확인</label> <input type="password"
						class="form-control1" name="user_pass2" id="user_pass2"
						placeholder="비밀번호 확인">
					<div class="passTag"></div>
				</div>
		
				<div class="form-group">
					<label for="username" class="distance">이름</label> <input type="text"
						class="form-control1" name="user_name" placeholder="이름을 입력해 주세요"
						value="${user.user_name}">
					<form:errors path="user_name" element="span" cssClass="error" />
				</div>
		
				<div class="form-group">
					<label for="InputEmail">주민 등록 번호</label><br> <input type="text"
						name="user_reg1" placeholder="주민등록번호 앞자리" value="${user.user_reg1}" maxlength='6'> 
					- <input type="password" name="user_reg2" placeholder="주민등록번호 뒷자리"
						value="${user.user_reg2}" maxlength='7'> 
					<form:errors path="user_reg1" element="span" cssClass="error" />
					<form:errors path="user_reg2" element="span" cssClass="error" />
				</div>
		
				<div class="form-group">
					<label for="InputEmail">전화 번호</label> <br> 
					<input type="text" class="col-md-6 col-md-offset-3" id="originPhone" name="user_hp"
						placeholder="전화 번호를 입력해 주세요" value="${user.user_hp}">
					
					<form:errors path="user_hp" element="span" cssClass="error" />
					<input type="hidden" id="to" name="to" />
					<!-- 인증번호 받을사람 휴대폰 번호 -->
					<input type="button" id="send" value="인증" /><br>
					<!-- 문자보내는 전송버튼 -->
					
					<div class="authBtn">
					
					</div> 
					<div id="phone-message">
						
					</div>
					<input type="hidden" id="userNum">
			<!-- 인증번호 입력창 -->
					<input type="hidden" id="enterBtn" value="확인">
				</div>
		
				<div class="form-group">
					<label for="InputEmail">이메일 주소</label> <input type="text"
						class="form-control col-md-10" name="user_mail" placeholder="이메일 주소를 입력해 주세요"
						value="${user.user_mail}">
					<form:errors path="user_mail" element="span" cssClass="error" />
				</div>
		
				<div class="agreement">
					<p>프로모션 정보 수신 동의 여부</p>
					<c:choose>
						<c:when test="${not empty sessionScope.agreementList }">
							<c:forEach items="${sessionScope.agreementList}" var="list">
								<c:if test="${list.clause_require eq 'N'}">
									<input type="radio" name="user_agree" class="agree" value="Y"
										checked>
									<label>동의</label>
									<input type="radio" name="user_agree" class="agree" value="N">
									<label>비동의</label>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<input type="radio" name="user_agree" class="agree" value="Y">
							<label>동의</label>
							<input type="radio" name="user_agree" class="agree" value="N"
								checked>
							<label>비동의</label>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="message">
					<c:if test="${not empty message}">
						${message}
					</c:if>
				</div>
				<div class="form-group text-center" id="buttonForm">
					<button type="submit" class="btn btn-info joinBtn">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="button"  onclick = "location.href = '${WCP}/customer'" class="btn btn-warning" id="cancleJoin">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</div>
		</div>
	</form:form>
</article>

<script src="${WCP}/resources/customer-assets/js/customerJoin.js" />
	





