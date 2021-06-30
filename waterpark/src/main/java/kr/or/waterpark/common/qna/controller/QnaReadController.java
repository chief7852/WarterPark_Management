package kr.or.waterpark.common.qna.controller;


import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import kr.or.waterpark.common.qna.service.IQnaService;
import kr.or.waterpark.common.vo.QnaVO;


@Controller
@RequestMapping("/customer/qna")
public class QnaReadController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(QnaReadController.class);
	
	
	// 의존 관계 주입 => BoardServiceImpl 생성
	// IoC 의존 관계
	@Inject
	private IQnaService service;
	
	@Inject
	private WebApplicationContext container;
	private ServletContext application;
	
	@PostConstruct
	public void init() {
		application = container.getServletContext();
	}

	// 게시글 목록
	@GetMapping
	public String qnaList(Model model){
		List<QnaVO> qnaList = service.AllQnaList();
		model.addAttribute("qnaList", qnaList);
		return "customer/qna/qnaList";
	}
	
	// qna 등록
	@PostMapping
	public String qnaInsert(
		@ModelAttribute("qnaVO") QnaVO qnaVO,
		Model model 
			) {
		service.insertQna(qnaVO);
		List<QnaVO> qnaList = service.AllQnaList();
		model.addAttribute("qnaList", qnaList);
		return "customer/qna/qnaList";
		
	}
	
	//@RequestMapping(value="/delete", method = RequestMethod.DELETE)
	@DeleteMapping
	public String qnaDelete(
		@RequestParam("qna_no") int qna_no 
			) {
		logger.info("\n\n delete 진입 \n\n\n");
	    int cnt = service.deleteQna(qna_no);
	   
		return "redirect:/customer/qna";
	}

	
}
