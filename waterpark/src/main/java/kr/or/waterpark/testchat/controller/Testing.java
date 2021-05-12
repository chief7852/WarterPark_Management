package kr.or.waterpark.testchat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Testing {
	
	@RequestMapping("/test")
	public String testing(
//			@RequestAttribute("content") String test
			) {
		
		return "view_chat";
	}
}
