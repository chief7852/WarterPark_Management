package kr.or.waterpark.emp.team.snack.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.waterpark.emp.team.snack.service.IProdSerivce;
import kr.or.waterpark.emp.team.snack.service.ProdServiceImpl;
import kr.or.waterpark.emp.team.snack.vo.ProdVO;

/**
 * @author 작성자명
 * @since 2021. 5. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * 2021. 5. 28.      정이삭       상품정리
 * --------     --------    ----------------------
 * 2021. 5. 24.      정이삭       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/snack")
public class SnackReadController {
	
	Logger logger = LoggerFactory.getLogger(SnackReadController.class);
	
	@Inject
	private IProdSerivce service;
	
	//상품목록 불러오기
	@GetMapping()
	public String snackMain(
			Model model,
			HttpSession session
			) {
		String test = (String) session.getAttribute("test");
		if(test != null) {
			return "emp/team/snack/closing";
			
		}
		List<ProdVO> prodList = service.retrieveProdList();
		
		model.addAttribute("prodList",prodList);
		return "emp/team/snack/snackMain";
	}
	
	//카테고리별 정리
	@GetMapping("/category")
	@ResponseBody
	public List<ProdVO> prodCategory(
		@RequestParam("lprod_id")String lprod_id
		){
		if(lprod_id.equals("ALL")||lprod_id.equals("goFS")) {
			lprod_id=null;
		}
		List<ProdVO> prodList = service.retrieveProdList(lprod_id);
		
		return prodList;
		
	}
	
	@PostMapping
	@ResponseBody
	public List<ProdVO> prodDetail(
			@RequestParam("menuName")String menuName
		){
		List<ProdVO> result = service.oneProdList(menuName);
		logger.info(menuName);
		return result;
	}
	
	// 보류
	@PostMapping("/saveCart")
	@ResponseBody
	public Map<String, Object> saveCart(
		@RequestParam(value="savecart",required=true)String saveCart,
		@RequestParam(value="total",required=true)int total
		,HttpSession session
		) {
		logger.info(saveCart + "\n\t토탈" + total);
		saveCart.trim();
		String savedCart = (String) session.getAttribute("savecart");

		Map<String, Object> result = new HashMap<>();
//		saveCart 체크(ajax로 받아오는 보류할 카트가 빈값인지 아닌지 체크)
		if(!StringUtils.isBlank(saveCart)&&StringUtils.isBlank(savedCart)) {
			session.setAttribute("savecart",saveCart);
			session.setAttribute("totaled",total);
			result.put("result","저장됨");
			return result;
		}else if(!StringUtils.isBlank(savedCart)){
			int totaled = (Integer) session.getAttribute("totaled");
			result.put("saved",savedCart);
			result.put("totaled",totaled);
			session.removeAttribute("savecart");
			session.removeAttribute("totaled");
			return result;
		}else {
			result.put("result", "실패");
			return result;
		}
	}
	
	@GetMapping("/close")
	public String closeSnack(
			RedirectAttributes attributes,
			HttpSession session
			) {
		attributes.addAttribute("closing", "closing");
		session.setAttribute("test", "test");
		return "redirect:/snack";
	}
	
}
