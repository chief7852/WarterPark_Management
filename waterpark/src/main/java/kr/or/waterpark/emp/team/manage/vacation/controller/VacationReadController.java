package kr.or.waterpark.emp.team.manage.vacation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VacationReadController {

	@GetMapping("/emp/vacationMain")
	public String CalendarMain() {
		return "emp/main/vacationMain";
	}
	
	
}
