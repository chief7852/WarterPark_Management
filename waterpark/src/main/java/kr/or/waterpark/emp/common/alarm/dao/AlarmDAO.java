package kr.or.waterpark.emp.common.alarm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.emp.common.alarm.vo.AlarmVO;

@Repository
public interface AlarmDAO {
	
	public List<AlarmVO> alarmList(String emp_id);
	
	public int alarmCount(String emp_id);
	
	public int alarmCreate(AlarmVO sendAlarm);
	
	public int alarmDelete(int alarm_no);
	
}
