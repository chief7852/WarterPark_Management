package kr.or.waterpark.common.service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.resume.vo.ResumeVO;

public interface IFileService {

	FilesVO download(FilesVO file);
	
	public ServiceResult enrollResume(ResumeVO resume);
	
}
