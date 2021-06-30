package kr.or.waterpark.emp.team.snack.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CoincodeDecrypt;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.emp.team.snack.service.ICoinService;
import kr.or.waterpark.emp.team.snack.vo.CoinUseVO;


/**
 * @author 작성자명
 * @since 2021. 5. 28.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 27.    정이삭       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/snack/payment/coin")
public class PaymentController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Inject
	private ICoinService service;
	
	
	//잔액확인
	@GetMapping
	@ResponseBody
	public Map<String, Object> coinRead(
		@RequestParam("coin_id")String coin_id
		) throws ParseException, InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
//		coin_id라는 aes암호화되어있는 정보를 가져와서 복호화 후 parser하는 것 모듈화 해야함
		coin_id = CoincodeDecrypt.coindecrytAES256(coin_id);
//		여기까지
		logger.info("\n\n\n",coin_id);
		int blcoin = service.balanceCoin(coin_id);
		Map<String, Object> result = new HashMap<>();
		result.put("coin_id", coin_id);
		result.put("blcoin",blcoin);
		return result;
	}
	
	//상품구매
	@PostMapping
	@ResponseBody
	public Map<String, Object> coinOrder(
			@RequestBody List<Map<String, Object>> listmap
			) {
		Map<String, Object> message = new HashMap<>();
		Map<String, Object> result = service.purchaseProd(listmap);
		switch ((ServiceResult)result.get("result")) {
		case OK:
			message.put("message", "결제완료!");
			message.put("prodlist", result.get("value"));
			break;
		case NOTENOUGH:
			message.put("message", "잔액이 부족합니다!");
			break;
		case FAIL:
			message.put("message", "유효하지않은 코드입니다!");
			break;
		case NOTEXIST:
			message.put("message", "재고가 없습니다 다시 확인해주세요!");
			break;
		default:
			break;
		}
		
		
		return message;
	}
	
	//구매내역 조회
	@PutMapping()
	@ResponseBody
	public List<CoinUseVO> coinUseList(
			@RequestBody Map<String, Object> param
		){
		String coin_code = param.get("coin_code").toString();
		logger.info(coin_code);
		List<CoinUseVO> useList = service.useHistory(coin_code);
		return useList;
	}
	
	//환불
	@DeleteMapping
	@ResponseBody
	public Map<String, Object> prodrefund(
		@RequestBody Map<String, Object> param	
		){
		String coin_use_code = param.get("coin_use_code").toString();
		ServiceResult result = service.refundProd(coin_use_code);
		Map<String, Object> returns = new HashMap<>();
		if(result == ServiceResult.OK) {
			returns.put("result", "환불되었습니다");
		}else {
			returns.put("result", "환불실패!");
		}
		
		return returns;
	}
	
	
}
