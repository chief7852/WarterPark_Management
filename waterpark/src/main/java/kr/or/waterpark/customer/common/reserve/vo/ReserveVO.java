package kr.or.waterpark.customer.common.reserve.vo;

import java.io.Serializable;
import java.util.List;

import kr.or.waterpark.emp.team.ticketoffice.vo.TOSalesVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="res_code")
@NoArgsConstructor
@ToString
public class ReserveVO implements Serializable {
	private String res_code;
	private String user_id;
	private String res_date;
	private String res_predate;
	private String res_cancel;
	private String sale_id;
	
	private String res_code_encode;
	
	private String user_name;
	private Integer res_cnt;
	
	private List<ResInfoVO> resInfoList;
	private PayVO pay;
	private SaleVO sale;
	
	private String lfc_code; 	// 어느 매표소인지 알기 위함
	
	private Integer remain_days;
	
}
