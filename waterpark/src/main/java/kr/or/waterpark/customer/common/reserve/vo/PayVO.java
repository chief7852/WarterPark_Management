package kr.or.waterpark.customer.common.reserve.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="res_code")
@NoArgsConstructor
@ToString
public class PayVO implements Serializable{

	private String res_code;
	private String pay_date;
	private String pay_amount;
	private String pay_method;
	private String pay_way;
	
	private String pay_way_name;
	
}
