package kr.or.waterpark.customer.common.reserve.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.customer.common.reserve.vo.TicketListForResVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketVO;

/**
 * @author 김도윤
 * @since 2021. 5. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface ITicketDAO {
	

	/**
	 * 고객용 홈페이지
	 * 이용권 그룹(고객에게 보이는 이름은 종류)에 따라 해당하는 이용권들을 조회 
	 * ticket_name, ticket_type, ticket_sale, ticke_grp로 그룹핑하여 조회한다.
	 * @param ticket 이용권 그룹 - com_code
	 * @return
	 */
	public List<TicketVO> selectSimpleTicketList(TicketVO ticket);
	
	/**
	 * 클라이언트에게 요청 받은 예매 목록의 ticket_id를 가지고 ticket_grp가 일일과 연간 이용권인지 조회
	 * @param ticketRequest - ticket_id 활용
	 * @return ticket_grp List
	 */
	public List<String> selectTicketGrpList(TicketListForResVO ticketRequest);
	
	/**
	 * 매표소 POS용 - Ticket Office
	 * @param ticket_grp
	 * @return
	 */
	public List<TicketVO> selectTicketListForTO(String ticket_grp);
	
}
