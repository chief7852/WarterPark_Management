package kr.or.waterpark.emp.common.alarm.vo;

import java.util.List;
import java.util.Map;

import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@ToString
@Getter
@Setter
public class AlarmVO {
	
	 private int alarm_no;
	
	 private String emp_id;
	
	 private String alarm_cont;
	
	 private String alarm_date;
	 
	 private String alarm_check_date;
	 
	 private Map<String, Object> empMap;
	 
	 private WebSocketSession session;
	 
	 private String alarm_val;
	 
	 private String from_emp_name;
	
	 private String to_emp_name;
	 
	 private List<String> email_emps;
}
