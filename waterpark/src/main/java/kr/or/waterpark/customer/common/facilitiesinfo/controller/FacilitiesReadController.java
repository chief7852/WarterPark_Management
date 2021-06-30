package kr.or.waterpark.customer.common.facilitiesinfo.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.waterpark.customer.common.facilitiesinfo.service.IFacilitiesService;
import kr.or.waterpark.customer.common.facilitiesinfo.vo.FacAttViewVO;

/**
 * @author 김도윤
 * @since 2021. 5. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 22.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("customer/info")
public class FacilitiesReadController {

	@Inject
	private IFacilitiesService service;
	
	private static final Logger logger = LoggerFactory.getLogger(FacilitiesReadController.class);
	
	@GetMapping("facilities")
	public String facilitiesList(
			Model model
			) {
		List<FacAttViewVO> attractionList =  service.retrieveAttractionList();
		model.addAttribute("attractionList", attractionList);
		return "customer/customerIntro/facilityList";
	}
	
	@GetMapping("facility")
	public String facility(
			@RequestParam String what
			, Model model
			) {
		logger.info("what" + what);
		FacAttViewVO attraction = service.retrieveAttraction(what);
		model.addAttribute("attraction", attraction);
		return "customer/customerIntro/facilityView";
	}
}
