package kr.or.waterpark.emp.common.issue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IssueReadController {

	@GetMapping("/emp/issue")
	public String issueMain() {
	
		return "emp/common/issue/issueMain";
	}
	
}
