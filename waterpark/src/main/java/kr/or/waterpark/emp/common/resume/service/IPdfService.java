package kr.or.waterpark.emp.common.resume.service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.emp.common.resume.vo.ResumeVO;

public interface IPdfService {
	
	ServiceResult createPDF(ResumeVO resume, String BODY, String DEST);

}
