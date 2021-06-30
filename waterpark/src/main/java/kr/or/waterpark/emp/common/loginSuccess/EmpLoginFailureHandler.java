package kr.or.waterpark.emp.common.loginSuccess;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.login.dao.IUserDAO;
import kr.or.waterpark.emp.common.login.dao.IEmpDAO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import lombok.Data;

/**
 * @author 문선준
 * @since 2021. 5. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25.    문선준              최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 *      </pre>
 */
@Data
public class EmpLoginFailureHandler implements AuthenticationFailureHandler {

	private static Logger logger = LoggerFactory.getLogger(EmpLoginFailureHandler.class);

	@Inject
	private IEmpDAO dao;

	private int count = 0;
	private String empDefaultFailureUrl = "/emp/empLogin";

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String emp_id = request.getParameter("user_id");
		String emp_pass = request.getParameter("user_pass");
		
		String errorMsg = null;
		String isProtected = null;
		
		Map<String, Object> idFailCntEmp = new HashMap<>();
		EmpVO emp = dao.selectEmpDetail(emp_id);
		
		if(count == 0) {
			request.getSession().invalidate();
		}
		
		if (emp == null) {
			errorMsg = "존재하지 않는 아이디입니다.";
		} else {
			isProtected = emp.getEmp_protect();
			if (isProtected == null || isProtected.equals("N")) {
				idFailCntEmp.put("user_id", emp_id);
				idFailCntEmp.put("user_id_cnt", ++count);
				errorMsg = "입력한 정보가 올바르지 않습니다. 다시 입력해주세요";
				if (count >= 5) {
					errorMsg = "5회 이상 로그인 실패로 계정이 잠깁니다.";
					int cnt = dao.updateEmpForProtect(emp_id);
					count = 0;
				}
			} else {
				errorMsg = "5회 로그인 오류로 인해 계정이 잠겨있습니다. 고객센터에 문의하거나 비밀번호 찾기를 진행하세요";
			}
		}
		idFailCntEmp.put("errorMsg", errorMsg);
		request.getSession().setAttribute("idFailCntEmp", idFailCntEmp);
		response.sendRedirect(empDefaultFailureUrl);
	}
}
