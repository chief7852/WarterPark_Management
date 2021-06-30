package kr.or.waterpark.emp.common.alarm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.waterpark.emp.common.alarm.dao.AlarmDAO;
import kr.or.waterpark.emp.common.alarm.vo.AlarmVO;

@Service
public class AlarmServiceImpl implements IAlarmService{

	@Inject
	private AlarmDAO alarmdao;
	
	@Override
	public List<AlarmVO> alarmList(String emp_id) {
		// TODO Auto-generated method stub
		return alarmdao.alarmList(emp_id);
	}
	
	@Override
	public int alarmCount(String emp_id) {
		// TODO Auto-generated method stub
		return alarmdao.alarmCount(emp_id);
	}
	
	@Override
	public int alarmCreate(AlarmVO sendAlarm) {
		return alarmdao.alarmCreate(sendAlarm);
	}

	@Override
	public int alarmDelete(int alarm_no) {
		// TODO Auto-generated method stub
		return alarmdao.alarmDelete(alarm_no);
	}



}
