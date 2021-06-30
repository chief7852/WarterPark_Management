package kr.or.waterpark.emp.team.manage.emp.service;

import java.util.List;

import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.emp.team.manage.emp.vo.CustomerUseInfoVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

public interface ICustomerManageService {

	public List<UserVO> retrieveUserList(PagingVO<UserVO> pagingVO);
	
	public int retrieveUserCount(PagingVO<UserVO> pagingVO);

	public List<UserVO> retrieveUserDetails(String user_id);

	public List<CustomerUseInfoVO> retrievePayDetails(String user_id);
	
	public String retrieveTotalAmount(String user_id);

	public int retrieveDetailCount(PagingVO<CustomerUseInfoVO> pagingVO);

	public List<CustomerUseInfoVO> retrieveUserInfoList(String user_id);
	
}
