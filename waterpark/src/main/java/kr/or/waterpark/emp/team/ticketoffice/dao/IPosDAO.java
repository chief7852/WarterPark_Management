package kr.or.waterpark.emp.team.ticketoffice.dao;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.emp.team.ticketoffice.vo.PosVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.TOSalesVO;

@Repository
public interface IPosDAO {

	/**
	 * 업무를 시작한 pos 정보 insert
	 * @param pos
	 * @return
	 */
	public int insertPos(PosVO pos);
	
	/**
	 * pos 업무를 시작했는지 조회
	 * @param tosale
	 * @return
	 */
	public PosVO selectPos(TOSalesVO tosale);
}
