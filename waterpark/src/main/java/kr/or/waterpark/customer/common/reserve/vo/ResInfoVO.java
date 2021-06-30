package kr.or.waterpark.customer.common.reserve.vo;

import java.io.Serializable;
import java.util.List;

import kr.or.waterpark.emp.team.ticketoffice.vo.CoinVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 김도윤
 * @since 2021. 6. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 1.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(of="res_info_code")
@ToString
public class ResInfoVO  implements Serializable{
	private String res_info_code;
	private String res_code;
	private String ticket_id;
	
	private TicketVO ticket;
	private Integer res_info_cnt;
	private MembershipVO membership;
	private List<CoinVO> coinList;

}
