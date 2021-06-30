package kr.or.waterpark.emp.team.snack.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.customer.common.reserve.vo.ResInfoVO;
import kr.or.waterpark.customer.common.reserve.vo.ReserveVO;
import kr.or.waterpark.emp.team.snack.vo.CoinUseVO;
import kr.or.waterpark.emp.team.snack.vo.ProdVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.CoinChargeVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.CoinVO;

/**
 * @author 작성자명
 * @since 2021. 5. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * 2021. 5. 28.      정이삭       코인조회
 * 2021. 5. 29.      정이삭       상품리스트
 * --------     --------    ----------------------
 * 2021. 5. 27.      정이삭       최초작성
 * 2021. 6. 17.      김도윤       추가작성 - 매표소 메인 프로세스
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface ICoinDAO {
	//포켓코인 잔액
	public int balanceCoin(String coin_id);
	
	//상품고유번호 순서대로 들고오기
	public List<ProdVO> buyProds(List<Map<String, Object>> prodListMap);
	
	//코인 사용내역에 등록
	public int coinUses(ProdVO prodList);
	
	//코인 사용내역 조회
	public List<CoinUseVO> useHistory(String coin_code);
	
	//상품 환불
	public int refundProd(String coin_use_code);
	
	//당일 매출 조회
	public List<Map<String, Object>> daySales();
	
	
	
	/**
	   매표소 매인 프로세스 시작
	 */
	
	/**
	 * res_info_code를 가지고 coin_code를 생성 - insert
	 * @param reserve
	 * @return
	 */
	public int insertCoinCode(ResInfoVO resInfo);
	
	/**
	 * pocket coin에 얼마나 남아있는지 조회하기
	 * @param coin_code
	 * @return
	 */
	public CoinVO selectCoinRemain(String coin_code);
	
	/**
	 * 포켓 코인 충전 - Coin_Charge insert
	 * @param coin_charge
	 * @return insert 성공한 row 수
	 */
	public int insertCoinCharge(CoinChargeVO coin_charge);
	
	/**
	 * 포켓 코인 퇴장 처리 - update
	 * @param coin
	 * @return update 성공한 row 수
	 */
	public int updateCoin(CoinVO coin);
	
	
}
