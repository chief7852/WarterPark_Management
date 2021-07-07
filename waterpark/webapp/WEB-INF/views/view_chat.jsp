<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>웹소켓 채팅</title>
<jsp:include page="/customer-includee/preScript.jsp" />
<link href="https://nightly.datatables.net/css/jquery.dataTables.css"
	rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon"
	href="${WCP}/resources/assets/images/logos/squanchy.jpg">
<link rel="apple-touch-icon" sizes="180x180"
	href="${WCP}/resources/assets/images/logos/squanchy.jpg">
<link rel="icon" type="image/png" sizes="32x32"
	href="${WCP}/resources/assets/images/logos/squanchy.jpg">
<!-- jQuery -->
<!-- Bootstrap4 files-->
<script type="text/javascript" src="${WCP}/resources/js/jsQR.js"></script>
<link href="${WCP}/resources/assets/css/ui.css" rel="stylesheet"
	type="text/css" />
<link
	href="${WCP}/resources/assets/fonts/fontawesome/css/fontawesome-all.min.css"
	type="text/css" rel="stylesheet">
<link href="${WCP}/resources/assets/css/OverlayScrollbars.css"
	type="text/css" rel="stylesheet" />
<!-- Font awesome 5 -->
<link href="${WCP}/resources/emp-css/snack-css.css" type="text/css"
	rel="stylesheet" />
<!-- header -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gugi&family=Jua&display=swap" rel="stylesheet">
<style type="text/css">
.navbar-badge{
    font-size: .6rem;
    font-weight: 300;
    padding: 2px 4px;
    position: absolute;
    right: 5px;
    top: 9px;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">
var today = 	function (){
        let tml ='<a href="#" class="dropdown-item">'
        tml += '<i class="fas fa-envelope mr-2"></i> 4 new messages'
        tml += ' <span class="float-right text-muted text-sm">3 mins</span></a>'
        $(".dropdown-menu-right").append(tml)
       
	}
var webSocket = {
	init: function(param) {
		this._url = param.url;
		this._initSocket();
	},
	sendChat: function() {
		this._sendMessage($('#message').val());
		$('#message').val('');
	},
	// 메세지 데이터가 들어오면 그 메세지를 보여줌
	receiveMessage: function(str) {
		
		today()
		$('#divChatData').append('<div>' + str + '</div>');				
	},
	// 소켓에연결되지않음
	closeMessage: function(str) {
		$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
	},
	//소켓연결종료
	disconnect: function() {
		this._socket.close();
	},
	// 소켓연결
	_initSocket: function() {
		this._socket = new SockJS(this._url);
		setTimeout(function(){
			var datas = {
				"emp_id" : '${EmpVO.emp_id}',
				"emp_name" : '${EmpVO.emp_name}',
				"team_name" : '${EmpVO.team_name}',
				"response_name" : '${EmpVO.response_name}',
				"fc_name" : '${EmpVO.fc_name}'
			}
			
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
		this._socket.send(str);
	}
	

};
</script>	
<script type="text/javascript">
	$(document).ready(function() {
		/* 서버의 url주로를 가져와서 init메소드에 넣어주면서 접속한다 */
		webSocket.init({ url: '<c:url value="/chat" />' });
	});
</script>
</head>
<body>
<%-- <c:forEach items="${EmpVO}" var="entry" varStatus="status"> --%>
<%--     ${entry.key} || ${entry.value}<br/> --%>
<%-- </c:forEach> --%>


<jsp:include page="snackHead.jsp" flush="true"></jsp:include>
	<div style="width: 800px; height: 700px; padding: 10px; border: solid 1px #e1e3e9;">
		<div id="divChatData"></div>
	</div>
	<div style="width: 100%; height: 10%; padding: 10px;">
		<input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
		<input type="button" id="btnSend" value="채팅 전송" onclick="webSocket.sendChat()" />
	</div>
	
	
	<div id="bell_data">
		<p class="email_count">0</p>
		<p class="newBoard_count">0</p>
		<p class="sos_count">0</p>
		<p class="report_count">0</p>
	</div>
	<div>
		<button type="button" id="email">이메일</button>
		<button type="button" id="newBoard">공지사항</button>
		<button type="button" id="sos">긴급</button>
		<button type="button" id="report">보고서</button>
		<input id="textform" type="text">
		<button type="button" id="nickname">임시닉네임</button>
	</div>
	
	
	
<script type="text/javascript">
$(document).on("click","#email",function(){
	webSocket._sendMessage("email")
})
$(document).on("click","#newBoard",function(){
	webSocket._sendMessage("newBoard")
})
$(document).on("click","#sos",function(){
	webSocket._sendMessage("sos")
})
$(document).on("click","#report",function(){
	webSocket._sendMessage("report")
})
$(document).on("click","#nickname",function(){
	let texts = $("#textform").val();
	webSocket._sendMessage(texts)
})

$(document).on("click",".fa-bell",function(){
	$(".dropdown-menu-right").toggle()
})
</script>
</body>
</html>