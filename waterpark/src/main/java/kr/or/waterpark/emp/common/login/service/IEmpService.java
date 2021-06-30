package kr.or.waterpark.emp.common.login.service;

import java.util.List;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;

public interface IEmpService {

	public List<EmpVO> retrieveEmpList(String receiver);
	
	public EmpVO findEmp(String emp_id);

	public ServiceResult insertEMP(EmpVO emp);

	public ServiceResult updateEMP(EmpVO emp);

	public ServiceResult fireEMP(EmpVO emp);

	public FilesVO getResume(String emp_id);
	
	public EmpVO findEmpDetails(String emp_id);
	
}

