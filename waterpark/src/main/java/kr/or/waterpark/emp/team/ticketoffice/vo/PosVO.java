package kr.or.waterpark.emp.team.ticketoffice.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 김도윤
 * @since 2021. 6. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 16.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@ToString
@EqualsAndHashCode(of="pos_no")
@NoArgsConstructor
public class PosVO implements Serializable{
	private Integer pos_no;
	private String emp_id;
	private String fc_id;
	private String pos_work_date;
	private String pos_start;
	private String pos_end;
	private String pos_close;
}
