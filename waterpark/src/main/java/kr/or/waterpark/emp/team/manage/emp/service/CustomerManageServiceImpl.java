package kr.or.waterpark.emp.team.manage.emp.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.emp.team.manage.emp.dao.ICustomerManageDAO;
import kr.or.waterpark.emp.team.manage.emp.vo.CustomerUseInfoVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

@Service
public class CustomerManageServiceImpl implements ICustomerManageService{

	private static Logger logger = LoggerFactory.getLogger(CustomerManageServiceImpl.class);
	
	@Inject
	private ICustomerManageDAO customerManageDAO;
	
	@Override
	public int retrieveUserCount(PagingVO<UserVO> pagingVO) {
		return customerManageDAO.selectUserCount(pagingVO);
	}
	
	@Override
	public List<UserVO> retrieveUserList(PagingVO<UserVO> pagingVO) {
		return customerManageDAO.selectUserList(pagingVO);
	}

	@Override
	public List<UserVO> retrieveUserDetails(String user_id) {
		List<UserVO> userList = null;
		try {
			userList = customerManageDAO.selectUserDetails(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public List<CustomerUseInfoVO> retrievePayDetails(String user_id) {
		return customerManageDAO.selectUserPayDetails(user_id);
	}

	@Override
	public String retrieveTotalAmount(String user_id) {
		return customerManageDAO.selectUserTotalAmount(user_id);
	}

	@Override
	public int retrieveDetailCount(PagingVO<CustomerUseInfoVO> pagingVO) {
		return customerManageDAO.selectPayDetailCount(pagingVO);
	}

	@Override
	public List<CustomerUseInfoVO> retrieveUserInfoList(String user_id) {
		return customerManageDAO.selectUseInfoList(user_id);
	}
	
}
