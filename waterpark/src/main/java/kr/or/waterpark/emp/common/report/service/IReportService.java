package kr.or.waterpark.emp.common.report.service;

import java.util.List;

import kr.or.waterpark.emp.common.report.vo.ReportVO;

public interface IReportService {
	List<ReportVO> empNoticeList(String string);

	ReportVO empNoticeDetail(int report_no);

	public int empNoticeDelete(int report_no);

	public int empNoticeForm(ReportVO reportVO);

	public int empNoticeInsert(ReportVO reportVO);
	
	List<ReportVO> empPRODList(String emp_id);
}
