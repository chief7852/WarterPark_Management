package kr.or.waterpark.common.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import kr.or.waterpark.customer.common.reserve.vo.TicketListForResVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketsForResVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class PhoneAuthUtils {
	private static String api_key = "NCSWHK39DFVDGZW1";
	private static String api_secret = "MYP60NMO8OIGS94JOIJZCKE739CS97KP";
	private static Message coolsms = new Message(api_key, api_secret);
	
	
	public static Map<String, Object> getPhoneAuthNum(String phoneNumber) throws CoolsmsException {
		HashMap<String, String> set = new HashMap<String, String>();
		int authNumberInt = (int) (Math.floor(Math.random() * 100000) + 100000);
		String authString = Integer.toString(authNumberInt);
		set.put("to", phoneNumber); // 받는 사람
		set.put("from", "01024504831"); // 발신번호
		set.put("text", "안녕하세요.대덕 워터파크를 이용해주셔서 감사합니다." + " 인증번호는 [" + authString + "]입니다"); // 문자내용
		set.put("type", "sms"); // 문자 타입
		JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		String res = result.toJSONString();
		Map<String, Object> map = new LinkedHashMap<>(); 
		map.put("authNumber", authString);
		map.put("result",res);
		return map;
	}
	
	public static Map<String, Object> successReserve(String phoneNumber, TicketListForResVO ticketList) throws CoolsmsException{
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", phoneNumber);
		set.put("from", "01024504831");
		
		StringBuffer text = new StringBuffer();
		text.append(ticketList.getUser_name() + "님 예매가 완료되었습니다\n\n");
		for(TicketsForResVO ticket : ticketList.getTicketListForRes()) {
		}
		
		
		
		
		set.put("text", ")");

		return null;
	}
}
