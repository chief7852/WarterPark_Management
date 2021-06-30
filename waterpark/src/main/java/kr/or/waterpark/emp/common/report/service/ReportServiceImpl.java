package kr.or.waterpark.emp.common.report.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.waterpark.emp.common.report.dao.IReportDAO;
import kr.or.waterpark.emp.common.report.vo.ReportVO;

@Service
public class ReportServiceImpl implements IReportService{
	
	private static final Logger logger =
		LoggerFactory.getLogger(ReportServiceImpl.class);
	
	private IReportDAO reportDAO;
	
	@Inject
	public void setReportDAO(IReportDAO reportDAO) {
		this.reportDAO = reportDAO;
		logger.info("주입된 reportDAO : {}", reportDAO.getClass().getName());
	}

	@Override
	public List<ReportVO> empNoticeList(String lreportCode) {
		// TODO Auto-generated method stub
		return reportDAO.empNoticeList(lreportCode);
	}

	@Override
	public ReportVO empNoticeDetail(int report_no) {
		
		return reportDAO.empNoticeDetail(report_no);
	}

	@Override
	public int empNoticeDelete(int report_no) {
		
		return reportDAO.empNoticeDelete(report_no);
	}

	@Override
	public int empNoticeForm(ReportVO reportVO) {
		
		return reportDAO.empNoticeForm(reportVO);
		
	}

	@Override
	public int empNoticeInsert(ReportVO reportVO) {
		
		return reportDAO.empNoticeInsert(reportVO);
	}

	@Override
	public List<ReportVO> empPRODList(String emp_id) {
		// TODO Auto-generated method stub
		return reportDAO.empPRODList(emp_id);
	}

}
