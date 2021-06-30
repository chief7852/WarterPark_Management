package kr.or.waterpark.customer.common.login.dao;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.customer.common.join.vo.UserVO;

/**
 * @author 문선준
 * @since 2021. 5. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.   문선준              최초작성
 * 2021. 5. 24.   문선준              아이디 체크 작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IUserDAO {

	/**
	 * PK를 기준으로 한명의 회원 조회(인증용)
	 * @param mem_id
	 * @return 존재하지 않는 경우, null 반환
	 */
	public UserVO selectUserForAuth(String user_id);
	
	/**
	 * 회원 정보 상세 조회
	 * @param user_id
	 * @return 존재하지 않는 경우, null 반환
	 */
	public UserVO selectUserDetail(String user_id);
	
	/**
	 * 5회 이상 입력 오류시 회원  계정 잠금
	 * @param user_id
	 */ 
	public int updateUserForProtect(String user_id);
	
	/**
	 * 신규 등록 
	 * @param user
	 * @return 등록된 row number > 0 성공
	 */
	public int insertUser(UserVO user);
	
	/**
	 * 아이디 찾기 회원 정보 조회
	 * @param user_name
	 * @return 존재하지 않는 경우, null 반환
	 */
	public UserVO selectUserForPhoneAuth(UserVO user);
	
	/**
	 * 사용자 비밀번호 병경
	 * @param user
	 * @return 성공시 rowcnt > 0 
	 */
	public int updateUserForPass(UserVO user);
	
}
