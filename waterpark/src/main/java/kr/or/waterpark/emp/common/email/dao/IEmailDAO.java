package kr.or.waterpark.emp.common.email.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.email.vo.EmailVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

@Repository
public interface IEmailDAO {

	public List<EmailVO> selectEmailList(PagingVO<EmailVO> pagingVO);

	public int selectEmailCount(PagingVO<EmailVO> pagingVO);

	public EmailVO selectEmail(EmailVO search);

	public int updateEmailAsRead(List<Integer> emailList);
	
	public int updateEmailAsReadForOne(EmailVO email);

	public int insertEmailsToSend(EmailVO email);

	public int insertEmailsToReceive(EmailVO email);

	public int deleteOneEmail(int email_no);

	public List<EmailVO> selectSendedEmailList(EmailVO search);
	
	public int selectUnreadEmailsNum(String emp_id);

	public List<FilesVO> selectUploadFiles(EmailVO email);

	public int updateEmailAsDelete(List<Integer> getEmailList);
	
}
