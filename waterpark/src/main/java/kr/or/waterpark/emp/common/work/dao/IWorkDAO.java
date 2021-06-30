package kr.or.waterpark.emp.common.work.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.emp.common.work.vo.WorkVO;

@Repository
public interface IWorkDAO {
	
	public List<WorkVO> selectAllWork(String emp_id);
	
	public int insertWork(WorkVO work);
	
	public int deleteWork(int work_id);
}
