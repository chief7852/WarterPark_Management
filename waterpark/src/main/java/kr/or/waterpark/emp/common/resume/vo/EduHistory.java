package kr.or.waterpark.emp.common.resume.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
public class EduHistory implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer eh_no;
	private String emp_id;
	private String eh_name;
	private String eh_date;
	private String eh_major;
	private String eh_degree;
	private String eh_complete;
	private Integer file_no;

}
