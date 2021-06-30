package kr.or.waterpark.customer.common.reserve.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.internal.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.waterpark.Constants;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.reserve.service.IReserveService;
import kr.or.waterpark.customer.common.reserve.vo.ResInfoVO;
import kr.or.waterpark.customer.common.reserve.vo.ReserveVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

/**
 * @author 김도윤
 * @since 2021. 6. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 2.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/customer/use-info/reserveInfo")
public class ReserveInfoController {
	
	@Inject
	private IReserveService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveInfoController.class);

	@GetMapping
	public String reserveInfoList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(required=false) String what // what이 있다는거는 비회원이든 회원이든 예매한 직후에 보러 왔다는 이야기
			, @RequestParam(required=false) Map<String, Object> searchMap
			, Model model
			, @SessionAttribute(value="UserVO",required=false) UserVO user
			, RedirectAttributes redirect
			) {
		PagingVO<ReserveVO> paging = null;
		String view = "customer/reserve/reserveList";
		if(StringUtil.isBlank(what) && user == null) {	// 로그인이 안되어있고 예매한 직후가 아닌 경우 - 비회원 정보를 입력해야 예매 내역을 볼 수 있음
			view = "customer/reserve/authForReserveInfo";
		}else if(!StringUtil.isBlank(what) && user == null) { // 로그인은 안되어잇으나, 예매한 직후로 얘매 내역을 조회하는 경우
			searchMap.put("res_code_encode", what);
			paging = reserveInfoListPostForAjax(currentPage, searchMap, null);
		}else {	// 로그인되어 있는 경우 - 로그인되어 있는 정보로 예매내역을 조회
			
			searchMap.put("user_id", user.getUser_id());
			paging = reserveInfoListPostForAjax(currentPage, searchMap, user);
		}
		model.addAttribute("paging", paging);
		return view;
	}
	
	@PostMapping
	public String reserveInfoListPostForHTML(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam Map<String, Object> searchMap
			, Model model
			, RedirectAttributes redirect
			) {
		String view = "customer/reserve/reserveList";
		
		if(StringUtils.isBlank(searchMap.get("res_code").toString())) {
			if(
				StringUtils.isBlank(searchMap.get("user_hp1").toString()) ||
				StringUtils.isBlank(searchMap.get("user_hp2").toString()) ||
				StringUtils.isBlank(searchMap.get("user_hp3").toString()) ||
				StringUtils.isBlank(searchMap.get("user_name").toString()) 
					) {
				redirect.addFlashAttribute("message", "입력하신 정보가 일치하지 않습니다.");
				view = "redirect:/customer/use-info/reserveInfo";
			}else {
				String user_hp = searchMap.get("user_hp1").toString() +searchMap.get("user_hp2").toString() + searchMap.get("user_hp3");
				searchMap.put("user_hp", user_hp);
			}
		}
		PagingVO<ReserveVO> paging = reserveInfoListPostForAjax(currentPage, searchMap, null);
		model.addAttribute("paging", paging);
		
		return view;
	}
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<ReserveVO> reserveInfoListPostForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam Map<String, Object> searchMap
			, @SessionAttribute(value="UserVO",required=false) UserVO user
			){
		if(user != null) {
			searchMap.put("user_id", user.getUser_id());
		}
		decodeResCode(searchMap);
		PagingVO<ReserveVO> paging = new PagingVO<>(10, 4);
		paging.setCurrentPage(currentPage);
		paging.setSearchMap(searchMap);
		int totalRecord = service.retrieveReserveCount(paging);
		paging.setTotalRecord(totalRecord);
		List<ReserveVO> reserveList = service.retrieveReserveList(paging);
		
		encodeResCode(reserveList);
		
		paging.setDataList(reserveList);
		return paging;
	}
	
	
	private void encodeResCode(List<ReserveVO> reserveList)  {
		for(ReserveVO reserve : reserveList) {
			String res_code = reserve.getRes_code();
			String res_code_encode;
			try {
				res_code_encode = CryptoUtil.encryptAES256(res_code, Constants.ENCODEKEYFORRESCODE);
				reserve.setRes_code_encode(res_code_encode);
			} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException
					| NoSuchPaddingException | InvalidAlgorithmParameterException | IllegalBlockSizeException
					| BadPaddingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	private void decodeResCode(Map<String, Object> searchMap) {
		String res_code_encode = (String) searchMap.get("res_code_encode");
		if(StringUtils.isNotBlank(res_code_encode)) {
			try {
				String res_code = CryptoUtil.decryptAES256(res_code_encode, Constants.ENCODEKEYFORRESCODE);
				searchMap.put("res_code", res_code);
			} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException
					| NoSuchPaddingException | InvalidAlgorithmParameterException | IllegalBlockSizeException
					| BadPaddingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@DeleteMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> cancelReserve(
			@RequestParam String res_code
			){
		Map<String, Object> map = new HashMap<>();
		logger.info("delete 진입, res_code : " + res_code);
		ServiceResult serviceResult = service.removeReserve(res_code);
		String result = "Fail";
		if(ServiceResult.OK.equals(serviceResult)) {
			result = "Success";
		}
		
		map.put("result", result);
		
		return map;
	}
	
	@GetMapping("/reserveView")
	public String reserveView(
				@RequestParam String res_code_encode
				, Model model
			) throws ParseException, InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		logger.info("파라미터로 들어온 res_code_encode : {}, 길이 : {}", res_code_encode, res_code_encode.length());
		
		String res_code = CryptoUtil.decryptAES256(res_code_encode, Constants.ENCODEKEYFORRESCODE);
		ReserveVO reserve = service.retrieveReserveInfoView(res_code);
		int res_cnt = 0;
		for(ResInfoVO resInfo : reserve.getResInfoList()) {
			res_cnt += resInfo.getRes_info_cnt();
		}
		reserve.setRes_cnt(res_cnt);
		calRemainDays(reserve);
		res_code_encode = CryptoUtil.encryptAES256(reserve.getRes_code(), Constants.ENCODEKEYFORRESCODE);
		reserve.setRes_code_encode(res_code_encode);
		model.addAttribute("reserve", reserve);
		return "customer/reserve/reserveView";
	}
	
	@GetMapping("/print")
	public String resInfoPrint(
			@RequestParam String res_code_encode,
			Model model
			) throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException, ParseException {
		String res_code = CryptoUtil.decryptAES256(res_code_encode, Constants.ENCODEKEYFORRESCODE);
		ReserveVO reserve = service.retrieveReserveInfoView(res_code);
		int res_cnt = 0;
		for(ResInfoVO resInfo : reserve.getResInfoList()) {
			res_cnt += resInfo.getRes_info_cnt();
		}
		reserve.setRes_cnt(res_cnt);
		calRemainDays(reserve);
		res_code_encode = CryptoUtil.encryptAES256(reserve.getRes_code(), Constants.ENCODEKEYFORRESCODE);
		reserve.setRes_code_encode(res_code_encode);
		model.addAttribute("reserve", reserve);
		return "noTiles/reserve/reservePrint";
	}
	
	
	private void calRemainDays(
			ReserveVO reserve
			) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date today = format.parse(LocalDate.now().toString());
		Date operand = null;
		String membership_end = null;
		if(reserve.getResInfoList().get(0).getMembership() != null ) {
			membership_end = reserve.getResInfoList().get(0).getMembership().getMembership_end();
			operand = format.parse(reserve.getRes_date());
		}else {
			operand = format.parse(reserve.getRes_predate());
		}
		
		long minusdays = operand.getTime() - today.getTime();
		int remaindays =  (int) (minusdays / ( 24*60*60*1000));
		
		reserve.setRemain_days(remaindays);
		logger.info("계산된거 {}",remaindays );
		return;
	}
	
	
	
	
}
