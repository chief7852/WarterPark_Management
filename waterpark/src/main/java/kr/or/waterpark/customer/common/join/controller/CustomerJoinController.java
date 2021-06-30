
package kr.or.waterpark.customer.common.join.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.PhoneAuthUtils;
import kr.or.waterpark.customer.common.join.service.CustomerJoinServiceImpl;
import kr.or.waterpark.customer.common.join.service.ICustomerJoinService;
import kr.or.waterpark.customer.common.join.vo.ClauseVO;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.login.service.IUserService;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @author 문선준
 * @since 2021. 5. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.   문선준              최초작성
 * 2021. 5. 26.   문선준              아이디 체크 작성 
 * 2021. 5. 27.   문선준              문자 인증 구현, 약관 테이블 insert구현중
 * Copyright (c) 2021 by DDIT All right reserved
 *      </pre>
 */
@Controller
@SessionAttributes("agreementList")
@RequestMapping("/customer")
public class CustomerJoinController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerJoinController.class);

	@Inject
	private ICustomerJoinService joinService;

	@Inject
	private IUserService userService;

	@GetMapping("/clause")
	public String getClauseForm(Model model) {
		List<ClauseVO> clauseList = joinService.retrieveClauseList();
		model.addAttribute("clauseList", clauseList);
		return "customer/login/customerClauseForm";
	}

	@PostMapping(value = "/clause", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> checkClauseAgreements(@RequestParam String agreementList, Model model)
			throws ParseException {
		Map<String, Object> result = new HashMap<>();
		JSONParser parser = new JSONParser();
		JSONArray jsonArray = (JSONArray) parser.parse(agreementList);
		List<Map<String, Object>> mapList = new ArrayList<>();
		Map<String, Object> map = null;
		String message = "OK";

		if (jsonArray.size() == 0 || jsonArray.isEmpty() || jsonArray == null) {
			message = "FAIL";
		} else {
			for (int i = 0; i < jsonArray.size(); i++) {
				map = new LinkedHashMap<>();
				JSONObject jsonObject = (JSONObject) jsonArray.get(i);
				long clause_no = (long) jsonObject.get("clause_no");
				String agreement_check = (String) jsonObject.get("agreement_check");
				String clause_require = (String) jsonObject.get("clause_require");
				if (clause_require.equals("Y") && agreement_check.equals("N"))
					message = "FAIL";
				map.put("clause_no", clause_no);
				map.put("agreement_check", agreement_check);
				map.put("clause_require", clause_require);
				mapList.add(map);
			}
		}

		model.addAttribute("agreementList", mapList);
		result.put("result", message);
		return result;
	}

	@GetMapping("/join")
	public String getCustomerJoinForm() {
		return "customer/login/customerJoinForm";
	}

	@PostMapping("/join")
	@Transactional
	public String tryCustomerJoin(@Validated @ModelAttribute("user") UserVO user, BindingResult errors, Model model,
			HttpSession session) {
		String view = null;
		String message = null;
		
		if (!errors.hasErrors()) {
			if (!phoneAuth) {
				view = "customer/login/customerJoinForm";
				message = "휴대폰 미인증";
			} else {
				user.setUser_reg(user.getUser_reg1() + user.getUser_reg2().substring(0,1));
				List<Map<String, Object>> getsession = (List<Map<String, Object>>) session.getAttribute("agreementList");
				ClauseVO clause = null;
				List<ClauseVO> clauseList = new ArrayList<>();
				for (Map<String, Object> map : getsession) {
					clause = new ClauseVO();
					if (map.get("clause_require").equals("N")) {
						map.put("agreement_check", user.getUser_agree());
					}
					clause.setClause_no((long) map.get("clause_no"));
					clause.setAgreement_check((String) (map.get("agreement_check")));
					clauseList.add(clause);
				}
				user.setAgreementList(clauseList);
				ServiceResult result = joinService.createUser(user);
				switch (result) {
				case PKDUPLICATED:
					view = "customer/login/customerJoinForm";
					message = "아이디 중복";
					break;
				case OK:
					view = "redirect:/customer";
					break;
				default:
					message = "서버 오류, 잠시 뒤 다시 시도하세요";
					view = "customer/login/customerJoinForm";
				}
				phoneAuth = false;
			}
		} else {
			// 검증 불통
			view = "customer/login/customerJoinForm";
		}

		model.addAttribute("message", message);
		session.invalidate();
		return view;
	}

	@PostMapping("/idCheck")
	@ResponseBody
	public Map<String, Object> customerIdCheck(@RequestParam("id") String user_id) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			userService.retriveUser(user_id);
			resultMap.put("result", ServiceResult.FAIL);
			logger.info("아이디 : {} " , user_id);
		} catch (Exception e) {
			resultMap.put("result", ServiceResult.OK);
		}
		return resultMap;
	}

	private String authNumber = null;

	@PostMapping("/sendSms")
	@ResponseBody
	public String sendSms(@RequestParam("to") String to, Model model) throws CoolsmsException {
		Map<String, Object> map = PhoneAuthUtils.getPhoneAuthNum(to);
		authNumber = (String) map.get("authNumber");
		logger.info("저장된 authNumber : {}");
		return (String) map.get("result");
	}

	boolean phoneAuth = false;

	@PostMapping("/phoneAuth")
	@ResponseBody
	public Map<String, Object> phoneAuthSucess(@RequestParam("inputNum") String inputNum, HttpServletRequest request) {
		logger.info(" 내가 입력한 값 : {} ", inputNum);
		logger.info(" 내가 입력한 값의 타입은?: {} ", inputNum.getClass().getTypeName());
		Map<String, Object> resultMap = new HashMap<>();
		if (inputNum.equals(authNumber)) {
			phoneAuth = true;
			resultMap.put("result", ServiceResult.OK);
		} else {
			resultMap.put("result", ServiceResult.FAIL);
		}
		return resultMap;
	}
}
