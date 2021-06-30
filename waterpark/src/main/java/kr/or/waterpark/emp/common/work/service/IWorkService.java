package kr.or.waterpark.emp.common.work.service;

import java.util.List;

import kr.or.waterpark.emp.common.work.vo.WorkVO;


public interface IWorkService {
	
	public List<WorkVO> selectAllWork(String emp_id);
	
	public int insertWork(WorkVO work);
	
	public int deleteWork(int work_id);
}
