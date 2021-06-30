package kr.or.waterpark.emp.common.report.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.emp.common.report.vo.ReportVO;

@Repository
public interface IReportDAO {

	List<ReportVO> empNoticeList(String lreportCode);

	ReportVO empNoticeDetail(int report_no);

	public int empNoticeDelete(int report_no);

	public int empNoticeForm(ReportVO reportVO);

	public int empNoticeInsert(ReportVO reportVO);

	List<ReportVO> empReportList(String emp_id);
	
	List<ReportVO> empPRODList(String emp_id);
	
	
}
