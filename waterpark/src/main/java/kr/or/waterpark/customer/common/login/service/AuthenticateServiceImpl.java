package kr.or.waterpark.customer.common.login.service;

import java.lang.reflect.InvocationTargetException;

import javax.inject.Inject;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.config.annotation.authentication.configurers.provisioning.UserDetailsManagerConfigurer.UserDetailsBuilder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.customer.common.join.vo.UserDetails;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.login.dao.IUserDAO;

/**
 * @author 문선준
 * @since 2021. 5. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.   작성자명   MSG    최초작성 - 오늘
 *   
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service("authService")
public class AuthenticateServiceImpl implements IAuthenticateService, UserDetailsService {
	private static final Logger logger =
			LoggerFactory.getLogger(AuthenticateServiceImpl.class);
	@Inject
	private IUserDAO dao;
	
//	security-context에서 필요한 값을 가져감
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO savedmember = dao.selectUserForAuth(username);
//		VO에 memberUserDetails를 만들어서 돼지코 역할을 해줌(반환타입이랑 달라서 어뎁터 패턴을 이용한다)
		return new UserDetails(savedmember);
	}
	
	@Override
	public ServiceResult authenticate(UserVO user) {
		UserVO savedMember = dao.selectUserForAuth(user.getUser_id());
		ServiceResult result = null;
		if(savedMember!=null) {
			String inputPass = user.getUser_pass();
			try {
				String encodedPass = CryptoUtil.sha512(inputPass);
				String savedPass = savedMember.getUser_pass();
				if(savedPass.equals(encodedPass)) {
					try {
						BeanUtils.copyProperties(user, savedMember);
					} catch (IllegalAccessException | InvocationTargetException e) {
						throw new RuntimeException(e);
					}
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.INVALIDPASSWORD;
				}
			}catch (Exception e) {
				logger.error("", e);
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}



}










