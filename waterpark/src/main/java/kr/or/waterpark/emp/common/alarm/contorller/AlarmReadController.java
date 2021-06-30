package kr.or.waterpark.emp.common.alarm.contorller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.waterpark.emp.common.alarm.service.IAlarmService;
import kr.or.waterpark.emp.common.alarm.vo.AlarmVO;

@Controller
@RequestMapping("/alarm")
public class AlarmReadController {
	
	Logger logger = LoggerFactory.getLogger(AlarmReadController.class);
	
	@Inject
	private IAlarmService alarmservice;
	
	@PostMapping
	@ResponseBody
	public List<AlarmVO> alarmReadList (
			@RequestParam("emp_id") String emp_id
			){
		logger.info(emp_id);
		return alarmservice.alarmList(emp_id);
	}
	
	@PutMapping
	@ResponseBody
	public Map<String,String> alarmAlter(
			@RequestBody Map<String, Object> putMap
			) {
		
		int result = alarmservice.alarmDelete(Integer.parseInt((String) putMap.get("alarm_no")));
		String message = "";
		if(result>0) {
			message = "OK";
		}else {
			message = "NO";
		}
		Map<String,String> resultmap = new HashMap<>();
		resultmap.put("message", message);
		return resultmap;
	}
	
	
}
