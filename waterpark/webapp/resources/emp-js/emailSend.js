	/* 이메일 보내면 websocket으로 전송 */
	
	

	$(document).on("click", ".sendBtn", function() {
		let empInfos = $(".empInfo");
		let to_emp_ids = new Array();
		$(empInfos).each(function(i, empInfo) {
			let value = $(empInfo).data("id")
			to_emp_ids[i] = value;
		});
		let emailSocket = {
			"category" : "email",
			"to_emp_ids" : to_emp_ids
		}
		let formData = $("#emailForm")[0];
		console.log($("#email_cont").val());
		console.log("아 큰일낫다");
		var data = CKEDITOR.instances.email_cont.getData();
		$("#hidden_email_cont").val(data);
		var form_data = new FormData(formData);
		$.ajax({
			url : WCP+"/emp/sendEmail",
			type : 'post',
			contentType : false,
			processData : false,
			data : form_data,
			success : function(resp) {
				console.log("전송 성공");
				if (resp.result == "OK") {
					webSocket.sendChat(emailSocket);
					location.href = WCP+'/' + resp.view
				} else {
					intercept("실패!", resp.message, 'warning');
				}
			},
			error : function() {
				intercept("실패!", "전송 실패", 'warning');
			}
		});
	})

	$(document).on("change", function() {
		console.log($(".form-control").text());
		console.log($(".form-control").val());
	})

	let findEmpURL = WCP+"/emp/findEmp";
	let sendEamilURL = WCP+"/emp/sendEmail";
	CKEDITOR.replace('email_cont', {
		filebrowserUploadUrl : WCP+'/emp/emailImages?type=Images'
	});

	$("#receivers").keyup(function() {
			let receiver = $(".email_receiver").val();
			$.ajax({
					url : findEmpURL,
					dataType : 'json',
					method : 'post',
					data : {
						'receiver' : receiver
					},
					success : function(resp) {
				      if(resp.empList.length != 0 ){
				    	  $(".dropdown-menu1").empty();
				    	  $(".dropdown-menu1").css("padding","5px")
				    	  $(".dropdown-menu1").css("border","1px solid");
						  resp.empList.forEach(function(emp, idx) {
						  $('.dropdown-menu1').append("<li><a class='dropitem' data-value='"+emp.emp_id+"' data-name='"
									+emp.emp_name+"' data-team = '"
									+ emp.team_name+"'>"
									+ emp.emp_name
									+ " ("
									+ emp.team_name
									+ ")</a></li>");
								})
						}else{
							/* <ul class="dropdown-menu1" aria-labelledby="dropdownMenuButton2"> */
							console.log("이거 드러옴?")
							$(".dropdown-menu1").css("padding","0px")
							 $(".dropdown-menu1").css("border","0px");
							$(".dropdown-menu1").empty();
						}
				    
				      },
						error : function() {
							console.log("실패")
						}
					});
						
				console.log("아 이거 왜 안돼");
			});
	
	$(document).on("click",".dropdown-menu1 li",function() {
			$(".dropdown-menu1").empty();
			$(".dropdown-menu1").css("border","0px");
			$(".dropdown-menu1").css("padding","0px")
			$("#receivers").val("");
			let name = $(this).find(".dropitem").data("name");
			let team = $(this).find(".dropitem").data("team");
			let empid = $(this).find(".dropitem").data("value");
			let valid = true;
			let classList = $(".receiver-bucket").find('.empInfo');
			if(empid == ""){
				return;
			}
			
			$.each(classList,function(index, item) {
				if (empid == $(item).data("id")
						|| $(item).data("id") == null) {
					console.log("받아온 아이디 : "
							+ $(item).data("id"));
					valid = false;
				}
				if (item == null || item == ""
						|| item == undefined) {
					valid = false;
				}
			});
			
			if (valid) {
				if (empid == undefined) {
					return;
				}
				$('.receiver-bucket')
				.append(
					"<input class='empInfo' type='text' name='email_id_list' data-id = '"
					+ empid + "'value='"
					+ empid + " " + name + "("
					+ team + ")"
					+ "' readonly></input>" 
					+ "<span class='delBtnEmp btn btn-danger'>-</span>");
			}
			/* */
		})
	let cnt = 0;
	$(document).on("click",".plusBtn",function() {
		cnt += 1;
		if (cnt > 4) {
			alert("파일은 최대 4개만 첨부가 가능합니다.");
			return;
		}
		console.log("plusBtn cliecked!");
		$('.fileArea')
				.append(
						"<p class='clone-p'><input class='form-control' type='file' name='email_files'/><span class='delBtn btn btn-danger'>-</span></p>");
	});

	$(document).on("click", ".delBtnEmp", function() {
		console.log("remove empList Clieckd!");
		$(this).prev().remove();
		/* 		console.log($(this).parent().val());
		 console.log("id : "+ $(this).parent().find('.empInfo').data("id")); */
		$(this).remove();
	})

	let emailForm = $("#emailForm");

	$(document).on("click", ".delBtn", function() {
		console.log("remove Btn Clicked!");
		$(this).parent(".clone-p").remove();
		$(this).remove();
	});

	let intercept = function(title, text, icon, button) {
		Swal.fire({
			title : title,
			text : text,
			icon : icon,
			showCancelButton : button,
			confirmButtonColor : '#3085d6',
			cancelButtonColor : '#d33',
		});
	}
	
	$(document).on("click","#dropdownMenuButton2",function(){
		$(".dropdown-menu1").toggle();
	})