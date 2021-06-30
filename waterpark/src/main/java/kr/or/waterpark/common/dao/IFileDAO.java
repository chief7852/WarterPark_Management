package kr.or.waterpark.common.dao;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.email.vo.EmailVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.common.resume.vo.ResumeVO;

/**
 * @author 문선준
 * @since 2021. 6. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 5.     문선준            최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IFileDAO {

	int insertFiles(EmailVO email);
	
	public FilesVO selectFile(FilesVO file);

	int insertFilesForEmp(EmpVO emp);

	int insertFilesForResume(ResumeVO resume);

}
