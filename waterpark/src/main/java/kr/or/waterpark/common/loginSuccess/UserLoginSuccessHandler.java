package kr.or.waterpark.common.loginSuccess;

import java.io.IOException;
import java.util.Enumeration;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Service;

import kr.or.waterpark.customer.common.join.vo.UserDetails;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.login.dao.IUserDAO;
import kr.or.waterpark.customer.common.login.service.AuthenticateServiceImpl;
import lombok.Data;

/**
 * @author 문선준
 * @since 2021. 5. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.      작성자명       최초작성
 * 참고 : https://bloodfinger.tistory.com/30
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {

	public static Logger logger = LoggerFactory.getLogger(UserLoginSuccessHandler.class);
	
	@Inject
	private IUserDAO dao; 
	
	private String defaultUrl;
	private static int TIME = 60 * 60 * 24; //하루
	private String user_id = null;
	
	private RequestCache reqCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {

		user_id = auth.getName();
		UserVO user = dao.selectUserForAuth(user_id);
		String getCookieData = (String) request.getParameter("idRemember");
		logger.info("cookie 여부 : {}", getCookieData);
		Cookie cookie = new Cookie("savedUserId", user.getUser_id());
		if(getCookieData != null && "on".equals(getCookieData)) {
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
		}{
			cookie.setMaxAge(0);
		}
		
		HttpSession session =  request.getSession();
		session.setAttribute("UserVO", user);
		session.setMaxInactiveInterval(TIME);
		
		clearAuthenticationAttributes(request);

		if (user.getUser_auth().equals("US")) {
			redirectStratgy.sendRedirect(request, response, "/");
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
			redirectStratgy.sendRedirect(request, response, defaultUrl);
		}
	}
	
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null)
			return;
		session.removeAttribute(user_id);
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
 
}