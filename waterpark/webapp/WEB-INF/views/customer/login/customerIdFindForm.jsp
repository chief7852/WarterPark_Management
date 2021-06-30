.<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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

.form_submit_button {
	margin: 20px auto;
}

.form-group{
	width:50%!important;
}

#container {
    margin: auto;
    margin-top: 9%;
    margin-bottom: 6%;
}

.find-id-title{
	margin-bottom:30px;
}

.items{
	margin:10px auto;
}

</style>
<div id="container" class="col-md-6 col-md-offset-3">

  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><img src="${WCP }/resources/emp-img/idmsg.jpg"></li>
  </ul>
	<div class="form-group">
		<h1 class="find-id-title">아이디 찾기</h1>
		이름 <input class="form-control items" type="text" id="userName"> 
		전화번호<input class="form-control items" type="text" id="userHp" name="userHp" />
		<input type="button" class="btn btn-info items" id="send" value="인증" />
		<input type="button" class="items btn-info btn"id="testBtn" value="인증 데이터"/>
		<br>
		<div id="inputForm">
			<input type='hidden' class="form-control items" id='userNum'>
			<input type='hidden' class="form-control items btn-info" id='enterBtn' value='확인'>
			  <input value="문자내용" class="btn btn-primary" type="hidden" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
				    
				  
			<div class="dropdown">

</div>
		</div>
		<div id="timer"></div>
		
	</div>
</div>

<script>
	$("#dropdownMenuButton1").on("click",function(){
		Swal.fire({
			  title: 'Sweet!',
			  text: 'Modal with a custom image.',
			  imageUrl: '${WCP }/resources/emp-img/idmsg.jpg',
			  imageWidth: 500,
			  imageHeight: 600,
			  imageAlt: 'Custom image',
			})
	})

	$("#testBtn").on("click",function(){
		$("#userName").val("김철수");
		$("#userHp").val("01072291828");
	});

	let sendSmsUrl = "/waterpark/customer/findid";
	$("#send").click(function() {
		let user_name = $("#userName").val();
		let user_hp = $("#userHp").val();
		console.log(user_name);
		console.log(user_hp);
		$.ajax({
			url : sendSmsUrl,
			type : 'post',
			data : {
				'user_name' : user_name,
				'user_hp' : user_hp
			},
			dataType : 'json',
			success : function(resp) {
				if (resp.result == "OK") {
					let time = 180;
					let min = "";
					let sec = "";
					Swal.fire({
					  title: '인증번호 전송 성공!',
					  text: '휴대폰의 인증번호를 입력해 아이디를 찾아주세요',
					  icon: 'success',
					  showCancelButton: false,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					});
					$("#userNum").attr('type', "text");
					$("#enterBtn").attr('type', 'button');
					$("#dropdownMenuButton1").attr('type', 'button');
					setInterval(function(){
						min = parseInt(time/60);
						sec = time%60;
						console.log(min);
						console.log(sec);
						$("#timer").html("<p>"+min + "분 " + sec+"초</p>");
						time--;
						
						if(time<0){
							$("#timer").empty()
							$("#timer").html("<p>시간 초과</p>");
							$("#userNum").attr('type', "hidden");
							$("#enterBtn").attr('type', 'hidden');
						}
					},1000);
				} else {
					Swal.fire({
					  title: '잘못된 입력',
					  text: '입력된 값이 올바르지 않습니다',
					  icon: 'warning',
					  showCancelButton: false,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					});
				}
			},
			error : function() {
				console.log("실패");
			}
		})
	})

	$("#enterBtn").click(function() {
		let sendUserNumURL = "/waterpark/customer/getPhoneNumForAuth";
		let user_num = $("#userNum").val();
		console.log(userNum);
		$.ajax({
			url : sendUserNumURL,
			type : 'post',
			data : {
				'user_num' : user_num
			},
			dataType : 'json',
			success : function(resp) {
				if (resp.result == "FAIL") {
					Swal.fire({
					  title: '인증 실패!',
					  text: '입력한 전화번호가 일치하지 않습니다.',
					  icon: 'warning',
					  showCancelButton: false,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					});
				} else {
					let win = window.open("/waterpark/customer/id", "Id", "width=250,height=250");
					setTimeout(function(){
						win()
					},5000)
					location.href = "/waterpark/customer/login";
				}
			}
		})
	})

</script>