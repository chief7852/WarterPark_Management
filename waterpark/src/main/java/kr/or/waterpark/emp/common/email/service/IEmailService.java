package kr.or.waterpark.emp.common.email.service;

import java.util.List;
import java.util.Map;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.emp.common.email.vo.EmailVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

/**
 * @author 문선준
 * @since 2021. 5. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31.    문선준             최초작성
 * 2021. 6. 01.    문선준             이메일 수신여부 추가 
 * 2021. 6. 03.    문선준             이메일 전송부분 추가 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IEmailService {
	
	/*public List<EmailVO> retrieveEmailList(EmpVO emp);*/
	
	public List<EmailVO> retrieveEmailList(PagingVO<EmailVO> pagingVO);

	public int retrieveEmailCount(PagingVO<EmailVO> pagingVO);

	public EmailVO retrieveEmail(EmailVO search);

	public int updateEmailAsRead(List<Integer> emailList);

	public int updateEmailAsReadForOne(EmailVO email);

	public ServiceResult sendEmails(EmailVO email);

	public ServiceResult deleteOneEmail(int email_no);

	public List<EmailVO> retrieveSendEmail(EmailVO search);

	public EmpVO findEmpIdToSendEmailForAuth(String emp_id);
	
	public int retrieveUnreadEmailCnt(String emp_id);

	public int updateEmailAsDelete(List<Integer> getEmailList);
	
}
