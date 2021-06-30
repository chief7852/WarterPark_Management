package kr.or.waterpark.emp.common.resume.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.service.IFileService;
import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.login.service.IEmpService;
import kr.or.waterpark.emp.common.resume.service.IPdfService;
import kr.or.waterpark.emp.common.resume.vo.ResumeVO;

@Controller
@RequestMapping("/emp")
public class ResumeController {

	public static Logger logger = LoggerFactory.getLogger(ResumeController.class);

	
	List<Map<String, Object>> teamMaps;
	List<Map<String, Object>> respMaps;
	
	
	@Inject
	IPdfService pdfService;

	@Inject
	private IEmpService empService;

	@Inject
	private IFileService fileService;

	String EMPID = null;

	@Value("#{appInfo['pdfRepository']}")
	private String saveFolderURL;
	private File saveFolder;
	
	@PostConstruct
	public void init() {
		saveFolder = new File(saveFolderURL);
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
		logger.info("saveFolder : {}", saveFolder);
	}
	
	@GetMapping("/resume")
	@ResponseBody
	public Map<String, Object> empResume(@RequestParam("empId") String emp_id) {
		EMPID = emp_id;
		Map<String, Object> resultMap = new HashMap<>();
		FilesVO file = empService.getResume(emp_id);

		if (file != null) {
			resultMap.put("result", ServiceResult.OK);
			resultMap.put("resume", file);
		} else {
			resultMap.put("result", ServiceResult.NOTEXIST);
		}
		return resultMap;
	}

	@PostMapping("/resumeenroll")
	@ResponseBody
	public Map<String,Object> enrollFile(@ModelAttribute("resume") ResumeVO resume) {
		Map<String,Object> resultMap = new HashMap<>();
		logger.info("이거 안되는데? : {} " , resume);
		ServiceResult result = fileService.enrollResume(resume);
		resultMap.put("result",result);
		return resultMap;
	}

	@GetMapping("/write")
	public String writeResume(@ModelAttribute("resume") ResumeVO resume, Model model) {
		logger.info("{}" , EMPID);
		resume.setEmp(empService.findEmpDetails(EMPID));
		logger.info("내가 write 하면서 보낼 정보 : {}" , resume);
		model.addAttribute(resume);
		return "noTiles/resume/resume";
	}

	public static String TARGET = "D:/temp/";

	@PostMapping(value = "/write", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String makeResume(@ModelAttribute("resume") ResumeVO resume, Model model) {
		model.addAttribute("resume", resume);
		String view = null;
		view = "noTiles/resume/resumeForm";
		return view;
	}

	@PostMapping("/makeresume")
	@ResponseBody
	public Map<String,Object> makePdf(@ModelAttribute("resume") ResumeVO resume, Model model) {
		Map<String,Object> resultMap = new HashMap<>();
		Date date = new Date(System.currentTimeMillis());
		logger.info("이상한데 : {}",resume);
		String DEST = String.format("%s/%s_이력서_%s_.pdf", saveFolderURL, resume.getEmp().getEmp_name(),resume.getEmp().getResponse_name());
		logger.info("DEST : {}",DEST);
		logger.info("들어오나");
		String pdfData = makeHtmlForm(resume);
		logger.info("내가 만든 pdfData : {} ", pdfData);
		ServiceResult result = pdfService.createPDF(resume, pdfData, DEST);
		logger.info("pdfResult : {} " , result);
		resultMap.put("result", result);
		return resultMap;
	}

	public String makeHtmlForm(ResumeVO resume) {
		StringBuffer htmlData = new StringBuffer();
		htmlData.append("<!DOCTYPE html>");
		htmlData.append("<html lang='en'>");
		htmlData.append("<head>");
		htmlData.append("<style>\r\n");
		htmlData.append("body {\r\n");
		htmlData.append("	min-width: 1000px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append("table {\r\n");
		htmlData.append("	margin: auto ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".first {\r\n");
		htmlData.append("	margin-top: 50px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append("input {\r\n");
		htmlData.append("	border: none ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".second {\r\n");
		htmlData.append("	margin-bottom: 50px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".buttons {\r\n");
		htmlData.append("	position: fixed ;\r\n");
		htmlData.append("	right: 0 ;\r\n");
		htmlData.append("	margin: auto 20px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".buttons-modal{\r\n");
		htmlData.append("	float:right;\r\n");
		htmlData.append("	padding:\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".inputTag {\r\n");
		htmlData.append("	text-align: center ;\r\n");
		htmlData.append("	width: 100% ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".first-width {\r\n");
		htmlData.append("	width: 180px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".width-50 {\r\n");
		htmlData.append("	width: 50px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".width-70 {\r\n");
		htmlData.append("	width: 70px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".width-85 {\r\n");
		htmlData.append("	width: 85px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".width-100 {\r\n");
		htmlData.append("	width: 100px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".width-200 {\r\n");
		htmlData.append("	width: 200px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".width-790 {\r\n");
		htmlData.append("	width: 790px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".width-1000 {\r\n");
		htmlData.append("	width: 1000px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".height-113 {\r\n");
		htmlData.append("	height: 113px ;\r\n");
		htmlData.append("}\r\n");
		htmlData.append("\r\n");
		htmlData.append(".height-70 {\r\n");
		htmlData.append("	height: 70px ;\r\n");
		htmlData.append(".input-last{\r\n");
		htmlData.append("	width:30px;\r\n");
		htmlData.append("}");
		htmlData.append("}</style>");
		htmlData.append("</head>\r\n");
		htmlData.append("<body>");
		logger.info(" resume : {} ", resume);
		htmlData.append(resume.getPdf_content());
		htmlData.append("</body>");

		return htmlData.toString();
	}
}
