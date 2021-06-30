package kr.or.waterpark.emp.common.email.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.emp.common.alarm.service.IAlarmService;
import kr.or.waterpark.emp.common.alarm.vo.AlarmVO;
import kr.or.waterpark.emp.common.email.service.IEmailService;
import kr.or.waterpark.emp.common.email.vo.EmailVO;
import kr.or.waterpark.emp.common.login.service.IEmpService;
import kr.or.waterpark.emp.common.login.vo.EmpVO;

@Controller
@RequestMapping("/emp")
public class EmailSendController {

	public static Logger logger = LoggerFactory.getLogger(EmailSendController.class);

	@Inject
	private WebApplicationContext container;
	private ServletContext application;
	
	@Value("#{appInfo['emailImages']}")
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
	}

	@Inject
	private IEmailService emailService;

	@Inject
	private IEmpService empService;
	
	@Inject
	private IAlarmService alarmservice;
	

	@GetMapping("/sendEmail")
	public String sendEmailForm(@ModelAttribute("email") EmailVO email,
			@RequestParam(value = "sender_id", required = false) String sender_id,
			@RequestParam(value = "email_no", required = false) Integer email_no, Model model) {
		EmailVO emailForm = new EmailVO();
		String spliter = "<p>-----------------------------------------------"
				+ "---------------------------------------------</p><br>";

		if (email_no != null || sender_id != null) {
			emailForm.setEmail_no(email_no);
			emailForm.setReceiver_id(sender_id);

			emailForm = emailService.retrieveEmail(emailForm);
			emailForm.setEmail_title("re:" + emailForm.getEmail_title());
			emailForm.setEmail_cont(emailForm.getEmail_cont() + spliter);
		}

		model.addAttribute("email", emailForm);
		return "emp/common/email/emailSendForm";
	}

	@PostMapping("/sendEmail")
	@ResponseBody
	public Map<String, Object> sendEmail(
			@ModelAttribute("email") EmailVO email
			, Errors errors) {
		Map<String,Object> resultMap = new HashMap<>(); 
		boolean valid = !errors.hasErrors();
		String view = null;
		String message = null;
		ServiceResult result = null;
		
		if(email.getEmail_id_list()==null) {
			valid = false;
		}
		
		if (valid) {
			for (String emp_id : email.getEmail_id_list()) {
				EmpVO savedEmp = emailService.findEmpIdToSendEmailForAuth(emp_id);
				if (savedEmp == null) {
					message = "존재하지 않는 직원이 있습니다.";
					valid = false;
					break;
				}
			}
			
			result = emailService.sendEmails(email);
			if (ServiceResult.OK.equals(result)) {
				for(String emp_id : email.getEmail_id_list()) {
					AlarmVO alarm = new AlarmVO();
					alarm.setEmp_id(emp_id);
					String content = "쪽지";
					alarm.setAlarm_cont(content);
					alarmservice.alarmCreate(alarm);
				}
				view = "emp/email";
			} else {
				message = "서버 오류";
			}
		} else {
			message = "정보가 누락됐습니다.";
		}
		
		resultMap.put("view", view);
		resultMap.put("message", message);
		resultMap.put("result",result);
		return resultMap;
	}

	@PostMapping("/findEmp")
	@ResponseBody
	public Map<String, Object> findEmpToSendEmail(@RequestParam("receiver") String receiver) {

		Map<String, Object> resultMap = new HashMap<>();
		List<EmpVO> empList = new ArrayList<>();

		if (receiver != null) {
			empList = empService.retrieveEmpList(receiver);
			if (empList != null) {
				resultMap.put("empList", empList);
				resultMap.put("result", ServiceResult.OK);
			}
		} else {
			resultMap.put("result", ServiceResult.FAIL);
		}
		return resultMap;
	}

	@PostMapping(value = "emailImages", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> imageUpload(@RequestParam("upload") MultipartFile upload)
			throws IllegalStateException, IOException {
		Map<String, Object> resultMap = new HashMap<>();
		if (!upload.isEmpty()) {
			String saveName = UUID.randomUUID().toString();
			try {
				upload.transferTo(new File(saveFolder, saveName));
				int uploaded = 1;
				String fileName = upload.getOriginalFilename();
				String url = application.getContextPath() + saveFolderURL + "/" + saveName;
				resultMap.put("uploaded", uploaded);
				resultMap.put("fileName", fileName);
				resultMap.put("url", url);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return resultMap;
	}

	
	@DeleteMapping("/emailView")
	public String emailDelete(@RequestParam("email_no") int email_no, Model model) {
		String view = null;
		ServiceResult result = emailService.deleteOneEmail(email_no);

		if (ServiceResult.OK.equals(result)) {
			view = "redirect:/emp/email";
		} else {
			view = "/emp/common/email/emailView";
		}
		return view;
	}


}
