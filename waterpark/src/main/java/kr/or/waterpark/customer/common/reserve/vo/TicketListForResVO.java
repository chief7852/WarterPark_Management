package kr.or.waterpark.customer.common.reserve.vo;

import java.io.Serializable;
import java.util.List;

import kr.or.waterpark.emp.team.ticketoffice.vo.ReadyMoneyVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.TOSalesVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 김도윤
 * @since 2021. 5. 28.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 28.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode
@ToString
@NoArgsConstructor
public class TicketListForResVO implements Serializable{
	private List<TicketsForResVO> ticketListForRes;
	private String res_code;
	private String sale_id;
	private String res_predate;
	private String user_name;
	private String user_id;
	private String user_hp;
	private Integer pay_amount;
	private String pay_method;
	private String pay_way;
	private String res_info_code;
	
	// ticket Office
//	private TOSalesVO toSale;
	private Integer rm_no;
	private List<ReadyMoneyVO> RMList;
	
	
	
}
