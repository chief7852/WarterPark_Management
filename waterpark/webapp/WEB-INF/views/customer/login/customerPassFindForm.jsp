<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.form_title_p {
	padding: 30px;
}

.form_item_name {
	margin-top: 20px;
}

.form_input {
	margin-bottom: 30px;
}

.form-group{
	width:50%!important;
}

.form_submit_button {
	margin: 20px auto;
}

#container {
	margin:auto;
	margin-top: 250px;
	margin-bottom: 150px;
}

.find-id-title{
	margin-bottom:30px;
}

.items{
	margin:10px auto;
}
</style>

<div id="container" class="col-md-6 col-md-offset-3">
	<div class="form-group">
		<h1 class="find-id-title">비밀번호 찾기</h1>
		아이디<input type="text" class="form-control items" id="userId"/>
		이름 <input type="text" class="form-control items" id="userName"/> 
		전화번호<input type="text" class="form-control items" id="userHp"/>
		<!-- 인증번호 받을사람 휴대폰 번호 -->
		<input type="button" class="btn btn-info items" id="send" value="인증" /><br>
		<!-- 문자보내는 전송버튼 -->
		<div id="inputForm">
			<input type='hidden' class="form-control items"  id='userNum'>
			<input type='hidden' class="form-control items btn-info" id='enterBtn' value='확인'>
		</div>
	</div>
</div>

<script>
	let sendSmsUrl = "/waterpark/customer/findpass";
	$("#send").click(function() {
		let user_id = $("#userId").val();
		let user_name = $("#userName").val();
		let user_hp = $("#userHp").val();
		$.ajax({
			url : sendSmsUrl,
			type : 'post',
			data : {
				'user_name' : user_name,
				'user_hp' : user_hp,
				'user_id' : user_id
			},
			dataType : 'json',
			success : function(resp) {
				if (resp.result == "OK") {
					intercept('번호 전송 완료', '인증 번호를 입력해주세요','warning',false);
					$("#userNum").attr('type', "text");
					$("#enterBtn").attr('type', 'button');
				} else {
					alert("응답은 성공임");
				}
			},
			error : function() {
				alert("에러에러");
			}
		})
	});

	$("#enterBtn").click(function() {
		let sendUserNumURL = "/waterpark/customer/getPhoneNumForAuth";
		let user_num = $("#userNum").val();
		console.log(user_num);
		$.ajax({
			url : sendUserNumURL,
			type : 'post',
			data : {
				'user_num' : user_num
			},
			dataType : 'json',
			success : function(resp) {
				if (resp.result == "FAIL") {
					alert("입력한 전화번호가 일치하지 않습니다.");
					$("#userNum").attr('type', "hidden");
					$("#enterBtn").attr('type', 'hidden');
				} else {
					intercept('인증 성공','5초 후 비밀번호 변경 페이지로 이동합니다','warning',false);
					setTimeout(function(){
						location.href = "/waterpark/customer/pass";
					}, 5000);
				}
			}
		})
	})
	
	let intercept = function(title,text,icon,button){
		Swal.fire({
		  title: title,
		  text: text,
		  icon: icon,
		  showCancelButton: button,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		});
	}
</script>
