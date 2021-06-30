package kr.or.waterpark.emp.common.loginSuccess;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.emp.common.login.dao.IEmpDAO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import lombok.Data;

/**
 * @author 문선준
 * @since 2021. 5. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용 * --------     --------    ----------------------
 * 2021. 5. 25.    문선준             최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
public class EmpLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	public static Logger logger = LoggerFactory.getLogger(EmpLoginSuccessHandler.class);
	
	@Inject
	private IEmpDAO dao;
	
	private String empDefaultUrl;
	private static int TIME = 60 * 60 * 24; // 하루
	private String emp_id = null;
	
	private RequestCache reqCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {

		request.getSession().invalidate();
		emp_id = auth.getName();
		logger.info("emp_id : {}", emp_id);
		UserVO user = dao.selectEmpForAuth(emp_id);
		logger.info("user : {} " , user);
		EmpVO emp = dao.selectEmpDetail(user.getUser_id());
		emp.setUser_auth(user.getUser_auth());
		logger.info("emp : {} " , emp);
		HttpSession session =  request.getSession();
		session.setAttribute("EmpVO", emp);
		session.setMaxInactiveInterval(TIME);
		clearAuthenticationAttributes(request);

		if (!emp.getUser_auth().equals("US")) {
			String relogin = (String) session.getAttribute("relogin");
			logger.info(relogin);
			if( relogin!=null &&relogin.equals("ok")) {	
				session.removeAttribute("relogin");
				redirectStratgy.sendRedirect(request, response, "/snack");
			}else {				
				String team_name = emp.getTeam_name();
				if(team_name.equals("스낵 팀")||team_name.equals("매표소 팀")) {					
					redirectStratgy.sendRedirect(request, response, "/emp/empPosMain");
				}else {
					redirectStratgy.sendRedirect(request, response, "/emp");	
				}
			}
		} else {
			resultRedirectStrategy(request, response, auth);
		}
		
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		SavedRequest savedRequest = reqCache.getRequest(request, response);
		if (savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStratgy.sendRedirect(request, response, targetUrl);
		} else {
			redirectStratgy.sendRedirect(request, response, empDefaultUrl);
		}
	}
	
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null)
			return;
		session.removeAttribute(emp_id);
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
}
