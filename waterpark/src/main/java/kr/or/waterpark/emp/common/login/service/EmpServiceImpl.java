package kr.or.waterpark.emp.common.login.service;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.waterpark.common.dao.IEmpFilesDAO;
import kr.or.waterpark.common.dao.IFileDAO;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.login.dao.IEmpDAO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.team.manage.emp.service.ManageTeamServiceImpl;


@Service
public class EmpServiceImpl implements IEmpService{

	public static Logger logger = LoggerFactory.getLogger(ManageTeamServiceImpl.class);

	@Value("#{appInfo['identificationImages']}")
	private String imageAttachPath;
	private File saveFolderForID;
	
	@PostConstruct
	public void init() {
		saveFolderForID = new File(imageAttachPath);
		if(!saveFolderForID.exists()) {
			saveFolderForID.mkdirs();
		}
		logger.info("saveFolderForID in ManageTeamServiceImpl For Id Images : {}", saveFolderForID);
	}
	
	@Inject
	private IEmpDAO empDAO;
	
	@Inject
	private IFileDAO fileDAO;
	
	@Inject
	private IEmpFilesDAO empFilesDAO;
	
	
	@Override
	public List<EmpVO> retrieveEmpList(String receiver) {
		return empDAO.selectEmpForEmailSend(receiver);
	}

	@Override
	public EmpVO findEmp(String emp_id) {
		return empDAO.selectEmpForAuthWhenSendEmail(emp_id);
	}

	String emp_id = null;
	String lempf_code = null;
	
	@Override
	@Transactional
	public ServiceResult insertEMP(EmpVO emp) {
		ServiceResult result = ServiceResult.FAIL;
		String inputPass = emp.getEmp_pass();
		String encodedPass = null;
		try { 
			encodedPass = CryptoUtil.sha512(inputPass);
			emp.setEmp_pass(encodedPass);
			int cnt = empDAO.insertNewEmp(emp);
			logger.info("cnt : {}" , cnt);
			if(cnt >0) {
				emp_id = emp.getEmp_id();
				logger.info("현제 파일 삽입 전" );
				cnt += processes(emp);
				result = ServiceResult.OK;
				logger.info("파일 삽입 성공}" , cnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public ServiceResult updateEMP(EmpVO emp) {
		ServiceResult result = ServiceResult.FAIL;
		String inputPass = emp.getEmp_pass();
		String encodedPass = null;
		
		try { 
			encodedPass = CryptoUtil.sha512(inputPass);
			emp.setEmp_pass(encodedPass);
			int cnt = empDAO.updateEmpInfo(emp);
			if(cnt >0) {
				logger.info("듶어옴");
				logger.info("emp : {} ",emp);
				cnt += processes(emp);
				result = ServiceResult.OK;
				logger.info("파일 삽입 성공}" , cnt);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return result;
	}


	@Override
	public ServiceResult fireEMP(EmpVO emp) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = empDAO.fireEmp(emp);
		if(cnt >0) {
			result = ServiceResult.OK;
		}
		return result;
	}
	
	private int processes(EmpVO emp) {
		logger.info("파일 첨부를 위한 emp 정보 넘기기  : {} ", emp);
		int cnt = 0;
		List<FilesVO> filesList = emp.getFileList();
		if(filesList!=null && filesList.size()>0) {
			for(FilesVO file : filesList) {
				file.setFile_path(imageAttachPath);
				file.setFile_biz("ID");
			}
			emp.setFile_biz("ID");;
			logger.info("emp 의 Lemp : {} ", emp.getLempf_code());
			logger.info("filesList : {}" , filesList);
			try {
				cnt += fileDAO.insertFilesForEmp(emp);
				for(FilesVO attatch : filesList) {
					attatch.saveTo(saveFolderForID);
				}
				cnt  = 0;
				cnt += empFilesDAO.insertEmpFiles(emp);
			} catch (IOException e) {
				cnt = 0;
				throw new RuntimeException(e);
			}
		}
		return cnt;
	}

	@Override
	public FilesVO getResume(String emp_id) {
		return empDAO.getResumeForOneEmp(emp_id);
	}

	
	@Override
	public EmpVO findEmpDetails(String emp_id) {
		return empDAO.selectEmpDetail(emp_id);
	}


}





