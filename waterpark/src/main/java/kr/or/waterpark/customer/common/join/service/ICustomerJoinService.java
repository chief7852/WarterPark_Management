package kr.or.waterpark.customer.common.join.service;

import java.util.List;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.customer.common.join.vo.ClauseVO;
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
 * 2021. 5. 23.    문선준              최초작성
 * 2021. 5. 26.    문선준              회원가입 기능
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface ICustomerJoinService {
	
	/**
	 * 약관 받아오기
	 * @return List<ClauseVO> 존재하지 않을 시, null
	 */
	public List<ClauseVO> retrieveClauseList();

	/**
	 * 고객 아이디 생성하기 
	 * @param user
	 * @return PKDUPLICATED, OK, FAIL
	 */
	public ServiceResult createUser(UserVO user);
}
 