package kr.or.waterpark.customer.common.join.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.customer.common.join.dao.IClauseDAO;
import kr.or.waterpark.customer.common.join.vo.ClauseVO;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.login.dao.IUserDAO;

@Service
public class CustomerJoinServiceImpl implements ICustomerJoinService{

	private static final Logger logger = LoggerFactory.getLogger(CustomerJoinServiceImpl.class);
	 
	private IClauseDAO clauseDAO;
	
	private IUserDAO userDAO;
	
	@Inject
	public void setClauseDAO(IClauseDAO clauseDAO) {
		this.clauseDAO = clauseDAO;
		logger.info("주입된 clauseDAO : {}", clauseDAO.getClass().getName());
	}

	@Inject
	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
		logger.info("주입된 userDAO : {}", userDAO.getClass().getName());
	}
	
	@Override
	public List<ClauseVO> retrieveClauseList() {
		List<ClauseVO> clauseList = clauseDAO.getClauseList();
		return clauseList;
	}

	@Override
	public ServiceResult createUser(UserVO user) {
		ServiceResult result = null;
		logger.info("CustomerJoinService 진입");
		if(userDAO.selectUserDetail(user.getUser_id()) == null) {
			String inputPass = user.getUser_pass();
			try {
				String encodedPass = CryptoUtil.sha512(inputPass);
				user.setUser_pass(encodedPass);
				int rowcnt = userDAO.insertUser(user);
				if(rowcnt>0) {
					int clauseCnt = clauseDAO.insertClauseAgreements(user);
					if(clauseCnt >0) {
						result = ServiceResult.OK;
					}
				}else {
					result = ServiceResult.FAIL;
				}// if~else~end
				
			} catch (Exception e) {
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		return result;
	}
	
}
