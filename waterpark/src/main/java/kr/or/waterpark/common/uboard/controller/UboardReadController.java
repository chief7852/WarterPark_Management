package kr.or.waterpark.common.uboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.media.jfxmedia.Media;

import kr.or.waterpark.common.uboard.service.IUboardService;
import kr.or.waterpark.common.vo.UboardVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Controller
@RequestMapping("/customer/use-info")
public class UboardReadController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(UboardReadController.class);

	@Inject
	private IUboardService service;
	
	
	@GetMapping("faq")
	public String faqList(
			Model model
			) {
		List<UboardVO> faqList = service.faqList("FQ");
		model.addAttribute("faqList", faqList);
		
		return "customer/faq/faqList";
		
	}
	
	
	@GetMapping("lost")
	public String lostList(	
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value="searchType", required=false) String searchType,
		@RequestParam(value="searchWord", required=false) String searchWord,
		@RequestParam(value="minDate", required=false) String minDate,
		@RequestParam(value="maxDate", required=false) String maxDate,
		Model model
		) {
		String view = null;
		
		PagingVO<UboardVO> pagingVO = new PagingVO<>();
		
		model.addAttribute("pagingVO", pagingVO);
		
		List<UboardVO> lostList = service.lostList("LO");
		model.addAttribute("lostList", lostList);
		return "customer/lost/lostList";
		
	}
	
	@GetMapping("notice")
	public String noticeList(
		Model model
			) {
		List<UboardVO> noticeList = service.noticeList("NT");
		model.addAttribute("noticeList", noticeList);
		
		return "customer/notice/noticeList";
		
	}
	
	@GetMapping("noticeDetail")
	public String noticeDetail(
		int uboard_no,
		Model model
			) {	
	UboardVO noticeDetail = service.noticeDetail(uboard_no);
	model.addAttribute("noticeDetail", noticeDetail);
		
	return "customer/notice/noticeView";
	
	}
	
	@GetMapping("noticeForm")
	public String noticeForm(
		Model model,
		@SessionAttribute("EmpVO") EmpVO emp
		) {
		
		return "customer/notice/noticeForm";
	}
	
	// notice 등록
	@PostMapping("noticeInsert")
	public String noticeInsert(
		@ModelAttribute("noticeInsert") UboardVO uboardVO,
		Model model
			) {
		
		service.noticeInsert(uboardVO);
		model.addAttribute("noticeInsert", uboardVO);
		List<UboardVO> noticeList = service.noticeList("NT");
		model.addAttribute("noticeList", noticeList);
		return "customer/notice/noticeList";
		
	}
	
	@DeleteMapping("noticeDelete")
	public String noticeDelete(
			@RequestParam("uboard_no") int uboard_no,
			Model model
			) {
		logger.info("\n\n delete 진입 \n\n");
		service.noticeDelete(uboard_no);
		List<UboardVO> noticeList = service.noticeList("NT");
		model.addAttribute("noticeList", noticeList);
		
		return "redirect:notice";
		
	}
	
	@Inject
	private WebApplicationContext container;
	private ServletContext application;
	
	//notice 파일업로드
	@Value("#{appInfo['noticeImages']}")
	private String saveFolderURL;
	private File saveFolder;

	@PostConstruct
	public void init() {
		application = container.getServletContext();
		String saveFolderPath = application.getRealPath(saveFolderURL);
		logger.info("saveFolderPath : {}", saveFolderPath);
		saveFolder = new File(saveFolderPath);
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
		logger.info("saveFolder : {}", saveFolder);
	}
	
	@RequestMapping(value="notice/noticeImage"
		, method=RequestMethod.POST
		, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	
	@ResponseBody
	public Map<String, Object> imageUpload(
		@RequestPart("upload") MultipartFile upload	
		) throws IllegalStateException, IOException{
		Map<String, Object> resultMap = new HashMap<>();
		if(!upload.isEmpty()) {
			String saveName = UUID.randomUUID().toString();
			upload.transferTo(new File(saveFolder, saveName));
			int uploaded = 1;
			String fileName = upload.getOriginalFilename();
			String url = application.getContextPath() + saveFolderURL + "/" + saveName;
			resultMap.put("uploaded", uploaded);
			resultMap.put("fileName", fileName);
			resultMap.put("url", url);
		}
		return resultMap;
	}
		
	
	
	// faq 등록
	@PostMapping("faqInsert")
	public String faqInsert(
		@ModelAttribute("faqInsert") UboardVO uboardVO,
		Model model
		) {
		service.faqInsert(uboardVO);
		model.addAttribute("faqInsert", uboardVO);
		List<UboardVO> faqList = service.faqList("FQ");
		model.addAttribute("faqList", faqList);
		return "customer/faq/faqList";
		
	}
	
/*	@DeleteMapping("faqDelete")
	public String faqDelete(
		@RequestParam("uboard_no") int uboard_no,
		Model model
	) {
		System.out.println("들어오냐??");
		logger.info("\n\n delete 진입 \n\n");
		service.faqDelete(uboard_no);
		List<UboardVO> faqList = service.faqList("FQ");
		model.addAttribute("faqList", faqList);
		
		return "redirect:faq";
	}*/
	
    @RequestMapping(value="faqDelete")
    public ModelAndView faqDelete(
    	@RequestParam("uboard_no") int uboard_no
    	) {
    	{
    }
        ModelAndView mv = new ModelAndView("redirect:faq");
        service.faqDelete(uboard_no);
        return mv;
    }
	
	
	// lost 등록
	@PostMapping("lostInsert")
	public String lostInsert(
		@ModelAttribute("lostInsert") UboardVO uboardVO,
		Model model
		) {
		service.lostInsert(uboardVO);
		model.addAttribute("lostInsert", uboardVO);
		List<UboardVO> lostList = service.lostList("LO");
		model.addAttribute("lostList", lostList);
		return "customer/lost/lostList";
	}
	
    @RequestMapping(value="lostDelete")
    public ModelAndView lostDelete(
    	@RequestParam("uboard_no") int uboard_no
    	) {
    	{
    }
        ModelAndView mv = new ModelAndView("redirect:lost");
        service.lostDelete(uboard_no);
        return mv;
    }
}













