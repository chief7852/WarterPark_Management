package kr.or.waterpark.emp.team.ticketoffice.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="rm_no")
@ToString
@NoArgsConstructor
public class ReadyMoneyVO implements Serializable{
	private Integer rm_no;
	private Integer rm_ord;
	private String lrm_code;
	private Integer rm_amount;
	private String rm_date;
	private String fc_id;
	private String emp_id;
	private Integer pos_no;
}
