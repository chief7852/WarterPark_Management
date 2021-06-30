package kr.or.waterpark.emp.team.ticketoffice.service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.emp.team.ticketoffice.vo.PosVO;
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
public interface IPosService {
	/**
	 * 업무를 시작한 pos 정보 insert
	 * @param pos
	 * @return
	 */
	public ServiceResult createPos(PosVO pos);
	
	/**
	 * pos 업무를 시작 했는지 조회
	 * @param tosale
	 * @return
	 */
	public PosVO retirevePos(TOSalesVO tosale);
}
