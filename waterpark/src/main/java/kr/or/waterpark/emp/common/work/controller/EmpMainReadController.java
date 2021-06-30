package kr.or.waterpark.emp.common.work.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.common.report.dao.IReportDAO;
import kr.or.waterpark.emp.common.report.service.IReportService;
import kr.or.waterpark.emp.common.report.vo.ReportVO;
import kr.or.waterpark.emp.common.work.service.IWorkService;
import kr.or.waterpark.emp.common.work.vo.WorkVO;

@Controller
public class EmpMainReadController {
	
	Logger logger = LoggerFactory.getLogger(EmpMainReadController.class);
	
	@Inject
	private IWorkService service;
	@Inject
	private IReportService reportservice;
	
	@GetMapping("/emp")
	public String empMain(
			HttpSession session,
			Model model) {
		EmpVO emp= (EmpVO) session.getAttribute("EmpVO");
		List<ReportVO> empNoticeList = reportservice.empNoticeList("NT");
		model.addAttribute("empNoticeList", empNoticeList);
		List<ReportVO> empProdList = reportservice.empPRODList(emp.getEmp_id());
		model.addAttribute("empProdList", empProdList);
		return "emp/empMain";
	}
	
	@GetMapping("/emp/calender")
	@ResponseBody
	public List<Map<String, Object>> empCalender(
			@RequestParam("emp_id")String emp_id
			){
		logger.info("empid : {}",emp_id);
		List<WorkVO> calender = service.selectAllWork(emp_id);
		List<Map<String, Object>> calenders = new ArrayList<Map<String,Object>>(); 
		for(WorkVO workvo : calender) {
			Map<String, Object> nM = new HashMap<>();
			nM.put("_id", workvo.getWork_no());
			nM.put("title", workvo.getWork_title());
			nM.put("description", "Lorem ipsum dolor sit incid idunt ut Lorem ipsum sit.");
			nM.put("start", workvo.getWork_start());
			nM.put("end", workvo.getWork_end());
			nM.put("type", workvo.getLwork_code());
			nM.put("username", workvo.getEmp_name());
			nM.put("backgroundColor", workvo.getWork_back());
			nM.put("textColor", workvo.getWork_text());
			nM.put("allDay", false);
			logger.info(nM.toString());
			calenders.add(nM);
		}
		return calenders;
	}
	
	@PostMapping("/emp/calender")
	@ResponseBody
	public Map<String, Object> alterCalender(
			@RequestBody Map<String, Object> calData
			){
		logger.info(calData.toString());
		WorkVO insert = new WorkVO();
		insert.setEmp_id((String) calData.get("emp_id"));
		insert.setWork_start((String) calData.get("start").toString());
		insert.setWork_end((String) calData.get("end").toString());
		insert.setWork_date((String) calData.get("start").toString().substring(0,10).replace("-",""));
		insert.setWork_back((String) calData.get("backgroundColor"));
		insert.setWork_text((String) calData.get("textColor"));
		
		int result = service.insertWork(insert);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if(result > 0) {
			resultMap.put("message", "OK");
			
		}else {
			resultMap.put("message", "Fail");
		}
		
		return resultMap;
	}
	
	@DeleteMapping("/emp/calender")
	@ResponseBody
	public Map<String, Object> delteCalender(
			@RequestBody Map<String, Object> calData
			){
		int work_id = Integer.parseInt((String) calData.get("work_id"));
		int result = service.deleteWork(work_id);
		Map<String, Object> resultMap = new HashMap<>();
		
		if(result > 0) {
			resultMap.put("message", "OK");
			
		}else {
			resultMap.put("message", "Fail");
		}
		
		return resultMap;
	}
	
	
	
}
