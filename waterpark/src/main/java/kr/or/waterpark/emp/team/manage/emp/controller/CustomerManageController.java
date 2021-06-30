package kr.or.waterpark.emp.team.manage.emp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.emp.common.email.vo.EmailVO;
import kr.or.waterpark.emp.team.manage.emp.service.ICustomerManageService;
import kr.or.waterpark.emp.team.manage.emp.vo.CustomerUseInfoVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

@Controller
@RequestMapping("/emp")
public class CustomerManageController {

	private static Logger logger = LoggerFactory.getLogger(CustomerManageController.class);
	
	@Inject
	ICustomerManageService customerManageService;
	
	@GetMapping("/customermanage")
	public String customerListForHTML(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, @RequestParam(value="minDate", required=false) String minDate
			, @RequestParam(value="maxDate", required=false) String maxDate
			,Model model) {
		
		PagingVO<UserVO> pagingVO = new PagingVO<>();
		pagingVO = listForAjax(currentPage, searchType, searchWord, minDate, maxDate);
		model.addAttribute("pagingVO", pagingVO);
		return "emp/team/manageTeam/customerManage";
	}
	
	
	@GetMapping(value="/customermanage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<UserVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		, @RequestParam(value="minDate", required=false) String minDate
		, @RequestParam(value="maxDate", required=false) String maxDate
	) {
		logger.info("currentPage : {} ", currentPage);
		PagingVO<UserVO> pagingVO = new PagingVO<>(10,5);
		pagingVO.setCurrentPage(currentPage);
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("minDate", minDate);
		searchMap.put("maxDate", maxDate);
		pagingVO.setSearchMap(searchMap);
		int totalRecord = customerManageService.retrieveUserCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<UserVO> userList = customerManageService.retrieveUserList(pagingVO);
		logger.info("userList : {} " , userList);
		pagingVO.setDataList(userList);
		return pagingVO;

	}
	
	@GetMapping("/customerInfo")
	public String getCustomerDetails  (
		  @RequestParam("what") String user_id,
		  Model model
		){
		String view = null;
		
		List<UserVO> ticketList = customerManageService.retrieveUserDetails(user_id);
		String total = customerManageService.retrieveTotalAmount(user_id);
		List<CustomerUseInfoVO> infoList = customerManageService.retrieveUserInfoList(user_id);
		
		if(ticketList != null) {
			model.addAttribute("ticketList",ticketList);
		}
		if(infoList != null) {
			model.addAttribute("infoList",infoList);
		}
		if(total != null) {
			model.addAttribute("total",total);
		}
		view = "noTiles/customer/customerDetail";
		return view;
	}
	
}
