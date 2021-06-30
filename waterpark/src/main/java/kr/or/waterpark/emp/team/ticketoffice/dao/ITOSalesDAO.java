package kr.or.waterpark.emp.team.ticketoffice.dao;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.emp.team.ticketoffice.vo.TOSalesVO;

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
@Repository
public interface ITOSalesDAO {

	/**
	 * TO_SALES 테이블에 INSERT -> 매표소 매출
	 * @param toSales
	 * @return
	 */
	public int insertToSales(TOSalesVO toSales);
}
