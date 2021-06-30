package kr.or.waterpark.customer.common.login.service;

import java.security.NoSuchAlgorithmException;

import javax.inject.Inject;
import javax.management.RuntimeErrorException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.common.utils.PhoneAuthUtils;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.login.dao.IUserDAO;

@Service
public class UserServiceImpl implements IUserService{
	public static Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	@Inject
	private IUserDAO dao;
	
	@Override
	public UserVO retriveUser(String user_id) {
		UserVO savedUser = dao.selectUserDetail(user_id);
		if(savedUser == null) {
			throw new UsernameNotFoundException("아이디에 해당하는 회원이 존재하지 않습니다.");
		}
		return savedUser;
	}

	@Override
	public UserVO retrieveJoinUserInfo(UserVO user) {
		UserVO savedUser = dao.selectUserForPhoneAuth(user);
		logger.info("아 여기서 이상한데... : {} ", savedUser);
		return savedUser;
	}

	@Override
	public int changeUserPass(UserVO user) {
		String inputPass = user.getUser_pass();
		int cnt = 0;
		try {
			String encodedPass = CryptoUtil.sha512(inputPass);
			user.setUser_pass(encodedPass);
			cnt = dao.updateUserForPass(user);
			if(cnt <=0) {
				throw new RuntimeException("실패@!");
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return cnt;
	}

}
