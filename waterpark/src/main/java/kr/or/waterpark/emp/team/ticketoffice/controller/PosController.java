package kr.or.waterpark.emp.team.ticketoffice.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.team.ticketoffice.service.IPosService;
import kr.or.waterpark.emp.team.ticketoffice.vo.PosVO;

/**
 * @author 김도윤
 * @since 2021. 6. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 16.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/emp/pos")
public class PosController {
	
	private static final Logger logger = LoggerFactory.getLogger(PosController.class);
	
	@Inject
	private IPosService service;
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> posStart(
			@ModelAttribute PosVO pos
			, @SessionAttribute("EmpVO") EmpVO emp
			){
		Map<String, Object> resultMap = new HashMap<>();
		pos.setEmp_id(emp.getEmp_id());
		
		String result = "FAIL";
		ServiceResult sresult = service.createPos(pos);
		if(ServiceResult.OK.equals(sresult)) {
			result = "SUCCESS";
		}
		resultMap.put("result", result);
		return resultMap;
	}
	
	@PutMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> posEnd(
			@ModelAttribute PosVO pos
			, @SessionAttribute("EmpVO") EmpVO emp
			){
		Map<String, Object> resultMap = new HashMap<>();
		pos.setEmp_id(emp.getEmp_id());
		pos.setPos_close("Y");
		String result = "FAIL";
		ServiceResult sresult = service.createPos(pos);
		if(ServiceResult.OK.equals(sresult)) {
			result = "SUCCESS";
		}
		resultMap.put("result", result);
		logger.info("result : {}", result);
		return resultMap;
	}

}
