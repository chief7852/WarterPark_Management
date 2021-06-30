package kr.or.waterpark.customer.common.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.PhoneAuthUtils;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.login.dao.IUserDAO;
import kr.or.waterpark.customer.common.login.service.IUserService;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @author 문선준
 * @since 2021. 5. 29.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.   문선준             최초작성
 * 2021. 5. 29.   문선준           아이디,비밀번호 찾기 구현
 * Copyright (c) 2021 by DDIT All right reserved
 *      </pre>
 */
@Controller
@RequestMapping("/customer")
@SessionAttributes("user_id")
public class CustomerLoginController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerLoginController.class);

	@Inject
	private IUserService userService;

	/*
	 * @Inject private IUserService service;
	 */

	@GetMapping("/login")
	public String customerLoginForm(@ModelAttribute UserVO userVO) {
		return "customer/login/customerLoginForm";
	}

	@GetMapping("/findid")
	public String customerIdFindForm(@ModelAttribute UserVO userVO) {
		logger.info("findid : {}" , "이거 됫냐?");
		return "customer/login/customerIdFindForm";
	}

	boolean isExist = false;
	private String auth_number = null;
	private String user_id = null;

	@PostMapping("/findid")
	@ResponseBody
	public Map<String, Object> sendSmsToFindId(@RequestParam("user_hp") StringBuffer user_hp,
			@RequestParam("user_name") StringBuffer user_name, Model model) throws CoolsmsException {
		Map<String, Object> resultMap = new HashMap<>();
		UserVO savedUser = userService.retrieveJoinUserInfo(new UserVO(user_name.toString(), user_hp.toString()));
		logger.info("{}",savedUser);
		if (savedUser != null) {
			Map<String, Object> map = PhoneAuthUtils.getPhoneAuthNum(savedUser.getUser_hp());
			auth_number = (String) map.get("authNumber");
			isExist = true;
			/*auth_number = "123456";*/
			user_id = savedUser.getUser_id();
			logger.info("저장한 user_id : {}", user_id);
			resultMap.put("result", ServiceResult.OK);
		} else {
			logger.info("null이라서 else안에 들어옴");
			resultMap.put("result", ServiceResult.FAIL);
		}
		return resultMap;
	}

	@PostMapping("/getPhoneNumForAuth")
	@ResponseBody
	public Map<String, Object> getPhoneNumForAuth(@RequestParam("user_num") StringBuffer userNum) {
		Map<String, Object> resultMap = new HashMap<>();
		logger.info("내 인증 번호 : {} ", auth_number);
		logger.info("존재 여부 : {} ", isExist);
		if (!isExist || !userNum.toString().equals(auth_number)) {
			resultMap.put("result", ServiceResult.FAIL);
		} else {
			resultMap.put("result", ServiceResult.OK);
		}
		isExist = false;
		return resultMap;
	}

	@GetMapping("/id")
	public String showIdForUser(Model model) {
		model.addAttribute("user_id", user_id);
		return "noTiles/customer/customerIdShow";
	}

	@GetMapping("/pass")
	public String changePassForUser(Model model) {
		model.addAttribute("user_id", user_id);
		return "customer/login/customerPassChangeForm";
	}

	@GetMapping("/findpass")
	public String customerPassFindForm(Model model) {
		return "customer/login/customerPassFindForm";
	}

	@PostMapping("/findpass")
	@ResponseBody
	public Map<String, Object> sendSmsToFindPass(@RequestParam("user_name") StringBuffer userName,
			@RequestParam("user_hp") StringBuffer userHp, @RequestParam("user_id") StringBuffer userId) {
		Map<String, Object> resultMap = new HashMap<>();
		UserVO savedUser = userService
				.retrieveJoinUserInfo(new UserVO(userName.toString(), userHp.toString(), userId.toString()));
		logger.info("내가+ 불러온 유저 정보 : {}", savedUser);
		if (savedUser != null) {
			isExist = true;
			auth_number = "123456";
			user_id = savedUser.getUser_id();
			resultMap.put("result", ServiceResult.OK);
		} else {
			resultMap.put("result", ServiceResult.FAIL);
		}
		return resultMap;
	}

	@PostMapping("/changeUserPass")
	@ResponseBody
	public Map<String, Object> changeUserPass(@RequestParam("user_id") StringBuffer user_id,
			@RequestParam("user_pass1") StringBuffer user_pass1, @RequestParam("user_pass2") StringBuffer user_pass2) {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", "FAIL");
		if (user_pass1.toString().equals(user_pass2.toString())) {
			logger.info("user_id : {}", user_id);
			logger.info("user_pass1 : {}", user_pass1);
			logger.info("user_pass2 : {}", user_pass2);
			UserVO user = new UserVO();

			user.setUser_id(user_id.toString());
			user.setUser_pass(user_pass1.toString());
			int cnt = userService.changeUserPass(user);
			if (cnt > 0) {
				resultMap.put("result", "OK");
			} else {
				resultMap.put("result", "FAIL");
			}
		}
		return resultMap;
	}
}
