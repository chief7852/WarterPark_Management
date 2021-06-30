package kr.or.waterpark.customer.common.join.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.customer.common.join.vo.ClauseVO;
import kr.or.waterpark.customer.common.join.vo.UserVO;


@Repository
public interface IClauseDAO {

	/**
	 * @param clauseList
	 * @return ClauseVO 의 List를 반환한다. 
	 */
	public List<ClauseVO> getClauseList();
	
	/**
	 * @param UserVO
	 * @return 성공한 갯수 rowcnt > 0 반환
	 */
	public int insertClauseAgreements(UserVO user);
	
}
