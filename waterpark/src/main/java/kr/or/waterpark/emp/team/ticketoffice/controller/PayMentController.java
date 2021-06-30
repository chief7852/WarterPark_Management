package kr.or.waterpark.emp.team.ticketoffice.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PayMentController {
	private static final Logger logger = LoggerFactory.getLogger(PayMentController.class);
	
	@GetMapping("/ticket/receipt")
	public String receiptPrint(
			Model model,
			@RequestParam("res_code") String res_code,
			@RequestParam("totalPrice") String totalPrice,
			@RequestParam("emp_name") String emp_name,
			@RequestParam("res_qty") String res_qty,
			@RequestParam("write_date") String write_date
			) {
		
		logger.info("\n\n\n{}\n\n\n",res_code);
		Map<String, Object> receiptMap = new HashMap<>();
		receiptMap.put("res_code", res_code);
		receiptMap.put("totalPrice", totalPrice);
		receiptMap.put("emp_name", emp_name);
		receiptMap.put("res_qty", res_qty);
		receiptMap.put("write_date", write_date);
		model.addAttribute("receipt", receiptMap);
		return "emp/team/ticketOffice/receipt";
	}
}
