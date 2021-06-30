package kr.or.waterpark.customer.common.join.vo;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="clause_no")
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ClauseVO {

	private long clause_no;
	private String clause_title;
	private String clause_cont;
	private String clause_require;
	private String clause_del;
	private String agreement_check;
}
