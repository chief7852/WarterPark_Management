
$("#picture-form").hide();
let searchURL = "/waterpark/emp/search";
let findURL = "/waterpark/emp/findEmp";
let btnURL = "/waterpark/emp/clickBtn";
let enrollURL = "/waterpark/emp/manageteam";
let resumeURL = "/waterpark/emp/resume"

let isWorking;
let textSearch;

let title;
let text;
let icon;

let emp_id; 
let emp_name; 
let response_id;
let emp_mail;
let team_code;
let emp_hire;
let fc_id;
let emp_hp;
let emp_pass; 
let response_code;
let team_name;
let response_name;
let fire_date;
let file_no;

let img_file;

let lock = false;

let getAllEmpInfo = function(){
	emp_id = $(".emp_id").val();   
	emp_name = $(".emp_name").val();   
	response_code = $(".response_code").val(); 
	emp_mail = $(".emp_mail").val();
	team_code = $(".team_code").val();
	emp_hire = $(".emp_hire").val();    
	fc_id = $(".fc_id").val();    
	emp_hp = $(".emp_hp").val();
	console.log("getAllEmpInfo 에서 emp_hp : " + emp_hp);
	emp_pass =$(".emp_pass").val();   
	team_name = $(".team_name").val();
	response_name = $(".response_name").val();
	img_file = $("#picture-form").val();
}

let getInfoFunc = function(){
	team_code = $("#teamBox").find("option:selected").val();
	response_code = $("#responseBox").find("option:selected").val();
	fc_id= $("#selectFC").find("option:selected").val();
	console.log(fc_id);
	isWorking = $("#isWorking").find("option:selected").val();
	textSearch = $(".searchForm").val();
}

let putInfoToHidden = function(){
	response_code = $("#selectTeam").find("option:selected").val();
	team_code = $("#selectPosition").find("option:selected").val();
	fc_id= $("#selectFC").find("option:selected").val();
	response_name = $("#selectTeam").find("option:selected").html();
	team_name = $("#selectPosition").find("option:selected").html();
	$('input[name=team_code]').attr('value',team_code);
	$('input[name=response_code]').attr('value',response_code);
	$('input[name=fc_id]').attr('value',fc_id);
	$('input[name=response_name]').attr('value',response_name);
}

$(document).on("click","#teamBox",function(){
	getInfoFunc();
	ajaxTransmit(team_code, response_code, isWorking, textSearch);
});

$(document).on("click","#responseBox",function(){
	getInfoFunc();
	ajaxTransmit(team_code, response_code, isWorking, textSearch);
});

$(document).on("click","#isWorking",function(){
	getInfoFunc();
	ajaxTransmit(team_code, response_code, isWorking, textSearch);
});

$(document).on("keyup",".searchForm",function(){
	getInfoFunc();
	ajaxTransmit(team_code, response_code, isWorking, textSearch);
});


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

$(document).on("change","#picture-form",function(e){
	console.log(this);
	readURL(this);
});

function readURL(input){
	if(input.files && input.files[0]){
		let reader = new FileReader();
		reader.onload = function(e){
			$('#img').attr("src",e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

$(document).on("click",".report-item",function(){
	let type = $(this).find(".type").html();
	let report_no = $(this).data("num");
	if(type == "공지사항"){
		Swal.fire({
			title: '공지사항으로 이동하시겠습니까?',
		    text: '공지사항 화면으로 이동합니다',
			icon: 'info',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
		}).then((result) =>{
			if (result.isConfirmed){
				location.href="/waterpark/emp/notice/noticeDetail?report_no="+report_no;
			}
		})
	}
});

function ajaxTransmit( team_code, response_code, isWorking, textSearch) {
	$.ajax({
		url : searchURL,
		method : 'get',
		data : {
			'teamCode' : team_code,
			'responseCode' : response_code,
			'isWorking' : isWorking,
			'textSearch' : textSearch
		},
		success : function(resp){
			$(".empBarBody").empty();
			$(resp.empList).each(function(idx,emp){
				let body ='<div class="hr"></div>' 
					+'<div class="barItems" data-id="'+ emp.emp_id+'">'
					+'<div class="barItem" ><strong>' + emp.emp_name  + '</strong></div>'
					+'<div class="barItem"><strong>' + emp.team_name +'</strong></div>'
					+'<div class="barItem"><strong>' + emp.response_name + '</strong></div>'
					+'</div>';  
				$("#empBarBody").append(body);
			})
			$("#empBarBody").append('<div class="hr"></div>');
		},error : function(){
			console.log("오류");
		}
	}); 
};


$(document).on("click",".button",function(){
	let btnInfo = $(this).attr("data-info");
	console.log()
	let empId = $(".emp_id").val();
	if(btnInfo == "check"){// 확인 버튼 클릭 시
		Swal.fire({
			  title: '직원 정보를 등록하겠습니까?',
			  text: "누락된 정보가 있는지 확인해주세요!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '등록하기'
		}).then((result) =>{
			if (result.isConfirmed) {
				putInfoToHidden();
				let emp = $("#inputForm").serialize();
				let type = "post";
				
				sendDataWithAjax(enrollURL,type,emp);
			}
		})
		return;
	}else if(btnInfo == "cancel"){ // 취소 버튼 클릭 시
		Swal.fire({
			  title: '정말 취소하시겠습니까?',
			  text:'기존에 작업중이던 정보가 사라질 수 있습니다.',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '취소하기'
		}).then((result)=>{
			if(result.isConfirmed){
				intercept('취소','작업이 취소되었습니다','success');
			 	lock = false;
			 	$("#picture-form").hide();
				$(".empInfo").empty();
				$(".picture").empty();
				$(".empInfo").append(commonTag);
				$('.buttons').empty();
				$('.lisence-item').empty();
				$('.report-item').empty();
				$(".buttons").append(originBtns);
			}
		})
	}else if (btnInfo == "fire"){ // 퇴사 버튼 클릭시 
		let id = $(".emp_id").val();
		if(id == null || id == "" ){
			intercept('실패!',"퇴사처리할 직원을 선택해 주세요!", "info",false);
			return;
	    };
		
		(async () => {
			const { value: formValues } = await Swal.fire({
			  title: '퇴사일 입력',
			  html:
			    '<input id="choose" type="date" class="choose">',
			  focusConfirm: false,
			  preConfirm: () => {
			    return [
			    	fire_date = document.getElementById('choose').value,
			    ]
			  }
			})

			if (formValues) {
				Swal.fire({
				  title: '퇴사처리할까요?',
				  text: '퇴사자는 직원과 똑같이 조회가 가능합니다.',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '퇴사처리'
				}).then((result)=>{
				  if(result.isConfirmed){
					  putInfoToHidden();
					  getAllEmpInfo();
					  let type = 'delete'
					  sendDataWithAjax(enrollURL,type,emp_id);
				  }
				})
			}

			})()
			
	}else if(btnInfo == 'lisence'){
		console.log("lisence click!");
		
	}else if(btnInfo == 'experience'){
		console.log("experience click!");
		
	}else if(btnInfo == 'resume'){
		console.log("resume clicked!");
		getAllEmpInfo();
		
		if(emp_id == "" || emp_id == undefined){
			intercept("직원 선택 필요","직원을 선택해 주세요",'info',false);
			return;
		}
		
		$.ajax({
			url : resumeURL,
			data : {
				'empId' : empId
			},
			success : function(resp){
				console.log(resp);
				if(resp.result == "NOTEXIST"){
					Swal.fire({
					  title: '이력서가 존재하지 않습니다.',
					  text: "새로운 이력서를 등록하실건가요?",
					  icon: 'info',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '네!'
					}).then((result) => {
						if(result.isConfirmed){
							window.open("/waterpark/emp/write","new", "width=1060,height=700");  
						}
					});
	
				}else if(resp.result =="OK"){
					Swal.fire({
						  title: '이력서를 보시겠습니까?.',
						  text: "기존에 등록되있는 이력서를 엽니다.",
						  icon: 'info',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '네!'
						}).then((result) => {
						if(result.isConfirmed){
							const URLPATTERN = "/waterpark/download?what=%W&order=%O";
							let pdfURL = URLPATTERN.replace("%W",resp.resume.file_no).replace("%O",resp.resume.file_ord);
							let pdfTag = $("<a>").attr({"href":pdfURL,"id":"empPdf","target":"_blank"}).html("클릭!").css("visibility","hidden");
							$(".pdfPosition").append(pdfTag);
							let empPdf = $(".pdfPosition").find("#empPdf");
						    $(empPdf).get(0).click();
						}else{
							window.open("/waterpark/emp/write","new", "width=1060,height=700");  
						}
					})
				}
			}, error : function(){
				console.log("testing - error");
			}
		})
		
	}else if(btnInfo == 'testBtn'){
		$(".emp_name").val("문용준");   
		$(".response_code").val(""); 
		$(".emp_mail").val("moonDragon@naver.com");
		$(".team_code").val();
		$(".emp_hire").val("2021-05-05");    
		$(".fc_id").val("FC2105190016");    
		$(".emp_hp").val("01078945555");
		$(".emp_pass").val("java");   
		$(".team_name").val("EE");
		$(".response_name").val("MN");
	}
	
	$.ajax({
		url : btnURL,
		data:{
			'btnInfo' : btnInfo,
			'empId' : empId
		},success : function(resp){
			if(resp.result == "create"){
				createBtn(resp.facilityList);
			}else if(resp.result == "update"){
				updateBtn(resp.facilityList);
			}
		},error : function(){
			
		}
	})
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
	    	$("#emp_id").val(emp_id);
	    	$("#fileEnrollForm").submit();  
	    } 
	});
})

let createBtn = function(facilityList){
	Swal.fire({
	  title: '새로운 직원을 등록하겠습니까?',
	  text: "새로운 직원을 등록합니다!",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: '네! 등록하겟습니다.'
	}).then((result) => {
		   if (result.isConfirmed) {
			$(".empInfo").empty();
			$(".empInfo").append(createTag);
			
			lock = true;
		    Swal.fire(
		      '등록을 시작합니다.',
		      '누락되는 정보가 없도록 확인해주세요',
		      'success'
		    );
		    createForm(facilityList);
		    $(".picture").empty();
		    let pictureTag = $("<input>").attr("id","picture-form").attr("name","emp_files").attr("type","file");
		    $(".picture").append("<img id='img' />");
			$(".picture").append(pictureTag);
		  }
	});
}

let updateBtn = function(facilityList){
	Swal.fire({
		  title: '직원 정보를 수정하겠습니까?',
		  text: "직원 정보를 수정합니다!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '수정하기'
	}).then((result) =>{
		let id = $(".emp_id").val();
		if(id == null || id == "" ){
			intercept('수정하기 실패!',"수정할 정보를 선택해 주세요!", "warning",false);
			return;
	    };
		if (result.isConfirmed) {
			  Swal.fire(
			  '수정 시작',
			  "직원 정보 수정을 시작합니다.",
			  "success"
	       	  );
			//생성 전에 데이터를 전부 밭아온다. 
			getAllEmpInfo();
			
			//폼을 생성한다. 
	        createForm(facilityList);
			
			//생성된 폼 안에 데이터를 넣는다. 
			$(".emp_id").val(emp_id);
			$(".emp_name").val(emp_name);
			$(".emp_mail").val(emp_mail);
			$(".emp_hp").val(emp_hp);
			$(".emp_hire").val(emp_hire);
			$(".emp_fire").removeClass("onlyread").attr("readonly", false).attr("type",'date');
			let imgTag = $("#img").html();
			if(imgTag == undefined){
				 $(".picture").append("<img id='img' />");
			}
			let pictureTag = $("<input>").attr("id","picture-form").attr("name","emp_files").attr("type","file");
			$(".picture").append(pictureTag);
			/*$(".picture").append("<img id='img' />");*/
			$("#selectTeam").val(response_code).prop("selected",true);
			$("#selectPosition").val(team_code).prop("selected",true);
			$("#selectFC").val(fc_id).prop("selected",true);
			$("#inputForm").append("<input type='hidden' name='_method' value='put'></input>")
			//method 형식을 put 으로 속여서 데이터를 넘기도록 input tag 추가한다. 
			
		}
	});
};

let sendDataWithAjax = function(URL,type,data){
	if(type == 'delete'){
		  $.ajax({
		        url : URL,
		        method : 'post',
		        dataType : 'json',
		        data : {
		        	'_method' : 'delete',
		        	"emp_id" : data,
		        	"emp_fire" : fire_date
		        },
		        success : function(resp){
		        	if(resp.result=="OK"){
		        		Swal.fire({
		  				  title: '작업 성공',
		  				  text: '작업이 완료되었습니다',
		  				  icon: 'warning',
		  				  showCancelButton: false,
		  				  confirmButtonColor: '#3085d6',
		  				  cancelButtonColor: '#d33',
		  				})
		  				lock = false;
		        		location.reload();
		        		console.log("왜 안돼지");
		        	}else if(resp.result == "FAIL"){
		        		intercept("실패!","등록에 실패했습니다.!",'warning',false);
		        	}else if(resp.result == "NOTEXIST"){
		        		intercept("실패!","입력 정보가 누락됐습니다.!",'warning',false);
		        	}
		        },error:function(){
		        	console.log("실패!");
		        }
		    }) 
	}else{
		var formData = $("#inputForm")[0];
		var form_data = new FormData(formData);
		$.ajax({
	        url : URL,
	        type : 'POST',
	        dataType:'json',
	        contentType: false,
	        processData: false,
	        data : form_data,
	        success : function(resp){
	        	if(resp.result=="OK"){	
	        		Swal.fire({
	  				  title: '작업 성공',
	  				  text: '작업이 완료되었습니다',
	  				  icon: 'warning',
	  				  showCancelButton: false,
	  				  confirmButtonColor: '#3085d6',
	  				  cancelButtonColor: '#d33',
	  			}).then((result)=>{
	  				if(result.isConfirmed){
	  					location.reload();
					  }
	  			})
	  			lock = false;
	        	}else if(resp.result == "FAIL"){
	        		intercept("실패!","등록에 실패했습니다.!",'warning',false);
	        	}else if(resp.result == "NOTEXIST"){
	        		intercept("실패!","입력 정보가 누락됐습니다.!",'warning',false);
	        	}
	        },error:function(){
	        	console.log("실패!");
	        }
	    }) 
    }
}

let createTag = 
	'<div class="empInfo1">                                                                 ' +
    '	<input type="hidden" class="team_code" name="team_code"/>                            ' +
    '	<input type="hidden" class="response_code" name="response_code"/>                    ' +
    '	<input type="hidden" class="response_name" name="response_name"/>                    ' +
    '	<input type="hidden" class="fc_id" name="fc_id"/>                                    ' +
    '	<input type="hidden" class="file_no" name="file_no"/>                                ' +
	'<div class="item-wrapper">                                                               '+
	'		<label class="info-item1">직원 아이디</label>                                         ' +
	'		<input class="emp_id onlyread form-control checking2" name="emp_id" type="text" />' +
	'</div>'+
	'<div class="item-wrapper">'+
	'		<label class="info-item1"> 이름</label>                                             ' +
	'		<input class="emp_name form-control checking2" name="emp_name" type="text" />                     ' +
	'</div>'+
	'<div class="item-wrapper">'+
	'		<label class="info-item1 beforeResponse"> 직책</label>                              ' +
	'		<input class="response_name form-control checking2" name="response_name" type="text" />           ' +
	'</div>'+
	'<div class="item-wrapper">'+
	'		<label class="info-item1">이메일</label>                                            ' +
	'		<input class="emp_mail form-control checking2" name="emp_mail" type="text" />                     ' +
	'</div>'+
	'<div class="item-wrapper">'+
	'       <label class="info-item1">비밀번호</label>                                            ' +
	'		<input class="emp_pass form-control checking2" name="emp_pass" type="password" />                     ' +
	'</div>'+
	'	</div>                                                                                 ' +
	'	<div class="empInfo2">                                                                 ' +
	'<div class="item-wrapper">'+
	'		<label class="info-item1 beforeTeam">팀명</label>                                   ' +
	'		<input class="team_name form-control checking2" name="team_name" type="text" />                   ' +
	'</div>'+
	'<div class="item-wrapper">'+
	'		<label class="info-item1"> 입사일</label>                                           ' +
	'		<input class="emp_hire form-control checking2" name="emp_hire" type="date" />        '+
	'</div>'+
	'<div class="item-wrapper">'+
	'		<label class="info-item1"> 퇴사일</label>                                           ' +
	'		<input class="emp_fire form-control checking2" name="emp_fire" type="date" />                                     ' +
	'</div>'+
	'<div class="item-wrapper">'+
	'		<label class="info-item1 beforeFC"> 담당 구역</label>                               ' +
	'		<input class="fc_name form-control checking2" name="fc_name" type="text" />                                      ' +
	'</div>'+
	'<div class="item-wrapper">'+
	'		<label class="info-item1 beforeHP"> 휴대폰 번호</label>                             ' +
	'		<input class="emp_hp form-control checking2" name="emp_hp" type="text" />                                       ' +
	'</div>'+
	'	</div>                                                                                 ' ;
		
	let commonTag = 
	/* 	'<div class="picture">                                                                  ' +
		'	<img id="img"/>                                                                        ' +
		'</div>	                                                                                   ' + 
		'<div class="empInfo">                                                                     ' +*/
		'	<div class="empInfo1">                                                                 ' +
		'		<input type="hidden" class="team_code" name="team_code"/>                          ' +
		'			<input type="hidden" class="response_code" name="response_code"/>              ' +
		'			<input type="hidden" class="response_name" name="response_name"/>              ' +
		'			<input type="hidden" class="fc_id" name="fc_id"/>                              ' +
		'			<input type="hidden" class="file_no" name="file_no"/>                          ' +
		'<div class="item-wrapper">'+
		'		<label class="info-item">직원 아이디</label>                                       ' +
		'		<input class="emp_id onlyread form-control checking" name="emp_id" type="text" readonly/>                ' +
		'</div>'+
		'<div class="item-wrapper">'+
		'		<label class="info-item"> 이름</label>                                             ' +
		'		<input class="emp_name form-control checking" name="emp_name" type="text" readonly/>                     ' +
		'</div>'+
		'<div class="item-wrapper">'+
		'		<label class="info-item beforeResponse"> 직책</label>                              ' +
		'		<input class="response_name form-control checking" name="response_name" type="text" readonly/>           ' +
		'</div>'+
		'<div class="item-wrapper">'+
		'		<label class="info-item">이메일</label>                                            ' +
		'		<input class="emp_mail form-control checking" name="emp_mail" type="text" readonly/>                     ' +
		'</div>'+
		'	</div>      '+
		'	<div class="empInfo2">    '+
		'<div class="item-wrapper">'+
		'		<label class="info-item beforeTeam">팀명</label>                                    '+
				'<input class="team_name form-control checking" name="team_name" type="text" readonly/>   '+
		'</div>'+
		'<div class="item-wrapper">'+
				'<label class="info-item"> 입사일</label>                           '+
				'<input class="emp_hire form-control checking" type="text" name="emp_hire" readonly/>     '+
		'</div>'+
		'<div class="item-wrapper">'+
				'<label class="info-item"> 퇴사일</label>                           '+
				'<input class="emp_fire form-control checking" type="text" name="emp_fire" readonly/>     '+
		'</div>'+
		'<div class="item-wrapper">'+
				'<label class="info-item beforeFC"> 담당 구역</label>               '+
				'<input class="fc_name form-control checking" type="text" name="fc_name" readonly/>       '+
		'</div>'+
		'<div class="item-wrapper">'+
				'<label class="info-item beforeHP"> 휴대폰 번호</label>             '+
				'<input class="emp_hp form-control checking" name="emp_hp" type="text" readonly/>         '+
		'</div>                                                                                    '+
		'</div>';
		
	let originBtns =
		 "<table>                                                                                   "
		+"<tr>                                                                                      "
		+"	<th><button class='button btn btn-info' data-info='create'>등록</button>     </th>     " 
		+"	<th><button class='button btn btn-info' data-info='update'>수정</button>   </th>       " 
		+"</tr>                                                                                    "
		+"<tr>                                                                                     "
		+"	<th><button class='button btn btn-info' data-info='fire'>퇴사</button>            </th>"    
		+"	<th><button class='button btn btn-info' data-info='resume'>이력서</button>        </th>"    
		+"</tr>                                                                                    ";
