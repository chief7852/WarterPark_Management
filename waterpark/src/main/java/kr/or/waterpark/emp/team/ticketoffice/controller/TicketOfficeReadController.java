package kr.or.waterpark.emp.team.ticketoffice.controller;

import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.waterpark.Constants;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.customer.common.reserve.dao.ISaleDAO;
import kr.or.waterpark.customer.common.reserve.service.IReserveService;
import kr.or.waterpark.customer.common.reserve.service.ITicketService;
import kr.or.waterpark.customer.common.reserve.vo.ResInfoVO;
import kr.or.waterpark.customer.common.reserve.vo.ReserveVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketListForResVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.team.snack.service.ICoinService;
import kr.or.waterpark.emp.team.ticketoffice.vo.CoinChargeVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.CoinVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.TOSalesVO;

/**
 * @author ?????????
 * @since 2021. 6. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[????????????(Modification Information)]]
 * ?????????                          ?????????               ????????????
 * --------     --------    ----------------------
 * 2021. 6. 10.      ?????????       ????????????
 * 2021. 6. 14.		 ?????????		  ????????????
 * 2021. 6. 15		 ?????????		  ????????? ?????? insert
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/emp/ticketOffice")
public class TicketOfficeReadController {

	private static final Logger logger = LoggerFactory.getLogger(TicketOfficeReadController.class);
	
	@Inject
	ITicketService ticketService;
	
	@Inject
	IReserveService reserveService;
	
	@Inject
	ICoinService coinService;
	
	@GetMapping
	public String ticketList(
			Model model,
			@SessionAttribute("EmpVO") EmpVO empVO,
			RedirectAttributes redirect
			) {
		String team_code = empVO.getTeam_code();
		String view = "emp/team/ticketOffice/pos";
		if(!"TO".equals(team_code)) {
			redirect.addFlashAttribute("authority","????????? ??????????????? ????????? ???????????? ???????????????.");
			view = "redirect:/emp/empLogin";
		}
		List<TicketVO> ticketList = ticketListForAjax(null);
		model.addAttribute("ticketList", ticketList);
		
		return view;
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<TicketVO> ticketListForAjax(
			@RequestParam(required=false) String ticket_grp
			){
		
		List<TicketVO> ticketList = ticketService.retrieveTicketListForTO(ticket_grp);
		
		return ticketList;
		
	}
	
	@PostMapping(value="/reserve",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> ticketOfficeRequest(
			@ModelAttribute TicketListForResVO ticketRequest
			, @SessionAttribute("EmpVO") EmpVO emp
			, @ModelAttribute TOSalesVO tosale
			){
		Map<String, Object> resultMap = new HashMap<>();
		ticketRequest.setUser_id("TICKETOFFICE"); // ?????? ????????? ??????
		
		logger.info("ticketOffice/reserve ?????? : {}", ticketRequest);
		
		// ?????? ???????????? ?????? ?????? ?????? ????????? ??????
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		cal.add(Calendar.DATE, 1);
		String res_predate = df.format(cal.getTime());
		ticketRequest.setRes_predate(res_predate);
		
		tosale.setEmp_id(emp.getEmp_id());
		tosale.setRes_code(ticketRequest.getRes_code());
		
		ServiceResult sresult = reserveService.createReserveAtTO(ticketRequest, tosale);
		String result = "";
		switch (sresult) {
		case OK:
			result = "SUCCESS";
			resultMap.put("res_code", ticketRequest.getRes_code());
			break;
		case FAIL:
			result = "FAIL";
			break;

		default:
			result = sresult.toString();
			break;
		}
		
		resultMap.put("result", result);
		
		
		return resultMap;
	}
	
	@PostMapping(value="/resInfoCode", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> getResInfoCodeListNcreateCoinCode(
			@ModelAttribute ReserveVO reserve
			){
		Map<String, Object> resultMap = new HashMap<>();
		logger.info("getResInfoCodeListNcreateCoinCode");
		logger.info("??????????????? ????????? reserve : {}", reserve);
		ServiceResult sresult = reserveService.createCoinCode(reserve);
		String result = "FAIL";
		switch (sresult) {
		case OK:
			result = "SUCCESS";
			resultMap.put("resInfoList", reserve.getResInfoList());
			break;

		default:
			result = sresult.toString();
			logger.info("ok ??????");
			break;
		}
		
		resultMap.put("result", result);
		return resultMap;
	}
	

	@PostMapping(value="/QRRead",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> QRCodeReadAtTO(
			@ModelAttribute ReserveVO reserve
			){
		Map<String, Object> resultMap = new HashMap<>();
		logger.info("QRCodeReadAtTO : {}", reserve);
		ReserveVO allReserve = reserveService.retrieveAllResInfoAtTO(reserve);
		String result = "";
		if(allReserve == null) {
			result = "FAIL";
		}else {
			result = "SUCCESS";
			resultMap.put("allReserve", allReserve);
			
		}
		resultMap.put("result", result);
		logger.info("allReserve : {}", allReserve);
		
		return resultMap;
	}
	
	@PostMapping(value="/pocketQRRead", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> pocketQRReadAtTO(
			@ModelAttribute CoinVO coin
			){
		Map<String, Object> resultMap = new HashMap<>();
		logger.info("parameter coin : {}", coin );
		CoinVO remainCoin = coinService.retrieveCoinRemain(coin.getCoin_code());
		logger.info("parameter remain coin : {}", remainCoin );
		
		resultMap.put("remainCoin", remainCoin);
		return resultMap;
	}
	
	@PostMapping(value="/chargeCode", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> pocketCoinChargeAtTO(
			@ModelAttribute CoinChargeVO coinCharge
			){
		Map<String, Object> resultMap = new HashMap<>();
		logger.info("chargeCode : {}", coinCharge);
		ServiceResult sResult = coinService.createCoinCharge(coinCharge);
		String result = "";
		String message = "";
		switch (sResult) {
		case OK:
			result = "SUCCESS";
			break;
		case NOTEXIST:
			result = sResult.toString();
			message = "?????? ????????? ???????????? ????????????.";
			break;
		case CANCELED:
			result = sResult.toString();
			message = "?????? ???????????? ????????? ??? ????????????.";
			break;
		case EXPIRED:
			result = sResult.toString();
			message = "?????? ??????????????? ???????????????.";
			break;
			
		default:
			
			break;
		}
		resultMap.put("result", result);
		resultMap.put("message", message);
		
		// ???????????? ?????? ??? ?????? ????????? ?????? ??? ????????? ??????. coin_charge???
		return resultMap;
	}
	
	@PutMapping(value="coinEnd", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> pocketCoinEndAtTO(
			@ModelAttribute CoinVO coin
			){
		Map<String, Object> resultMap = new HashMap<>();
		ServiceResult sResult = coinService.modifyCoin(coin);
		String result = "";
		String message = "";
		switch (sResult) {
		case OK:
			result = "SUCCESS";
			break;
		case NOTEXIST:
			result = sResult.toString();
			message = "?????? ????????? ???????????? ????????????.";
			break;
		case CANCELED:
			result = sResult.toString();
			message = "?????? ???????????? ????????? ??? ????????????.";
			break;
		case EXPIRED:
			result = sResult.toString();
			message = "?????? ??????????????? ???????????????.";
			break;
			
		default:
			
			break;
		}
		resultMap.put("result", result);
		resultMap.put("message", message);
		resultMap.put("coin", coin);
		return resultMap;
	}
	
}
