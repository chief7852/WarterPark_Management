package kr.or.waterpark.customer.common.reserve.dao;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.customer.common.reserve.vo.MembershipVO;

@Repository
public interface IMembershipDAO {
	
	/**
	 * 멤버십을 재가입햇을 대 연수를 유지할 수 있는지를 조회
	 * @param user_id
	 * @return
	 */
	public MembershipVO selectMembershipCheck(String user_id);
	
	/**
	 * 멤버십 insert
	 * @param membership - res_info_code, user_id, 경우에 따라 membership_parent
	 * @return
	 */
	public int insertMemberShip(MembershipVO membership);

}
