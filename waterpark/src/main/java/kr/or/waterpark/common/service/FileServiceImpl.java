package kr.or.waterpark.common.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import kr.or.waterpark.common.dao.IEmpFilesDAO;
import kr.or.waterpark.common.dao.IFileDAO;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.email.vo.EmailVO;
import kr.or.waterpark.emp.common.resume.vo.ResumeVO;

@Service
public class FileServiceImpl implements IFileService{

	public static Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);
	
	@Inject
	private WebApplicationContext container;
	private ServletContext application;
	
	@Inject
	private IFileDAO fileDAO;
	
	@Inject
	private IEmpFilesDAO empFileDAO;
	
	@Value("#{appInfo['resumeAttachPath']}")
	private String resumeAttachPath;
	private File saveFolder;
	
	@PostConstruct
	public void init() {
		saveFolder = new File(resumeAttachPath);
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
	}
	
	@Override
	public FilesVO download(FilesVO file) {
		 FilesVO savedFile = fileDAO.selectFile(file);
		 if(savedFile == null)
			 throw new RuntimeException(file.getFile_no()+
					 "에 해당하는 파일이 존재하지 않음");
		return savedFile;
	}

	@Override
	public ServiceResult enrollResume(ResumeVO resume) {
		ServiceResult result = ServiceResult.FAIL;
		logger.info("존재하던 이력서 등록중");
		int cnt = processes(resume);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	private int processes(ResumeVO resume) {
		logger.info("파일 첨부를 위한 email 정보 넘기기  : {} ", resume);
		
		int cnt = 0;
		List<FilesVO> filesList = resume.getFileList();
		logger.info(" fileList resume : {} ",filesList);
		if(filesList!=null && filesList.size()>0) {
			for(FilesVO file : filesList) {
				file.setFile_path(resumeAttachPath);
				file.setFile_biz("CR");
			}
			resume.setFile_biz("CR");
			try {
				logger.info("아아아아 이거 되냐?>");
				cnt += fileDAO.insertFilesForResume(resume);
				logger.info("아아아아 이거 되냐?>저제발 ㅠㅠㅠㅠ");
				logger.info("넣은 갯수 : {}", cnt);
				for(FilesVO attatch : filesList) {
					attatch.saveTo(saveFolder);
				}
				cnt = 0;
				cnt += empFileDAO.insertEmpFilesForResume(resume);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		return cnt;
	}
	
}
