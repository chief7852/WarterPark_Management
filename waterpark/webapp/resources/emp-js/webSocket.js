/**
 * <pre>
 * 
 * </pre>
 * @author 작성자명
 * @since 2021. 6. 17.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 17.      작성자명       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */ 
function toastMessage(message){

   toastr.options = {
            closeButton: true,
            progressBar: true,
            showMethod: 'slideDown',
            timeOut: 4000
        };
        toastr.success(message, '새로운 알림!');
}
var blink = function(){
	$(".icon-bell-l").addClass("blink");
}
$(".dropdown").off("click").on("click",function(){
	reClass();
})
var reClass = function remove(){
	$(".icon-bell-l").removeClass("blink")
}
function websocketStart(datas,url){
	
 webSocket =  {
	init: function(param) {
		this._url = param.url;
		this._initSocket();
	},
	sendChat: function(str) {
		console.log(str)
		
		this._sendMessage(JSON.stringify(str));
	},
	// 메세지 데이터가 들어오면 그 메세지를 보여줌
	receiveMessage: function(str) {
		console.log(typeof(str))
		const data = JSON.parse(str)
		//카운트
		console.log(data)
		if(data.alarm_count!=null){
			console.log("들어옴?")
			$(".bg-important").text(data.alarm_count)		
		}
		//이메일 받았을때
		if(data.from_name!=null){
			console.log(data);
			$(".bg-important").text(parseInt($(".bg-important").text())+1);
			console.log($(".dropdown").children(".bg-important").text());
			blink();
			
			toastMessage(data.message);
		}
	},
	// 소켓에연결되지않음
	closeMessage: function(str) {
		
	},
	//소켓연결종료
	disconnect: function() {
		this._socket.close();
	},
	// 소켓연결
	_initSocket: function() {
		this._socket = new SockJS(this._url);
		setTimeout(function(){

			webSocket._sendMessage(JSON.stringify(datas))
		},1000);
		this._socket.onmessage = function(evt) {
			webSocket.receiveMessage(evt.data);
		};
		// 종료이벤트
		this._socket.onclose = function(evt) {
			//(나갔다는 메세지를 출력)
			webSocket.closeMessage(evt.data);
		}
	},
	// 메세지가입력되면 HandlerChat.java로 문자를 모냄
	_sendMessage: function(str) {
		console.log(str)
		this._socket.send(str);
	}
	
};
	webSocket.init({ url: url });
}
//시간 몇일전..몇시간전 으로 변경
function timeForToday(value) {
    const today = new Date();
    const timeValue = new Date(value);

    const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
    if (betweenTime < 1) return '방금전';
    if (betweenTime < 60) {
        return `${betweenTime}분전`;
    }

    const betweenTimeHour = Math.floor(betweenTime / 60);
    if (betweenTimeHour < 24) {
        return `${betweenTimeHour}시간전`;
    }

    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
    if (betweenTimeDay < 365) {
        return `${betweenTimeDay}일전`;
    }

    return `${Math.floor(betweenTimeDay / 365)}년전`;
}
//알람 찍어내기
var alarmList = 	function (data,date){
    let tml ='<a href="'+WCP+'/emp/email" id="'+data.alarm_no+'" class="dropdown-item '+data.alarm_cont+'">'
    tml += '<i class="fas fa-envelope mr-2 "></i> 새 '+data.alarm_cont+'가 도착하였습니다.'
    tml += ' <span class="float-right text-muted text-sm">'+date+'</span></a>'
    tml += ' <div class="dropdown-divider"></div>'
    $(".dropdown-body").append(tml);
}

//알람 db로 가져오기
function dbAlarm(url,emp_id){
	$.ajax({
		url : url+"/alarm",
		type : "post",
		data : {
			"emp_id" : emp_id
		},
		dataType : "json",
		success : function(data) {
			console.log(data);
			$(".dropdown-body").empty();
			for(let map of data){
				let dater = Date.parse(map.alarm_date);
				dater = new Date(dater);
				let testing = timeForToday(dater);
				
				alarmList(map,testing);
			}
		},
		error : function(xhr, status) {
			console.log(xhr);
			console.log(status);
		}

	});
}



function emailListLocation(move,url,alarm_no){
	
	$.ajax({
		url : url+"/alarm",
		type : "put",
		data : JSON.stringify({
			"alarm_no" : alarm_no
		}),
		dataType : "json",
		contentType: 'application/json; charset=utf-8',
		success : function(data) {
			console.log(data)
			location.href = move;
		},
		error : function(xhr, status) {
			console.log(xhr)
			console.log(status)
		}

	});
	
}

