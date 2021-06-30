package kr.or.waterpark.emp.common.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.or.waterpark.emp.common.login.vo.EmpVO;

@Controller
public class EmpLoginController {

	@GetMapping("/emp/empLogin")
	public String empLoginForm(@ModelAttribute EmpVO empVO) {
		return "emp/common/emplog";
	}
	
	@GetMapping("/snack/relogin")
	public String snackRelogin(HttpSession session) {
		session.setAttribute("relogin", "ok");
		return "emp/common/emplog";
	}
	
	@GetMapping("/emp/empPosMain")
	public String empPosMain() {
		return "emp/common/empLoginMain";
	}
}
