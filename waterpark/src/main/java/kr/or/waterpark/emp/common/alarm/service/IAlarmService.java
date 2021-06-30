package kr.or.waterpark.emp.common.alarm.service;

import java.util.List;

import kr.or.waterpark.emp.common.alarm.vo.AlarmVO;

public interface IAlarmService {
	
	public List<AlarmVO> alarmList(String emp_id);
	
	public int alarmCount(String emp_id);
	
	public int alarmCreate(AlarmVO sendAlarm);
	
	public int alarmDelete(int alarm_no);
}
