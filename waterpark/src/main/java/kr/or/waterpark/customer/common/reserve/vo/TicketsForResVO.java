package kr.or.waterpark.customer.common.reserve.vo;

import java.io.Serializable;

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
@EqualsAndHashCode(of="ticket_id")
@NoArgsConstructor
@ToString
public class TicketsForResVO implements Serializable{

	private String ticket_id;
	private Integer ticket_cnt;
}
