package kr.or.waterpark.emp.common.login.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;

/**
 * @author 문선준
 * @since 2021. 5. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------      --------    ----------------------
 * 2021. 5. 25.    문선준             최초작성
 * 2021. 6. 01.    문선준             이메일 전송시 받는사람 찾기 구현 
 * 2021. 6. 04.    문선준             이메일 전송시 데이터 검증
 * 2021. 6. 09.    문선준             직원 등록 추가 
 * 2021. 6. 11.    문선준             직원 수정 추가 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IEmpDAO {

	/**
	 * PK를 기준으로 한명의 직원 조회(인증용)
	 * @param emp_id
	 * @return 존재하지 않는 경우, null 반환
	 */
	public UserVO selectEmpForAuth(String emp_id);

	/**
	 * 직원 정보 상세 조회
	 * @param emp_id
	 * @return 존재하지 않는 경우, null 반환
	 */
	public EmpVO selectEmpDetail(String emp_id);
	
	/**
	 * 5회 이상 입력 오류시 직원 계정 잠금
	 * @param emp_id
	 */ 
	public int updateEmpForProtect(String emp_id);

	/**
	 * 직원 List 조회 
	 * @param receiver
	 * @return List형의 EmpVO 반환, 존재하지 않을 경우 null 반환
	 */
	public List<EmpVO> selectEmpForEmailSend(String receiver);

	/**
	 * 아이디에 맞는 직원 검색 
	 * @param emp_id
	 * @return
	 */
	public EmpVO selectEmpForAuthWhenSendEmail(String emp_id);

	public List<EmpVO> selectEmpListWithCode(EmpVO emp);

	/**
	 * 직원 등록
	 * @param emp
	 * @return 성공시 cnt > 0 반환
	 */
	public int insertNewEmp(EmpVO emp);

	/**
	 * 직원 정보 수정 
	 * @param emp
	 * @return 성공시 cnt > 0
	 */
	public int updateEmpInfo(EmpVO emp);

	public int fireEmp(EmpVO emp);
	
	public List<FilesVO> selecetAllEmpFiles(EmpVO emp);

	public FilesVO getResumeForOneEmp(String emp);

}
