package kr.or.waterpark.emp.team.ticketoffice.dao;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.customer.common.reserve.vo.TicketListForResVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.PosVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.ReadyMoneyVO;

@Repository
public interface IReadyMoneyDAO {

	/**
	 * 업무를 개시할 때, 시재 관리에 초기 준비금을 예치하는 작업 insert
	 * @param pos
	 * @return
	 */
	public int insertReadyMoneyAtStart(PosVO pos);
	
	/**
	 * Ready_Money에 매표소에서 고객이 결제할 때의 정보를 insert
	 * @param ticketList
	 * @return
	 */
	public int insertReadyMoneyAtCharge(TicketListForResVO ticketList);
	
	/**
	 * 시재 관리 조회
	 * @param ticketList
	 * @return
	 */
	public ReadyMoneyVO selectReadyMoney(TicketListForResVO ticketList);
}
