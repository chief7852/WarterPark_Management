package kr.or.waterpark.emp.team.snack.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.waterpark.Constants;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CoincodeDecrypt;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.customer.common.reserve.service.IReserveService;
import kr.or.waterpark.customer.common.reserve.vo.ReserveVO;
import kr.or.waterpark.emp.team.snack.dao.ICoinDAO;
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
 * 2021. 6. 04.      정이삭       상품리스트
 * 2021. 6. 23.      김도윤       매표소 메인 프로세스
 * --------     --------    ----------------------
 * 2021. 5. 27.      정이삭       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class CoinServiceImpl implements ICoinService{
	
	private static final Logger logger = LoggerFactory.getLogger(CoinServiceImpl.class);
	@Inject
	private ICoinDAO coinDAO;

	@Inject
	private IReserveService reserveService;
	
	public void setprodDao(ICoinDAO dao) {
		this.coinDAO = coinDAO;
		logger.info("주입된 iprodDAO : {}", coinDAO.getClass().getName());
	}
	
	@Override
	public int balanceCoin(String coin_id) {
		coin_id = CoincodeDecrypt.coindecrytAES256(coin_id);
		return coinDAO.balanceCoin(coin_id);
	}
	
	@Transactional
	@Override
	public Map<String, Object> purchaseProd(List<Map<String, Object>> prodList) {
		ServiceResult result = null;
		String coin_code = (String)prodList.get(0).get("coin_code");
		coin_code = CoincodeDecrypt.coindecrytAES256(coin_code);
		int total = (Integer)prodList.get(0).get("total");
		int count = 0;
		int qtys = 0;
		Map<String , Object> returns = new HashMap<>();
		//장바구니 담긴 세부 수량
		for(Map<String,Object> qty : prodList) {
			logger.info("d : "+qty.get("qty").toString());
			qtys+= Integer.valueOf((String) qty.get("qty"));
		}
		
		//돈이 모자라는지 체크
		if(coinDAO.balanceCoin(coin_code)<total) {
			returns.put("result", ServiceResult.NOTENOUGH);
			return returns;
		};
		//==================
		List<ProdVO> prods = new ArrayList<>();
		prods = coinDAO.buyProds(prodList);
		//판매할 재고가 있는지(혹시라도 없는데 찍히면 얼마가 찍힐지)
		if(prods.size() != qtys) {
			returns.put("result",ServiceResult.NOTEXIST);
			return returns;
		}
		//코인번호 넣기
		for(ProdVO addcoin : prods) {
			addcoin.setCoin_code(coin_code);			
			count += coinDAO.coinUses(addcoin);
		}
		if(count != prods.size()) {
			result = ServiceResult.FAIL;
			returns.put("result",result); 
			try {
				throw new Exception();
			}catch (Exception e) {}
			return returns;
		}
		
		
		returns.put("result", ServiceResult.OK);
		returns.put("value", prods);
		
		return returns;
	}

	@Override
	public List<CoinUseVO> useHistory(String coin_code) {
		coin_code = CoincodeDecrypt.coindecrytAES256(coin_code);
		return coinDAO.useHistory(coin_code);
	}
	
	@Transactional
	@Override
	public ServiceResult refundProd(String coin_use_code) {
		ServiceResult result = ServiceResult.FAIL;
		
		int count = coinDAO.refundProd(coin_use_code);
		if(count>0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	
	
	
	@Override
	public List<Map<String, Object>> daySales() {
		// TODO Auto-generated method stub
		return coinDAO.daySales();
	}

	@Override
	public CoinVO retrieveCoinRemain(String coin_code) {
		coin_code = CoincodeDecrypt.coindecrytAES256(coin_code);
		return coinDAO.selectCoinRemain(coin_code);
	}


	@Override
	public ServiceResult createCoinCharge(CoinChargeVO coin_charge) {
		ServiceResult result = ServiceResult.FAIL;
		ServiceResult retrieveResult = reserveService.retrieveCoin(coin_charge.getCoin_code());
		if(ServiceResult.OK.equals(retrieveResult)) {
			int cnt = coinDAO.insertCoinCharge(coin_charge);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}else {
			result = retrieveResult;
		}
		return result;
	}

	@Override
	public ServiceResult modifyCoin(CoinVO coin) {
		ServiceResult result = ServiceResult.FAIL;
		ServiceResult retrieveResult = reserveService.retrieveCoin(coin.getCoin_code());
		if(ServiceResult.OK.equals(retrieveResult)) {
			int cnt = coinDAO.updateCoin(coin);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}else {
			result = retrieveResult;
		}
		return result;
	}

	

	
	



}
