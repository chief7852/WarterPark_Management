package kr.or.waterpark.emp.team.manage.emp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.emp.team.manage.emp.vo.CustomerUseInfoVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

@Repository
public interface ICustomerManageDAO {

	public int selectUserCount(PagingVO<UserVO> pagingVO);

	public List<UserVO> selectUserList(PagingVO<UserVO> pagingVO);

	public List<UserVO> selectUserDetails(String user_id);

	public List<CustomerUseInfoVO> selectUserPayDetails(String user_id);

	public String selectUserTotalAmount(String user_id);

	public int selectPayDetailCount(PagingVO<CustomerUseInfoVO> pagingVO);
	
	public List<CustomerUseInfoVO> selectUseInfoList(String user_id);
	
}
