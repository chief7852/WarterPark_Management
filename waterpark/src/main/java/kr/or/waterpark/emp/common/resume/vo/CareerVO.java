package kr.or.waterpark.emp.common.resume.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CareerVO implements Serializable {
	private static final long serialVersionUID = 1L;
	private String career_no;
	private String emp_id;
	private String career_com;
	private String career_com_addr;
	private String career_start;
	private String career_end;
	private String career_position;
	private String lisence;
	private String file_no;
}
