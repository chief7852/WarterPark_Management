package kr.or.waterpark.customer.common.reserve.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(exclude="remark")
@EqualsAndHashCode(of="sale_id")
public class SaleVO {
	private String sale_id;
	private String sale_name;
	private Integer sale_percent;
	private String sale_way;
	private String sale_who;
	private String sale_start;
	private String sale_end;
	private String remark;

}
