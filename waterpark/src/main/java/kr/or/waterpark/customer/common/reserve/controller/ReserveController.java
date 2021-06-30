package kr.or.waterpark.customer.common.reserve.controller;

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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.waterpark.Constants;
import kr.or.waterpark.common.dao.IComCodeDAO;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.reserve.dao.ISaleDAO;
import kr.or.waterpark.customer.common.reserve.service.IReserveService;
import kr.or.waterpark.customer.common.reserve.service.ITicketService;
import kr.or.waterpark.customer.common.reserve.vo.SaleVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketListForResVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketVO;

/**
 * @author 김도윤
 * @since 2021. 5. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 *      </pre>
 */
@Controller
@RequestMapping("/customer/use-info/reserve")
public class ReserveController {
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);

	@Inject
	private ITicketService service;

	@Inject
	private IComCodeDAO comCodeDao;

	@Inject
	private IReserveService reserveService;

	@Inject
	private ISaleDAO saleDao;
	
	@Inject
	private ITicketService ticketSerivce;


	private void getSaleList(Model model) {
		List<SaleVO> saleList = saleDao.selectSaleList("OP");
		model.addAttribute("saleList", saleList);
	}

	private void getTicketAge(Model model) {
		List<Map<String, Object>> taList = comCodeDao.selectComCodeList("TA");
		model.addAttribute("taList", taList);
	}

	private void getTicketGrp(Model model) {
		List<Map<String, Object>> tgList = comCodeDao.selectComCodeList("TG");
		model.addAttribute("tgList", tgList);

	}

	@GetMapping()
	public String reserveList(@ModelAttribute TicketVO ticket, Model model) {
		logger.info("그냥 get요청");
		getTicketGrp(model);
		getTicketAge(model);
		getSaleList(model);
		// 할인 정보도 가져와야함

		List<TicketVO> ticketList = service.retrieveSimpleTicketList(ticket);
		model.addAttribute("ticketList", ticketList);

		return "customer/reserve/reserveForm";
	}

	@GetMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<TicketVO> reserveListForAjax(@ModelAttribute TicketVO ticket, Model model) {
		logger.info("get이면서 ajax 요청일때");
//		getTicketGrp(model);
//		getTicketAge(model);
//		getSaleList(model);
		// 할인 정보도 가져와야함

		List<TicketVO> ticketList = service.retrieveSimpleTicketList(ticket);

		return ticketList;
	}

	@PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	@Transactional
	public Map<String, Object> reserveRequest(@ModelAttribute TicketListForResVO ticketRequest,
			@SessionAttribute(value = "UserVO", required = false) UserVO user) {

		// 연간 이용권을 산건지 샀다면 단독으로 구매한게 맞는지, 확인하는 메소드
		ServiceResult checkRequest = ticketSerivce.retrieveTicketGrpList(ticketRequest);
		logger.info("checkRequest의 결과 : {}", checkRequest.toString());
		Map<String, Object> resultMap = new HashMap<>();
		String result = ServiceResult.FAIL.toString();
		switch (checkRequest) {
		case NOTEXIST:
			result = ServiceResult.NOTEXIST.toString();
			break;
		case MIXEDTICKET:
			result = ServiceResult.MIXEDTICKET.toString();
			break;
		case NEEDONLYONE:
			result = ServiceResult.NEEDONLYONE.toString();
			break;
		default:
			// 로그인이 되어있는지 아닌지 확인
			ticketRequest.setPay_way("OP");
			if (user == null) {	// 로그인이 안되어있는 비회원이 주문할때 비회원용 계정을 생성한다.
				if(!ServiceResult.DAYTICKET.equals(checkRequest)) {	// 비회원인데 연간 이용권을 사려고 할 때
					result = ServiceResult.NOTALLOWED.toString();
					break;
				}
				user = new UserVO();
				user.setUser_name(ticketRequest.getUser_name());
				user.setUser_hp(ticketRequest.getUser_hp());
				ServiceResult userResult = reserveService.createUserForNonUser(user);
				if (ServiceResult.OK.equals(userResult)) {
					ticketRequest.setUser_id(user.getUser_id());
					
				} else {
					logger.info("계정 생성 실패");
				}
			}else if(user.getMembership_year() > 0 && ServiceResult.YEARTICKET.equals(checkRequest)) {	
				// 회원이면서 이미 멤버십이 적용되어잇으면서 연간 이용권을 또 구입하려는 경우
				result = ServiceResult.ALREADYHAVE.toString();
				break;
			}else {
				ticketRequest.setUser_id(user.getUser_id());
			}
			
			ServiceResult reserveResult = reserveService.createReserve(ticketRequest, checkRequest);
			if (ServiceResult.OK.equals(reserveResult)) {
				result = "SUCCESS";
				logger.info("reserveRequest 성공하고 난 후의 ticketRequest : {}", ticketRequest);
				try {
					String res_code_encode = CryptoUtil.encryptAES256(ticketRequest.getRes_code(), Constants.ENCODEKEYFORRESCODE);
					resultMap.put("res_code_encode", res_code_encode);
				} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException
						| NoSuchPaddingException | InvalidAlgorithmParameterException | IllegalBlockSizeException
						| BadPaddingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			break;
		}

		resultMap.put("result", result);
		return resultMap;
	}

	

}
