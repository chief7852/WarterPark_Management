package kr.or.waterpark.emp.team.snack.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CoinUseVO {
	
	private String coin_use_code;
	
	private String coin_code;
	
	private String prod_code;

	private String prod_del;
	
	private Integer prod_paycnt;
	
	private String coin_use_date;
	
	private Integer coin_use_amount;
	
	private String coin_use_cancel;

	private String prod_name;
	
	private String fc_name;
}
