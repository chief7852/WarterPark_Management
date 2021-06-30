package kr.or.waterpark.testchat.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.json.Json;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.waterpark.emp.common.alarm.service.IAlarmService;
import kr.or.waterpark.emp.common.alarm.vo.AlarmVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;

/**
 * @author 작성자명
 * @since 2021. 6. 15.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 15.      정이삭       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 *      </pre>
 */
@Component
public class HandlerChat extends TextWebSocketHandler {

	@Inject
	private IAlarmService alarmService;

	Logger logger = LoggerFactory.getLogger(HandlerChat.class);
	// 세션리스트를 담을 List(나중에는 세션접속자의 정보까지 들고와야해서 Map으로 바꿔야함)
	private List<AlarmVO> sessionList = new ArrayList<AlarmVO>();





	// 클라이언트가 처음 접속했을때(init역할)
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		// 채팅방에 접속한 사용자 세션을 리스트에 저장
		AlarmVO alarmvo = new AlarmVO();
		alarmvo.setSession(session);
		sessionList.add(alarmvo);

	}

	// 클라이언트에서 메세지가 전달되면
	// 서버에서 모든 클라이언트에 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for (int i = 0; i < sessionList.size(); i++) {
			AlarmVO alarmList = sessionList.get(i);
			WebSocketSession s = alarmList.getSession();

			// init이 되었을때 그 session데이터가 없다면 alarmList에 저장
			if (session.equals(s) && alarmList.getEmpMap() == null) {
				sendCount(session, message, alarmList);
				return;
			}
		}

		categorySend(message.getPayload(), session);

		// 테스트용 ui찍는곳 이후 지워야함
//		sendInfo(session,message);

	}

	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		// 채팅방에서 퇴장한 사용자 세션을 리스트에서 제거
//		sessionList.remove(session);
		for (int i = 0; i < sessionList.size(); i++) {
			AlarmVO alarmList = sessionList.get(i);
			WebSocketSession s = alarmList.getSession();
			if (s == session) {
				sessionList.remove(i);
			}
		}

	}

//	모듈화 작업중=========================================================================================
	
	// JSON to Map
	private Map<String, Object> jsonParser(String message) throws JsonMappingException, JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> mapjson = mapper.readValue(message, Map.class);
		logger.info(mapjson.toString());
		return mapjson;
	}

	// 카테고리 나누기
	public void categorySend(String message, WebSocketSession session) throws IOException {
		Map<String, Object> mapjson = jsonParser(message);
		String from_name = null;
		for (AlarmVO alarmvo : sessionList) {
			if (session == alarmvo.getSession()) {
				from_name = (String) alarmvo.getEmpMap().get("emp_name");
			}
		}
		switch (mapjson.get("category").toString()) {
		case "email":
				emailAlarm(mapjson,from_name,"새로운 이메일이 도착했습니다");
			break;
		case "report":
//				"경영총무 팀"한테 보내면됨
			sendReport("새로운 보고서가 도착했습니다.",from_name);
			break;
		case "notice":
//				cont 내용을받아서 String 형태로 sendNotice(WebSocketSession session, String message,String from_name) 보내면된다
			sendNotice(session, "공지사항도착", from_name);
			break;

		default:
			break;
		}
	}
//	모듈화 끝======================================================================================================
	
//============================================알림 전송모음===================================================
/**
 * 
 * sendCount(session,message,alarmvo) 
 * :웹소켓 세션에 연결된 클라이언트의 회원정보를 가져와 저장하고 db에서 알림의 갯수를 검색하고 가장 처음으로 추가하는 함수
 * 
 * emailAlarm(map,from_name)
 * :이메일을 보낼 정보를 담은 Map과 송신자의 이름을 가져와 웹소켓 세션에 수신할 대상이 있으면 알림으로 보낸다
 * 
 * sendReport(string,from_name)
 * :보고서를 경영총무팀에 보낼수 있음
 * 
 * sendNotice(session,String,from_name)
 * :공지사항을 접속하고있는 모든 세션에 전송한다.
 * 
 */
	
	
	
	
	
	
	// 처음 접속했을때 해당 session의 id에 알람 db를 불러와서 찍어준다
	private void sendCount(WebSocketSession session, TextMessage message, AlarmVO alarmList) throws IOException {
		Map<String, Object> empMap = jsonParser(message.getPayload());
		// emp_id, emp_name, team_name, response_name,fc_name
		alarmList.setEmpMap(empMap);
		for (int i = 0; i < sessionList.size(); i++) {
			AlarmVO alarm = sessionList.get(i);
			if (alarm.getSession() == session) {
				sessionList.get(i).setEmpMap(empMap);
			}
		}
		String emp_id = (String) empMap.get("emp_id");
		// 알람 몇개인지 확인하고 해당 client에 보내기
		String alarmCount = Integer.toString(alarmService.alarmCount(emp_id));
		logger.info("남바링 :" + alarmCount);
		session.sendMessage(new TextMessage("{ \"alarm_count\" : \"" + alarmCount + "\"}"));
	}

	
	// 모든 세션에 공지사항 전달 
	private void sendNotice(WebSocketSession session, String message,String from_name) throws IOException {

		for (int i = 0; i < sessionList.size(); i++) {
			AlarmVO alarmList = sessionList.get(i);
			WebSocketSession s = alarmList.getSession();
			if(session != s) {				
				s.sendMessage(new TextMessage("{\"from_name\":\"" + from_name + "\","
						+ "\"message\":\""+message+"\"}"));
			}
		}
	}

	// 이메일 대상 마다 메세지 보내기
	private void emailAlarm(Map<String, Object> mapjson,String from_name,String message) throws IOException {
		for (AlarmVO alarmvo : sessionList) {
			for (String emp_id : (List<String>) mapjson.get("to_emp_ids")) {
				if (emp_id.equals(alarmvo.getEmpMap().get("emp_id"))) {
					alarmvo.getSession().sendMessage(new TextMessage("{\"from_name\":\"" + from_name + "\","
							+ "\"message\":\""+message+"\"}"));
				}
			}
		}
	}
	
	// 세션중 team_name이 경영총무 팀 인 사람들한테 sendMessage를 보내면된다 
	private void sendReport(String message,String from_name) throws IOException {

		for (int i = 0; i < sessionList.size(); i++) {
			AlarmVO alarmList = sessionList.get(i);
			WebSocketSession s = alarmList.getSession();
			if("경영총무 팀".equals(alarmList.getEmpMap().get("team_name"))) {				
				s.sendMessage(new TextMessage("{\"from_name\":\"" + from_name + "\","
						+ "\"message\":\""+message+"\"}"));
			}
		}
	}
}