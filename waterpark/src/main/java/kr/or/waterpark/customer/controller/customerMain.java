package kr.or.waterpark.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class customerMain {

	@GetMapping("/customerMain")
	public String customerMain() {
		return "customerMain";
	}
}
