package kr.or.waterpark.emp.team.manage.emp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.common.vo.LisenceVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.common.report.vo.ReportVO;

@Repository
public interface IManageTeamDAO {

	List<EmpVO> selectEmpList();

	List<FilesVO> selecetAllEmpFiles(String empId);

	List<ReportVO> selectAllEmpReports(String empId);

	List<LisenceVO> selectAllEmpLisences(String empId);
	
}
