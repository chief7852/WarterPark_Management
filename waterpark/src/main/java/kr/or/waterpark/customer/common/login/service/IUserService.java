package kr.or.waterpark.customer.common.login.service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.customer.common.join.vo.UserVO;

/**
 * 회원가입(CRUD) 를 위한 Business Logic Layer
 * @author 문선준
 * @since 2021. 5. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26.   문선준             최초작성   
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IUserService {
	
	/**
	 * 회원 정보 상세 조회
	 * @param user_id
	 * @return 존재하지 않으면, custom exception 발생
	 */
	public UserVO retriveUser(String user_id);
	

	/**
	 * 기존 가입 회원 조회 
	 * @param user
	 * @return 존재하지 않으면 오류 발생
	 */
	public UserVO retrieveJoinUserInfo(UserVO user);
	
	/**
	 * 회원 비밀번호 수정
	 * @param user
	 * @return 
	 */
	public int changeUserPass(UserVO user);
}
