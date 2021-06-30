package kr.or.waterpark.emp.team.snack.service;

import java.util.List;
import java.util.Map;

import kr.or.waterpark.common.enumpkg.ServiceResult;
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
 * 2021. 5. 31.      정이삭       상품리스트
 * --------     --------    ----------------------
 * 2021. 5. 27.      정이삭       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface ICoinService {

	//포켓코인 잔액
	public int balanceCoin(String coin_id);
	
	//상품구매
	public Map<String, Object> purchaseProd(List<Map<String, Object>> prodList);
	
	//구매내역
	public List<CoinUseVO> useHistory(String coin_code);
	
	//상품환불
	public ServiceResult refundProd(String coin_use_code);
	
	//당일 매출 조회
	public List<Map<String, Object>> daySales();
	
	
	
	/**
	 * 매표소 메인 프로세스 시작
	 */
	/**
	 * pocket coin에 얼마나 남아있는지 조회하기
	 * @param coin_code
	 * @return
	 */
	public CoinVO retrieveCoinRemain(String coin_code);
	
	/**
	 * 포켓 코인 충전 - Coin_Charge insert
	 * @param coin_charge
	 * @return OK, FAIL, NOTEXIST, CANCELED, EXPIRED
	 */
	public ServiceResult createCoinCharge(CoinChargeVO coin_charge);
	
	
	/**
	 * 포켓 코인 퇴장 처리 - update
	 * @param coin
	 * @return OK, FAIL, NOTEXIST, CANCELED, EXPRIED
	 */
	public ServiceResult modifyCoin(CoinVO coin);
	
	
}
