package kr.or.waterpark.emp.team.ticketoffice.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 김도윤
 * @since 2021. 6. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 17.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of= "coin_code")
@ToString
@NoArgsConstructor
public class CoinVO implements Serializable{
	private String coin_code;
	private String res_info_code;
	private String coin_start;
	private String coin_end;
	
	private Integer coin_remain;
}
