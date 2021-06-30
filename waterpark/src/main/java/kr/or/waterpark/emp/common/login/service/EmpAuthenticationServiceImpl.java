package kr.or.waterpark.emp.common.login.service;

import java.lang.reflect.InvocationTargetException;

import javax.inject.Inject;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.emp.common.login.dao.IEmpDAO;
import kr.or.waterpark.emp.common.login.vo.EmpDetails;
import kr.or.waterpark.emp.common.login.vo.EmpVO;

/**
 * @author 문선준
 * @since 2021. 5. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25.   문선준                최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service("EmpAuthService")
public class EmpAuthenticationServiceImpl implements IEmpAuthenticationService, UserDetailsService{
	
	private static final Logger logger =
			LoggerFactory.getLogger(EmpAuthenticationServiceImpl.class);
	
	@Inject
	private IEmpDAO dao;
	
//	security-context에서 필요한 값을 가져감
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO savedEmp = dao.selectEmpForAuth(username);
		EmpVO emp = new EmpVO();
		emp.setEmp_id(savedEmp.getUser_id());
		emp.setUser_auth(savedEmp.getUser_auth());
		emp.setEmp_pass(savedEmp.getUser_pass());
		return new EmpDetails(emp);
	}

	
	@Override
	public ServiceResult authenticate(EmpVO emp) {
		UserVO savedEmp = dao.selectEmpForAuth(emp.getEmp_id());
		emp.setEmp_id(savedEmp.getUser_id());
		emp.setUser_auth(savedEmp.getUser_auth());
		emp.setEmp_pass(savedEmp.getUser_pass());
		ServiceResult result = null;
		if(savedEmp!=null) {
			String inputPass = emp.getEmp_pass();
			try {
				String encodedPass = CryptoUtil.sha512(inputPass);
				String savedPass = emp.getEmp_pass();
				if(savedPass.equals(encodedPass)) {
					try {
						BeanUtils.copyProperties(emp, savedEmp);
					} catch (IllegalAccessException | InvocationTargetException e) {
						throw new RuntimeException(e);
					}
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.INVALIDPASSWORD;
				}
			}catch (Exception e) {
				logger.error("FAIL", e);
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}


	
}
