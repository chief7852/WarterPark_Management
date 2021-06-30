package kr.or.waterpark.customer.common.reserve.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 김도윤
 * @since 2021. 5. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="ticket_id")
@NoArgsConstructor
@ToString(exclude="remark")
public class TicketVO implements Serializable{

	private String ticket_id;
	private String ticket_name;
	private String ticket_type;
	private String ticket_age;
	private String ticket_price;
	private String ticket_sale;
	private String remark;
	private String ticket_grp;
	
	private List<ResInfoVO> resInfoList;
	
	private String ticket_type_name;
	private String ticket_age_name;
	private String ticket_grp_name;
	private Integer ticket_cnt;
}
