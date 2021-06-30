package kr.or.waterpark.emp.common.work.vo;

import kr.or.waterpark.emp.team.snack.vo.ProdVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="emp_id")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WorkVO {
	
	private int work_no;

	private String emp_name;
	
	private String emp_id;
	
	private String lwork_code;
	
	private String work_start_date;
	
	private String work_end_date;

	private String work_back;
	
	private String work_text;
	
	private String work_title;
	
	private String work_start;
	
	private String work_end;

	private String work_date;
}
