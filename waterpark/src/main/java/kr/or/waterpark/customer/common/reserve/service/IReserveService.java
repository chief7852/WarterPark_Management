package kr.or.waterpark.customer.common.reserve.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.reserve.vo.ReserveVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketListForResVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.TOSalesVO;

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
@Service
public interface IReserveService {

	/**
	 * 예매 정보를 insert
	 * @param ticketList  -> ticket_id, ticket_cnt, 비회원인 경우 user_name, 회원인 경우에는 user_id, sale_id, res_predate
	 * @param checkRequest TODO
	 * @return
	 */
	public ServiceResult createReserve(TicketListForResVO ticketList, ServiceResult checkRequest);
	
	/**
	 * 비회원용 계정을 생성
	 * @param user - user_name, user_hp
	 * @return
	 */
	public ServiceResult createUserForNonUser(UserVO user);

	/**
	 * 예매 내역 조회 (RESERVE TABLE)
	 * @param paging 예매 코드 - pk
	 * @return
	 */
	public List<ReserveVO> retrieveReserveList(PagingVO<ReserveVO> paging);
	
	/**
	 * 예매 내역 전체 row 수
	 * @param paging
	 * @return
	 */
	public int retrieveReserveCount(PagingVO<ReserveVO> paging);
	
	/**
	 * 예매 취소 - db에서는 삭제 여부 컬럼을 update 함
	 * @param res_code - 예매 취소할 pk
	 * @return OK, FAIL, NOTEXIST
	 */
	public ServiceResult removeReserve(String res_code);
	
	/**
	 * 예매 상세 내역 조회
	 * @param res_code 예매 코드
	 * @return
	 */
	public ReserveVO retrieveReserveInfoView(String res_code);
	
	
	/**
	 * ticket Office
	 */
	
	/**
	 * 현장 매표소에서 예매했을 때 insert
	 * @param ticketList
	 * @param tosale 
	 * @return
	 */
	public ServiceResult createReserveAtTO(TicketListForResVO ticketList, TOSalesVO tosale);
	
	/**
	 * res_code를 이용하여 res_info_code 리스트 조회
	 * @param reserve
	 * @return NOTEXIST, CANCELED, OK, FAIL
	 */
	public ServiceResult createCoinCode(ReserveVO reserve);
	
	/**
	 * qr코드를 읽었을 때 예매, 예매 상세 내역을 조회
	 * @param reserve
	 * @return FAIL, OK, NOTEXIST,
	 */
	public ReserveVO retrieveAllResInfoAtTO(ReserveVO reserve);
	
	/**
	 * coin_code을 이용하여 현재 발권 상태를 조회
	 * @param coin_code
	 * @return OK, FAIL, NOTEXIST, CANCELED, EXPIRED
	 */
	public ServiceResult retrieveCoin(String coin_code);
	
}
