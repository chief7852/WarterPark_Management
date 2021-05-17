package kr.or.waterpark.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class customerLogin {

	@GetMapping(value="/customerLogin")
	public String customerLogin() {
		
		return "customerLogin/customerLoginForm";
	}
	
}
