package kr.or.waterpark.emp.common.work.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.waterpark.emp.common.work.dao.IWorkDAO;
import kr.or.waterpark.emp.common.work.vo.WorkVO;

@Service
public class WorkServiceImpl implements IWorkService{
	Logger logger = LoggerFactory.getLogger(WorkServiceImpl.class);
	
	@Inject
	private IWorkDAO workdao;
	
	@Override
	public List<WorkVO> selectAllWork(String emp_id) {
		logger.info(emp_id);
		List<WorkVO> workList = workdao.selectAllWork(emp_id);
		logger.info("list size : {}", workList.size());
//		logger.info(workdao.selectAllWork(emp_id).toString());
		return workList; 
	}

	@Override
	public int insertWork(WorkVO work) {
		
		return workdao.insertWork(work);
	}

	@Override
	public int deleteWork(int work_id) {
		// TODO Auto-generated method stub
		return workdao.deleteWork(work_id);
	}
	
}
