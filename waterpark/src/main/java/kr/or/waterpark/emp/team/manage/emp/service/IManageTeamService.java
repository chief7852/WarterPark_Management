package kr.or.waterpark.emp.team.manage.emp.service;

import java.util.List;

import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.common.vo.LisenceVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.common.report.vo.ReportVO;

public interface IManageTeamService {

	List<EmpVO> retrieveEmpList();

	List<FilesVO> retrieveEmpFileList(String empId);

	List<ReportVO> retrieveEmpReportList(String empId);

	List<LisenceVO> retrieveEmpLisenceList(String empId);
	
}
