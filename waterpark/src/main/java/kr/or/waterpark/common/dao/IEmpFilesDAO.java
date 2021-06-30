package kr.or.waterpark.common.dao;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.common.resume.vo.ResumeVO;

@Repository
public interface IEmpFilesDAO {

	public int insertEmpFiles(EmpVO emp);
	
	public int insertEmpFilesForResume(ResumeVO resume);
	
}
