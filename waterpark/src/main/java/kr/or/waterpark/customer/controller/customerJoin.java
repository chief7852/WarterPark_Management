package kr.or.waterpark.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class customerJoin {

	@GetMapping("/customerJoin")
	public String customerJoin() {
		return "customerLogin/customerJoinForm";
	}
	
}
