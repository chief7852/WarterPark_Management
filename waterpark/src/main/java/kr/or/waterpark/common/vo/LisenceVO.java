package kr.or.waterpark.common.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
public class LisenceVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer rnum;
	private String lisence_code;
	private String emp_id;
	private String lisence_pn;
	private String lisence_get;
	private String lisence_exp;
	private String lisence_name;
	private String lisence_pub;
	private String file_no;

}
