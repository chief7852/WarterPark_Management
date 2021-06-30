$(".fileEnroll").on("click",function () {
		$("#modal").show();
	});
	function closeModal() {
		$('.searchModal').hide();
	};
	
	$(".sendFile").on("click",function(){
		Swal.fire({
			  title: '등록하시겠습니까?',
			  text: "정보를 등록합니다.",
			  icon: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네!'
		}).then((result) => {
		    if (result.isConfirmed) {
		    	$("#emp_id2").val($("#emp_id").val());
		    	let formData = $("#fileEnrollForm")[0];
		    	let form_data = new FormData(formData);
		    	$.ajax({
		    		url : "/waterpark/emp/resumeenroll",
		    		type :"post",
		    		dataType : 'json',
		    	    contentType: false,
			        processData: false,
			        data : form_data,
			        success : function(resp){
			        	if(resp.result == "OK"){
			        		Swal.fire({
			      			  title: '성공',
			      			  text: "이력서가 생성됐습니다. 5초후 창이 닫힙니다.",
			      			  icon: 'success',
			      			  showCancelButton: false,
			      			  confirmButtonColor: '#3085d6',
			      			  cancelButtonColor: '#d33',
			      			  confirmButtonText: '네!'
			        		})
			        		setTimeout(function() {
							  window.close();
							}, 5000);
			        		console.log("testing!");
			        	}else{
			        		console.log("실패!");
			        	}
			        }, error : function(){
			        	console.log("아니 왜안돼 ㅠㅠ");
			        }
		    	})
		    } 
		});
	})
	
	let degreeNum = 0;
	let careerNum = 0;
	$(".plus-degree").on("click",function(){
		$(".degreeTable").after("<tr>"
				+"<td><input type='text' class='inputTag infos' name='degrees["+degreeNum+"].eh_degree' /></td>"
				+"<td><input type='text' class='inputTag infos' name='degrees["+degreeNum+"].eh_date' /></td>"
				+"<td><input type='text' class='inputTag infos' name='degrees["+degreeNum+"].eh_name' /></td>"
				+"<td><input type='text' class='inputTag infos' name='degrees["+degreeNum+"].eh_major' /></td>"
				+"<td><input type='text' class='inputTag infos' name='degrees["+degreeNum+"].eh_complete' /></td>"
			+"</tr>");
		degreeNum += 1;
		
		
	});
    let resumeForm2 = $("#resumeForm2");
	let createInput = function(){
		let infos = $(".infos");
		$(infos).each(function(i, info){
			let name = $(info).attr("name");
			let val = $(info).val();
			console.log(val);
			let code = $("<input>").attr({"type":"hidden", "name":name,"value":val});
			$(resumeForm2).append(code);
			
		});
		$("#resumeForm2").find("input[name=cont_month]").val(
				$("#resumeForm").find("input[name=cont_month]").val()	
		);
		
		$("#resumeForm2").find("input[name=cont_date]").val(
				$("#resumeForm").find("input[name=cont_date]").val()	
		);
		
		$("#resumeForm2").find("input[name=cont_year]").val(
				$("#resumeForm").find("input[name=cont_year]").val()	
		);
		
		$("#resumeForm2").find("input[name=address]").val(
				$("#resumeForm").find("input[name=address]").val()	
		);
		
		$("#resumeForm2").find("input[name=emp_chinese]").val(
				$("#resumeForm").find("input[name=emp_chinese]").val()	
		);
		
		$("#resumeForm2").find("input[name=emp_birth]").val(
				$("#resumeForm").find("input[name=emp_birth]").val()	
		);
		
		console.log("받아온 값음"); 	
		console.log($("#resumeForm2").find("input[name=address]").val());
		$("#resumeForm2").find("input[name=emergency_call]").val(
				$("#resumeForm").find("input[name=emergency_call]").val()	
		);
		console.log($("#resumeForm2").find("input[name=emergency_call]").val());
		console.log("받아온 값음");
		$("#resumeForm2").find("input[name=emp_hp]").val(
				$("#resumeForm").find("input[name=emp_hp]").val()	
		);
		console.log($("#resumeForm2").find("input[name=emp_hp]").val());
		console.log("받아온 값음");
	};
	
 	$(".plus-experience").on("click",function(){
 		$(".experienceTable").after("<tr>"
				+"<td><input type='text' class='inputTag infos' name='careers["+careerNum+"].career_com' /></td>"
				+"<td><input type='text' class='inputTag infos' name='careers["+careerNum+"].career_com_addr' /></td>"
				+"<td><input type='text' class='inputTag infos' name='careers["+careerNum+"].career_start' />"
				+"<input type='text' class='inputTag infos' name='careers["+careerNum+"].career_end' /></td>"
				+"<td><input type='text' class='inputTag infos' name='careers["+careerNum+"].career_position' /></td>"
				+"<td colspan='2'><input type='text' class='inputTag infos' name='careers["+careerNum+"].lisence' /></td>"
			+"</tr>");
 		careerNum +=1 ;
 	})
 	
 	$(".inputTag").on("change",function(){
 		console.log("되냐?");
 		console.log($(".resume").find(this));
 	})
 	
 	$(".sub-degree").on("click",function(){
 		if(degreeNum ==0){
 			return;
 		}
 		degreeNum -= 1;
 		$('.degreeTable').next().remove();
 	})
 	
 	$(".sub-experience").on("click",function(){
 		if(careerNum ==0){
 			return;
 		}
 		careerNum -= 1;
 		$('.experienceTable').next().remove();
 	})
 	
 	$(".modalBtn").on("click",function(){
 		$("#exampleModal").modal("show");
 		
 	})
 	
	$(".enroll").on("click",function(){
		Swal.fire({
			  title: '이력서 생성',
			  text: '이력서를 PDF 형식으로 만듭니다. ',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '등록'
			}).then((result)=>{
		  if(result.isConfirmed){
			  createInput();
			  $("#resumeForm2").submit();
		  }
		})
	})