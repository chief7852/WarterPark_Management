package kr.or.waterpark.emp.team.manage.emp.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.common.report.service.IReportService;
import kr.or.waterpark.emp.common.report.vo.ReportVO;
import kr.or.waterpark.emp.team.manage.emp.service.IBudgetService;

@Controller
@RequestMapping("/emp")
public class BudgetController {

	@Inject
	private IReportService reportservice;
	//이용권 수익,
	@Inject
	private IBudgetService service;
	@GetMapping("/budget")
	public String budgetMainPage(
			HttpSession session,
			Model model
			) {
		EmpVO emp= (EmpVO) session.getAttribute("EmpVO");
		String ticketmoney = service.tickettingMoney();
		String visitorAll = service.reservevisitorToday();
		String prodAlltoday = service.prodToday();
		String usevisitortoday = service.usevisitorToday();
		Map<String, Object> visitorMonth = service.visitorMonth();
		String todayMoneyPR = service.todayMoneyPR();
		String todayMoneyfood = service.todayMoneyfood();
		List<ReportVO> empProdList = reportservice.empPRODList(emp.getEmp_id());
		model.addAttribute("empProdList", empProdList);
		model.addAttribute("ticketAllMoney",ticketmoney);
		model.addAttribute("visitorAll",visitorAll);
		model.addAttribute("prodAlltoday",prodAlltoday);
		model.addAttribute("usevisitortoday",usevisitortoday);
		model.addAttribute("visitorMonth",visitorMonth);
		model.addAttribute("todayMoneyPR",todayMoneyPR);
		model.addAttribute("todayMoneyfood",todayMoneyfood);
		return "emp/team/manageTeam/budgetMain";
	}
	
}
