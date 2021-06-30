package kr.or.waterpark.emp.team.snack.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.waterpark.emp.team.snack.service.ICoinService;

@Controller
@RequestMapping("/snack/sales")
public class SalesController {
	
	private static final Logger logger = LoggerFactory.getLogger(SalesController.class);
	
	@Inject
	private ICoinService service;
	
	@GetMapping
	@ResponseBody
	public Map<String, Object> SalesMain() {
		
		List<Map<String,Object>> result = service.daySales();
		logger.info(result.toString());
		Map<String, Object> obresult = new HashMap<String, Object>();
		obresult.put("result", result);
		return obresult;
	}
}
