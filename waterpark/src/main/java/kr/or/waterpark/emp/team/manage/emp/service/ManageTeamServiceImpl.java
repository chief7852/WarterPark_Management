package kr.or.waterpark.emp.team.manage.emp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.common.vo.LisenceVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.common.report.vo.ReportVO;
import kr.or.waterpark.emp.team.manage.emp.dao.IManageTeamDAO;

@Service
public class ManageTeamServiceImpl implements IManageTeamService{

	@Inject
	private IManageTeamDAO manageTeamDAO;
	
	@Override
	public List<EmpVO> retrieveEmpList() {
		return manageTeamDAO.selectEmpList();
	}

	@Override
	public List<FilesVO> retrieveEmpFileList(String empId) {
		List<FilesVO> files =  manageTeamDAO.selecetAllEmpFiles(empId);
		return files;
	}

	@Override
	public List<ReportVO> retrieveEmpReportList(String empId) {
		List<ReportVO> reports = manageTeamDAO.selectAllEmpReports(empId);
		return reports;
	}

	@Override
	public List<LisenceVO> retrieveEmpLisenceList(String empId) {
		List<LisenceVO> lisences = manageTeamDAO.selectAllEmpLisences(empId);
		return lisences;
	}


}
