package kr.or.waterpark.customer.common.reserve.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.reserve.vo.ReserveVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketListForResVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

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
@Repository
public interface IReserveDAO {

	/**
	 * 예매 정보를 insert
	 * @param ticketList  -> ticket_id, ticket_cnt, 비회원인 경우 user_name, 회원인 경우에는 user_id, sale_id, res_predate
	 * @return 
	 */
	public int insertReserve(TicketListForResVO ticketList);
	
	/**
	 * 비회원용 계정을 생성
	 * @param user - user_name, user_hp
	 * @return 
	 */
	public int insertUserForNonUser(UserVO user);
	
	/**
	 * 예매 상세 내역 insert
	 * @param paramMap - res_code, ticket_id
	 * @return
	 */
	public int insertResInfo(Map<String, Object> paramMap);
	
	/**
	 * 결제 내역 insert
	 * @param ticketList - res_code, pay_amount, pay_method
	 * @return
	 */
	public int insertPay(TicketListForResVO ticketList);
	
	
	/**
	 * 예매 내역 조회 (RESERVE TABLE)
	 * @param paging 예매 코드 - pk
	 * @return
	 */
	public List<ReserveVO> selectReserveList(PagingVO<ReserveVO> paging);
	
	/**
	 * 예매 내역 전체 row 수
	 * @param paging
	 * @return
	 */
	public int selectReserveCount(PagingVO<ReserveVO> paging);
	
	/**
	 * 예매 취소 - db에서는 삭제 여부 컬럼을 update 함
	 * @param res_code - 예매 취소할 pk
	 * @return
	 */
	public int deleteReserve(String res_code);
	
	/**
	 * 예매 상세 내역 조회
	 * @param res_code 예매 코드
	 * @return
	 */
	public ReserveVO selectReserveInfoView(String res_code);
	
	
	
	/**
	 * ticket office 업무
	 */
	
	/**
	 * res_code를 이용하여 res_info_code 리스트 조회
	 * @param res_code
	 * @return
	 */
	public ReserveVO selectResInfoCodeList(String res_code);
	
	/**
	 * qr코드를 읽었을 때 예매, 예매 상세 내역을 조회
	 * @param reserve
	 * @return FAIL, OK, NOTEXIST,
	 */
	public ReserveVO selectAllResInfoAtTO(ReserveVO reserve);
	
	/**
	 * coin_code을 이용하여 현재 발권 상태를 조회
	 * @param coin_code
	 * @return OK, FAIL, NOTEXIST, CANCELED, EXPIRED
	 */
	public ReserveVO selectCoin(String coin_code);
	
	
}
