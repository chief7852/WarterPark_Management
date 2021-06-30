package kr.or.waterpark.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * @author 김도윤
 * @since 2021. 5. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IComCodeDAO {

	/**
	 * 공통 코드 그룹을 이용하여 코드 그룹 목록을 조회
	 * @param com_code_grp 공통 코드 그룹
	 * @return
	 */
	public List<Map<String, Object>> selectComCodeList(String com_code_grp);
}
