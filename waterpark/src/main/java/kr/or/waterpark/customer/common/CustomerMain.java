package kr.or.waterpark.customer.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerMain {

	@GetMapping("/")
	public String customerMain() {
		return "customer/customerMain";
	}
	
	@GetMapping("/customer/info/customerIntro")
	public String customerIntro() {
		return "/customer/customerIntro/intro";
	}
	
	@GetMapping("/customer/info/openInfo")
	public String openInfo() {
		return "/customer/customerIntro/open";
	}
	
	@GetMapping("/customer/use-info/ticket")
	public String ticketInfo() {
		return "/customer/customerUseInfo/ticket";
	}
	
	@GetMapping("customer/use-info/coin")
	public String coinInfo() {
		return "/customer/customerUseInfo/coin";
	}
	
	@GetMapping("customer/use-info/map")
	public String mapInfo() {
		return "/customer/customerUseInfo/map";
	}
	
	@GetMapping("customer/use-info/map2")
	public String mapInfo2() {
		return "/customer/customerUseInfo/map2";
	}
	
	@GetMapping("customer/use-info/map3")
	public String mapInfo3() {
		return "/customer/customerUseInfo/map3";
	}
	
	@GetMapping("customer/use-info/map4")
	public String mapInfo4() {
		return "/customer/customerUseInfo/map4";
	}
}
