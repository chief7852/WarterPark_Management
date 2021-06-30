package kr.or.waterpark.customer.common.facilitiesinfo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.customer.common.facilitiesinfo.vo.FacAttViewVO;


/**
 * @author 김도윤
 * @since 2021. 5. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 22.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IFacilitiesDAO {
	
	public List<FacAttViewVO> selectAttractionList();
	
	public FacAttViewVO selectAttraction(String fc_id);
	

}
