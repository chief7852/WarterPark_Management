package kr.or.waterpark.emp.common.login.service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.emp.common.login.vo.EmpVO;

/**
 * @author 문선준
 * @since 2021. 5. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25.    문선준      최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IEmpAuthenticationService {
	public ServiceResult authenticate(EmpVO emp);
}
