package kr.or.waterpark.emp.common.email.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.emp.common.email.service.IEmailService;
import kr.or.waterpark.emp.common.email.vo.EmailVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

@Controller
@RequestMapping("/emp")
public class EmailReadController {
	public static Logger logger = LoggerFactory.getLogger(EmailReadController.class);
	@Inject
	private IEmailService emailService;

	@GetMapping("/email")
	public String emailListForHTML(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, @RequestParam(value="minDate", required=false) String minDate
			, @RequestParam(value="maxDate", required=false) String maxDate
			, @RequestParam(value="email_type", required=false, defaultValue="main") StringBuffer email_type
			, HttpSession session
			, Model model){
		model.addAttribute("pageType", "email");
		EmpVO emp = (EmpVO)session.getAttribute("EmpVO");
		String view = null;
		
		PagingVO<EmailVO> pagingVO = new PagingVO<>();
		String changedType = email_type.toString();
		if(changedType.equals("trash")) {
			view = "emp/common/email/emailTrash";
		}else if(changedType.equals("send")){
			view = "emp/common/email/emailSend";
		}else {
			view =  "emp/common/email/emailMain";
		}
		int unReadCnt = emailService.retrieveUnreadEmailCnt(emp.getEmp_id());
		
		pagingVO.setEmail_type(changedType);
		pagingVO = listForAjax(currentPage, emp.getEmp_id(),searchType, searchWord, minDate, maxDate,email_type);
		model.addAttribute("pagingVO",pagingVO);
		model.addAttribute("unReadCnt",unReadCnt);
		return view;
	}
	
	@GetMapping(value = "/email", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<EmailVO> listForAjax(
		@RequestParam(value="page",required=false, defaultValue = "1") int currentPage
		,@RequestParam(value="emp_id", required=true) String emp_id
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		, @RequestParam(value="minDate", required=false) String minDate
		, @RequestParam(value="maxDate", required=false) String maxDate
		, @RequestParam(value="email_type", required=false, defaultValue="main") StringBuffer email_type
		){
		
		PagingVO<EmailVO> pagingVO = new PagingVO<>(9, 5);
		pagingVO.setCurrentPage(currentPage);
		String changedType = email_type.toString();
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("minDate", minDate);
		searchMap.put("maxDate", maxDate);
		pagingVO.setSearchMap(searchMap);
		pagingVO.setEmail_type(changedType);
		pagingVO.setEmp_id(emp_id);
		int totalRecord = emailService.retrieveEmailCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<EmailVO> emailList = emailService.retrieveEmailList(pagingVO);
		pagingVO.setDataList(emailList);
		return pagingVO;
	}
	
	@GetMapping("/emailView")
	public String emailView(
		@RequestParam("what") int email_no
		,@RequestParam(value = "receiver_id", required = false) String receiver_id
		,@ModelAttribute("search") EmailVO search
		,@RequestParam(value = "sender_id", required = false) String sender_id
		,HttpServletRequest requset
		,Model model
		) {
		String view = null;
		search.setEmail_no(email_no);
		search.setReceiver_id(receiver_id);
		search.setSender_id(sender_id);
		logger.info("email : {}", search);
		EmailVO email = emailService.retrieveEmail(search);
		EmpVO emp = (EmpVO)requset.getSession().getAttribute("EmpVO");
		int unReadCnt = emailService.retrieveUnreadEmailCnt(emp.getEmp_id());
		
		if(email.getReceive_date()==null) {
			int isReceived = emailService.updateEmailAsReadForOne(email);
			email = emailService.retrieveEmail(search);
		}
		
		model.addAttribute("email", email);
		model.addAttribute("unReadCnt",unReadCnt);
		view = "emp/common/email/emailView";
		return view;
	}
	
	@GetMapping("/emailView/send")
	public String emailViewForSend(
		@RequestParam("what") int email_no
		,@RequestParam("sender_id") String sender_id
		,@ModelAttribute("search") EmailVO search
		,Model model
		) {
		String view = null;
		search.setEmail_no(email_no);
		search.setSender_id(sender_id);
		List<EmailVO> emailSendList = emailService.retrieveSendEmail(search);
		/*EmailVO email = emailService.retrieveEmail(search);*/
		logger.info("emailSendList값 : {}", emailSendList);
		
		model.addAttribute("emailList", emailSendList);
		view = "emp/common/email/emailView";
		return view;
	}
	
	@PostMapping("/readEmailCheck")
	@ResponseBody
	public Map<String, Object> emailsCheck(
		@RequestParam("emailList[]") List<Integer> emailList,
		@RequestParam(value = "type", required = false) String type){
		
		Map<String, Object> resultMap = new HashMap<>();
		List<Integer> getEmailList = new ArrayList<>();
		
		int cnt = 0;
		for(Integer email_no : emailList) {
			getEmailList.add(email_no);
		}
		
		try {
			if(type.equals("read")) {
				cnt = emailService.updateEmailAsRead(getEmailList);
			}else if(type.equals("delete")) {
				cnt = emailService.updateEmailAsDelete(getEmailList);
			}
			
			if(cnt >=0) {
				resultMap.put("result",ServiceResult.OK);
			}
		} catch (Exception e) {
			resultMap.put("result", ServiceResult.FAIL);
		}
		return resultMap;
	}
	
	
	
	
}
