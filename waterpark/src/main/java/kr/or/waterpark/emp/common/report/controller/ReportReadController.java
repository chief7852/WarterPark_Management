package kr.or.waterpark.emp.common.report.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.common.report.service.IReportService;
import kr.or.waterpark.emp.common.report.vo.ReportVO;

@Controller
public class ReportReadController {
	
	private static final Logger logger =
		LoggerFactory.getLogger(ReportReadController.class);
	
	@Inject
	private IReportService service;
	
	@GetMapping("/emp/notice")
	public String empNoticeList(
		Model model	
		) {
		List<ReportVO> empNoticeList = service.empNoticeList("NT");
		model.addAttribute("empNoticeList", empNoticeList);
		
		return "emp/common/notice/noticeList";
	}
	
	@GetMapping("/emp/notice/noticeDetail")
	public String empNoticeDetail(
		int report_no,
		Model model
		) {
		ReportVO empNoticeDetail = service.empNoticeDetail(report_no);
		model.addAttribute("empNoticeDetail", empNoticeDetail);
		
		return "emp/common/notice/noticeDetail";
	}
	
	@GetMapping("/emp/notice/noticeForm")
	public String empNoticeForm(
//		@ModelAttribute("empNoticeInsert") ReportVO reportVO,
		Model model,
		@SessionAttribute("EmpVO") EmpVO emp
		) {
//		reportVO.setEmp_id(emp.getEmp_id());
//		service.empNoticeInsert(reportVO);
//		model.addAttribute("empNoticeList", reportVO);
//		List<ReportVO> empNoticeList = service.empNoticeList("NT");
//		model.addAttribute("empNoticeList", empNoticeList);
		return "emp/common/notice/noticeForm";
	}
	
	
	@PostMapping("/emp/notice/noticeInsert")
	public String empNoticeForm(
			@ModelAttribute("empNoticeInsert") ReportVO reportVO,
			Model model,
			@SessionAttribute("EmpVO") EmpVO emp
			) {
			reportVO.setEmp_id(emp.getEmp_id());
			service.empNoticeInsert(reportVO);
			model.addAttribute("empNoticeList", reportVO);
			List<ReportVO> empNoticeList = service.empNoticeList("NT");
			model.addAttribute("empNoticeList", empNoticeList);
			return "redirect:/emp/notice";
		}
	@PostMapping("/emp/reportProd")
	public String empProdForm(
			@ModelAttribute("empNoticeInsert") ReportVO reportVO,
			Model model,
			@SessionAttribute("EmpVO") EmpVO emp
			) {
			reportVO.setEmp_id(emp.getEmp_id());
			service.empNoticeInsert(reportVO);

			return "redirect:/emp";
		}
	

	
/*	@DeleteMapping("/emp/notice/noticeDelete")
	public String empNoticeDelete(
		@RequestParam("report_no") int report_no,
		Model model
		) {
		logger.info("\n\n delete 진입 \n\n");
		service.empNoticeDelete(report_no);
		List<ReportVO> empNoticeList = service.empNoticeList("NT");
		model.addAttribute("empNoticeList", empNoticeList);
		
		return "redirect:/emp/notice";
	}*/
	
    @RequestMapping(value="/emp/notice/noticeDelete")
    public ModelAndView noticeDelete(
    	@RequestParam("report_no") int report_no
    	) {
    	{
    }
        ModelAndView mv = new ModelAndView("redirect:/emp/notice");
        service.empNoticeDelete(report_no);
        return mv;
    }

}
