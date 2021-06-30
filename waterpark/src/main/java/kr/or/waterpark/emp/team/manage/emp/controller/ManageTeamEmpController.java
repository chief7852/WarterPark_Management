package kr.or.waterpark.emp.team.manage.emp.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.waterpark.common.dao.IComCodeDAO;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.customer.common.facilitiesinfo.dao.IFacilitiesDAO;
import kr.or.waterpark.customer.common.facilitiesinfo.vo.FacAttViewVO;
import kr.or.waterpark.emp.common.login.dao.IEmpDAO;
import kr.or.waterpark.emp.common.login.service.IEmpService;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.common.report.dao.IReportDAO;
import kr.or.waterpark.emp.common.report.vo.ReportVO;
import kr.or.waterpark.emp.team.manage.emp.service.IManageTeamService;

@Controller
@RequestMapping("/emp")
public class ManageTeamEmpController {

	private static Logger logger = LoggerFactory.getLogger(ManageTeamEmpController.class);
	@Inject
	private IManageTeamService manageTeamService;

	@Inject
	private IComCodeDAO comCodeDAO;

	@Inject
	private IEmpDAO empDAO;

	@Inject 
	private IFacilitiesDAO facilitiesDAO;
	
	@Inject
	private IReportDAO reportDAO;
	
	@Inject 
	private IEmpService empService;
	
	List<Map<String, Object>> teamMaps;
	List<Map<String, Object>> respMaps;

	@GetMapping("/manageteam")
	public String empManage(Model model,
			@ModelAttribute("emp") EmpVO emp,
			HttpSession session ,
			RedirectAttributes attributes
			) {
		
		EmpVO savedEMP = (EmpVO) session.getAttribute("EmpVO");
		String view = null;
		if("MN".equals(savedEMP.getUser_auth())) {
			 List<EmpVO> empList = manageTeamService.retrieveEmpList();
			 teamMaps = comCodeDAO.selectComCodeList("TM");
			 respMaps = comCodeDAO.selectComCodeList("RE");
			 model.addAttribute("empList", empList);
			 model.addAttribute("teamMaps", teamMaps);
			 model.addAttribute("respMaps", respMaps);
			 view = "emp/team/manageTeam/manageTeamMain";
		}else {
			attributes.addFlashAttribute("message", "권한이 없습니다");
			view = "redirect:/emp";
		}
		
		return view;
	}

	@PostMapping(value = "/manageteam", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String,Object> entrollEmp(
			@ModelAttribute("emp") EmpVO emp
			) {
		Map<String,Object> resultMap = new HashMap<>();
		emp.setFile_biz("ID");
		ServiceResult result = empService.insertEMP(emp);
		if(ServiceResult.OK.equals(result)) {
			resultMap.put("result",ServiceResult.OK);
		}else {
			
			resultMap.put("result",ServiceResult.FAIL);
		}
		return resultMap;
	}
	
	@PutMapping(value = "/manageteam", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String,Object> updateEmp(
			Model model,
			@Validated @ModelAttribute("emp") EmpVO emp,
			BindingResult errors
			) {
		Map<String,Object> resultMap = new HashMap<>();
		emp.setFile_biz("ID");
		if(!errors.hasErrors()) {
			ServiceResult result = empService.updateEMP(emp);
			if(ServiceResult.OK.equals(result)) {
				resultMap.put("result",ServiceResult.OK);
			}else {
				resultMap.put("result",ServiceResult.FAIL);
			}
		}else {
			resultMap.put("result",ServiceResult.NOTEXIST);
		}
		return resultMap;
	}
	
	@DeleteMapping(value = "/manageteam", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String,Object> deleteEmp(
			@RequestParam("emp_id") String emp_id,
			@RequestParam("emp_fire") String emp_fire
		) {
		Map<String,Object> resultMap = new HashMap<>();
		EmpVO emp = new EmpVO();
		emp.setEmp_id(emp_id);
		emp.setEmp_fire(emp_fire);
		
		ServiceResult result = empService.fireEMP(emp);
		if(ServiceResult.OK.equals(result)) {
			resultMap.put("result",ServiceResult.OK);
		}else {
			resultMap.put("result",ServiceResult.FAIL);
		}
		return resultMap;
	}
	
	
	@GetMapping("/search")
	@ResponseBody
	public Map<String, Object> selctPositionsList(
			@RequestParam(value = "teamCode", required = false) String teamCode,
			@RequestParam(value = "responseCode", required = false) String responseCode,
			@RequestParam(value = "isWorking", required = false) String isWorking,
			@RequestParam(value = "textSearch", required = false) String textSearch
			) {
		Map<String, Object> resultMap = new HashMap<>();

		EmpVO emp = new EmpVO();
		emp.setTeam_code(teamCode);
		emp.setResponse_code(responseCode);
		emp.setTextSearch(textSearch);
		if(textSearch.isEmpty()) {
			emp.setTextSearch(null);
		}
		logger.info("textSearch : {}",textSearch);
		if(isWorking !=null) {
			emp.setEmp_fire(isWorking);
		}
		
		List<EmpVO> empList = empDAO.selectEmpListWithCode(emp);
		logger.info("내가받아온 empList : {}", empList);
		if (empList != null) {
			resultMap.put("empList", empList);
		}

		return resultMap;
	}

	@GetMapping("/findEmp")
	@ResponseBody
	public Map<String, Object> findEmpInfo(@RequestParam("empId") String empId) {
		Map<String, Object> resultMap = new HashMap<>();
		EmpVO empDetail = empDAO.selectEmpDetail(empId);
		empDetail.setFileList(manageTeamService.retrieveEmpFileList(empId));
		FilesVO imageFile = new FilesVO();
		empDetail.setReportList(manageTeamService.retrieveEmpReportList(empId));
		empDetail.setLisenceList(manageTeamService.retrieveEmpLisenceList(empId));
		logger.info("라이센스 추력 : {} ", empDetail.getLisenceList());
		resultMap.put("empDetail", empDetail);
		return resultMap;
	}

	@GetMapping("/clickBtn")
	@ResponseBody
	public Map<String, Object> clickBtnInfo(
			@RequestParam("btnInfo") String btnInfo,
			@RequestParam(value = "empId",required=false) String empId
			) {
		Map<String, Object> resultMap = new HashMap<>();
		List<FacAttViewVO> facilityList = null;
		
		if (btnInfo == null) {
			return resultMap;
		}
 
		if ("create".equals(btnInfo)) {
			facilityList = facilitiesDAO.selectAttractionList();
			resultMap.put("facilityList", facilityList);
			resultMap.put("result", "create");
		} else if ("update".equals(btnInfo)) {
			EmpVO emp = empDAO.selectEmpDetail(empId);
			facilityList = facilitiesDAO.selectAttractionList();
			resultMap.put("result", "update");
			resultMap.put("facilityList", facilityList);
			resultMap.put("emp",emp);
		} else if ("fire".equals(btnInfo)) {
			resultMap.put("result", "fire");
		} else if ("delete".equals(btnInfo)) {
			resultMap.put("result", "delete");
		} else if ("excel".equals(btnInfo)) {
			resultMap.put("result", "excel");
		} else if ("pdf".equals(btnInfo)) {
			resultMap.put("result", "pdf");
		} else if ("back".equals(btnInfo)) {
			resultMap.put("result", "back");
		}else if ("back".equals(btnInfo)) {
			resultMap.put("result", "check");
		}
		return resultMap;
	}
	
}
