package kr.or.waterpark.common.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.waterpark.common.service.IFileService;
import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.email.controller.EmailReadController;

@Controller
public class FileController {

public static Logger logger = LoggerFactory.getLogger(EmailReadController.class);
	
	@Inject
	private IFileService fileService;
	 
	@GetMapping("/download")
	public String download(
		@RequestParam("what") int file_no,
		@RequestParam("order") int file_ord,
		Model model
		) {
		
		FilesVO file = fileService.download(new FilesVO(file_no, file_ord));
		model.addAttribute("file",file);
	
		return "downloadView";
	}
	
}
