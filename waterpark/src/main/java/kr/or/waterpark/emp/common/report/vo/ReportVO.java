package kr.or.waterpark.emp.common.report.vo;


import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="report_no")
@NoArgsConstructor
@ToString(exclude="report_cont")
public class ReportVO implements Serializable{
	private Integer rnum;
	private Integer report_no;
	private String emp_id;
	private String report_title;
	private String report_cont;
	private String report_date;
	private String report_app; 	 
	private String report_app_need;
	private String lreport_code;
	private String report_del;
	private Integer file_no;
	private String emp_name;
	private String report_type;
	private String report_money;
}
