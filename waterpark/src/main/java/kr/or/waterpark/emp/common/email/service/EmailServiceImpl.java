package kr.or.waterpark.emp.common.email.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import kr.or.waterpark.common.dao.IFileDAO;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.email.dao.IEmailDAO;
import kr.or.waterpark.emp.common.email.vo.EmailVO;
import kr.or.waterpark.emp.common.login.dao.IEmpDAO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

/**
 * @author 작성자명
 * @since 2021. 5. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 29.    문선준             최초 작성
 * 2021. 6. 03.    문선준             이메일 전송 구현
 * 2021. 6. 04.    문선준             이메일 섹션 분할, 읽기 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class EmailServiceImpl implements IEmailService{

	private static Logger logger = LoggerFactory.getLogger(EmailServiceImpl.class);
	
	@Inject
	private IEmailDAO emailDAO;
	
	@Inject
	private IEmpDAO empDAO;
	
	@Inject
	private IFileDAO fileDAO;
	
	@Value("#{appInfo.emailAttachPath}")
	private String emailAttachPath;
	private File saveFolder;
//	private String saveFolderPath = null;
	
	@PostConstruct
	public void init() {
		saveFolder = new File(emailAttachPath);
		
		if(!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
		
		logger.info("saveFolder : {}", saveFolder);
	}
	
	@Override
	public int retrieveEmailCount(PagingVO<EmailVO> pagingVO) {
		return emailDAO.selectEmailCount(pagingVO);
	}

	@Override
	public List<EmailVO> retrieveEmailList(PagingVO<EmailVO> pagingVO) {
		return emailDAO.selectEmailList(pagingVO);
	}

	@Override
	public EmailVO retrieveEmail(EmailVO search) {
		logger.info(" 넘어온 데이터 : {} ", search);
		EmailVO email = emailDAO.selectEmail(search);
		return email;
	}

	@Override
	public int updateEmailAsRead(List<Integer> emailList) {
		return emailDAO.updateEmailAsRead(emailList);
	}

	@Override
	public int updateEmailAsDelete(List<Integer> getEmailList) {
		return emailDAO.updateEmailAsDelete(getEmailList);
	}
	
	@Override
	public int updateEmailAsReadForOne(EmailVO email) {
		return emailDAO.updateEmailAsReadForOne(email);
	}

	@Override
	@Transactional
	public ServiceResult sendEmails(EmailVO email) {
		int cnt = emailDAO.insertEmailsToSend(email);
		ServiceResult result = ServiceResult.FAIL;
		if(cnt >0) {
			cnt += processes(email);
			
			cnt = emailDAO.insertEmailsToReceive(email);
			if(cnt>0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}

	@Override
	public ServiceResult deleteOneEmail(int email_no) {
		int cnt = emailDAO.deleteOneEmail(email_no);
		ServiceResult result = ServiceResult.FAIL;
		if(cnt >0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<EmailVO> retrieveSendEmail(EmailVO search) {
		List<EmailVO> emailList = emailDAO.selectSendedEmailList(search);
		logger.info("search : {}", search);
		List<FilesVO> fileList = emailDAO.selectUploadFiles(emailList.get(0));
		emailList.get(0).setFileList(fileList);
		logger.info("emailList : {}", emailList.get(0).getFileList());
		return emailList;
	}

	@Override
	public EmpVO findEmpIdToSendEmailForAuth(String emp_id) {
		return empDAO.selectEmpForAuthWhenSendEmail(emp_id);
	}

	@Override
	public int retrieveUnreadEmailCnt(String emp_id) {
		return emailDAO.selectUnreadEmailsNum(emp_id);
	}

	private int processes(EmailVO email) {
		logger.info("파일 첨부를 위한 email 정보 넘기기  : {} ", email);
		
		int cnt = 0;
		List<FilesVO> filesList = email.getFileList();
		
		if(filesList!=null && filesList.size()>0) {
			logger.info("현재 파일이 존재");
			for(FilesVO file : filesList) {
				logger.info("현재 파일이 존재해서 들어옴");
				file.setFile_path(emailAttachPath);
				logger.info("file path : {} ", file.getFile_path());
				logger.info("file origin: {} ", file.getFile_origin());
				logger.info("file file_type: {} ", file.getFile_type());
			}
			cnt += fileDAO.insertFiles(email);
			
			try {
				for(FilesVO attatch : filesList) {
					attatch.saveTo(saveFolder);
				}
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		return cnt;
	}

	
}
