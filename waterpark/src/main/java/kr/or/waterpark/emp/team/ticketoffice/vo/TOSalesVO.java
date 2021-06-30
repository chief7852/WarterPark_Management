package kr.or.waterpark.emp.team.ticketoffice.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="res_code")
@NoArgsConstructor
@ToString
public class TOSalesVO {
	private String res_code;
	private String fc_id;
	private String emp_id;
	private Integer pos_no;
}
