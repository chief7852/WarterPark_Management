package kr.or.waterpark.emp.team.ticketoffice.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode
@ToString
@NoArgsConstructor
public class CoinChargeVO implements Serializable{
	private String coin_charge_code;
	private String coin_code;
	private Integer coin_charge_amount;
	private String coin_charge_date;
	private String coin_charge_state;
}
