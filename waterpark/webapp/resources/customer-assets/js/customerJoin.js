
$.generateMessage = function(message) {
		let messageTag = $("<span>").text(message ? message : "").addClass(
				"message").addClass("error");
		return messageTag;
	}

	var idReg = /^[a-z0-9]{5,19}$/;
	let IdenNum = /[0-9]/g
/*	let idTag = $("[name='user_id']").on("change", function() {
		idCheckBtn.trigger("click");
	})*/
	var regexp = /^[0-9]{10,11}$/
	let URL = "/waterpark/customer/idCheck";

	$("#idInputForm").on("change", function() {
		$(".error").remove();
		let idTag = $("[name='user_id']");
		let user_id = idTag.val();
		let isValid = idReg.test(user_id);
		if(isValid == true){
			$.ajax({
				url : URL,
				method : "post",
				data : {
					id : user_id
				},
				dataType : "json",
				success : function(resp) {
					let messageTag;
					if (resp.result != "OK") {
						messageTag = $.generateMessage("아이디 중복");
					} else {
						messageTag = $.generateMessage("통과");
					}
					idTag.next(".message").remove();
					idTag.after(messageTag);
				},
				error : function(xhr, error, msg) {
					console.log(xhr);
					console.log(error);
					console.log(msg);
				}
			});
		}else{
			let messageTag = $.generateMessage("아이디는 영소문자가 포함된 5~20자이어야 합니다.");
			idTag.next(".message").remove();
			idTag.after(messageTag);
		}
	});

	//Spring Validator 를 사용하지만 혹시 몰라서 남겨둠	
	//let passReg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

	let passTag = $(".passTag");
	
	
	$("#user_pass2").keyup(function() {
		$("#user_pass.errors").empty();
		passTag.next(".message:first").remove();
		let user_pass = $("#user_pass").val();
		let user_pass2 = $("#user_pass2").val();
		let messageTag = $.generateMessage("통과");
		
		if (user_pass != user_pass2) {
			messageTag = $.generateMessage("비밀번호가 일치하지 않습니다");
			passTag.after(messageTag);
			return;
		}
		
		let num = user_pass2.search(/[0-9]/g);
		let eng = user_pass2.search(/[a-z]/ig);
		let spe = user_pass2.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(user_pass2.length < 8 || user_pass2.length > 20){
		  messageTag = $.generateMessage("8자리 ~ 20자리 이내로 입력해주세요.");
		}else if(user_pass2.search(/\s/) != -1){
		  messageTag = $.generateMessage("비밀번호는 공백 없이 입력해주세요.");
		}else if(num < 0 || eng < 0 || spe < 0 ){
		  messageTag = $.generateMessage("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		}else {
		  messageTag = $.generateMessage("통과");
		}
		
		passTag.after(messageTag);
	})

	var count = 0; /* 문자 중복을 막기 위한 인증번호 */

	// 휴대폰 인증용 코드
	$("#originPhone").keyup(function() {
		$("#phone-message").empty();
		let value = $("#originPhone").val();
		if(!regexp.test(value)){
			messageTag = $.generateMessage("휴대전화는 하이폰(-)없이 숫자만 입력해주세요");
			$("#phone-message").append(messageTag);
		}
		
		$("#to").val(value);
	});

	$(document).ready(function(){
	      $("#send").click(function() {
				var to = $("#to").val();
				if (to == "" || to == null || !regexp.test(to)) {
					Swal.fire({
						  title: '잘못된 형식',
						  text: '번호를 입력해주세요',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						});
				} else {
					var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");  //문자를 보낼껀지 물어본다 
					if (con_test == true) {
						if (count < 3) {  //추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 
							var to = $("#to").val();
							let phoneUrl = '/waterpark/customer/sendSms';
							$.ajax({
								url : phoneUrl,
								type : "post",
								data : {
									"to" : to
								},
								success : function() {
									$("#userNum").attr("type",'text')
									$("#enterBtn").attr("type",'button')
									Swal.fire({
									  title: '인증 번호 발송',
									  text: '해당 휴대폰으로 인증번호를 발송했습니다',
									  icon: 'success',
									  showCancelButton: false,
									  confirmButtonColor: '#3085d6',
									  cancelButtonColor: '#d33',
									});
									count++;
								},
								error : function(xhr,status) {
									console.log(xhr)
									console.log(status)
								}
							});
						} else {
							alert("휴대폰 인증 그만하세요")
						}
					}
				}
			})
			let phoneAuthTag = $("#enterBtn");
			$("#enterBtn")
					.click(
							function() { /* 내가 작성한 번호와 인증번호를 비교한다 */
								var userNum = $("#userNum").val();

								if (userNum == null
										|| userNum == "") {
									alert("휴대폰으로 발송된 인증번호를 입력해주세요");
								} else {

									if (userNum.trim() != null) {
										let phoneAuthURL = "/waterpark/customer/phoneAuth";
										userNum = userNum.trim();
										$
												.ajax({
													url : phoneAuthURL,
													type : 'post',
													data : {
														"inputNum" : userNum
														
													},
							 						success : function(
															resp) {
														if (resp.result == "OK") {
															Swal.fire({
															  title: '인증 성공',
															  text: '인증을 성공했습니다',
															  icon: 'success',
															  showCancelButton: false,
															  confirmButtonColor: '#3085d6',
															  cancelButtonColor: '#d33',
															});
															$(".authBtn").empty();
															$(".authBtn").append("인증번호 :")
															$(
																	"#buttonForm")
																	.preappend(
																			"<button type='submit' class='btn btn-info'> 회원가입<i class='fa fa-check spaceLeft'></i> </button>"); // 태크 초기화
														} else {
															Swal.fire({
															  title: '인증 실패',
															  text: '인증 번호가 올바르지 않습니다',
															  icon: 'warning',
															  showCancelButton: false,
															  confirmButtonColor: '#3085d6',
															  cancelButtonColor: '#d33',
															});
														}
													}
												})

									} else {
									}
								}
							});
		});