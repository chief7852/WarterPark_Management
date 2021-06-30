<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.login_container {
	margin-top: 150px;
	margin-bottom: 100px;
}

.form_container {
	padding: 30px;
    margin-top: 15%;
}

.items{
	margin:10px auto;
}

.error{
	color : red;
}
</style>

<div id="container" class="main_container">
	<div class="form_container">
		<div>
			<h2>비밀번호 변경</h2>
			<div>
				<c:choose>
					<c:when test="${not empty sessionScope.user_id}">
						<input type="hidden" id="user_id" value="${sessionScope.user_id}" />
					</c:when>
				</c:choose>
			</div>
			<input type="password" class="form-control items" id="user_pass1" /> 
			<input type="password" class="form-control items" id="user_pass2" /> 
			<input type="button" class="btn btn-info items" id="submit" value="변경하기" />
			<div class="passTag"></div>
			<!-- 인증번호 입력창 -->
		</div>
		<br> <br>
	</div>
</div>
<script>
	 let changePassUrl = "/waterpark/customer/changeUserPass";
	 
	 let passTag = $(".passTag");
	 
	 $.generateMessage = function(message) {
			let messageTag = $("<span>").text(message ? message : "").addClass(
					"message").addClass("error");
			return messageTag;
		}
	 
 	 var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	 $("#user_pass2").keyup(function() {
		passTag.next(".message:first").remove();
		let user_pass1 = $("#user_pass1").val();
		let user_pass2 = $("#user_pass2").val();
		
		let messageTag = $.generateMessage("통과");
		if (user_pass1 != user_pass2) {
			messageTag = $.generateMessage("비밀번호가 일치하지 않습니다");
			passTag.after(messageTag);
			return;
		}
		
		if(!regex.test(user_pass2)){
			messageTag = $.generateMessage("비밀번호는 대문자, 소문자, 숫자와 특수문자를 포함해야 합니다.")
			passTag.after(messageTag);
			return;
		}	

	})
		
	 $("#submit").on("click",function(){
		 let user_id = $("#user_id").val();
		 let user_pass1 = $("#user_pass1").val();
		 let user_pass2 = $("#user_pass2").val();
		 $.ajax({
			 url : changePassUrl,
			 dataType : 'json',
			 data : {
				'user_id' : user_id,				 	
				'user_pass1' : user_pass1,				 	
				'user_pass2' : user_pass2,				 	
			 },
			 type : 'post',
			 success : function(resp){
				if(resp.result=="OK"){
				  alert("성공");
				  location.href="/waterpark/customer/login";
				}else{
					alert("응답은 햇는데 오류!")
				}
			 },error : function(){
				 alert("왜안돼지?");
			 }
		 })
	 });
	 
</script>











