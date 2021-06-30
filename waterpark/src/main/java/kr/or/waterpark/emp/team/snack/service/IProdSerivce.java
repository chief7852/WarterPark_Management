package kr.or.waterpark.emp.team.snack.service;

import java.util.List;

import kr.or.waterpark.emp.team.snack.vo.ProdVO;

/**
 * @author 작성자명
 * @since 2021. 5. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.      정이삭       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IProdSerivce {
	public List<ProdVO> retrieveProdList();

	public List<ProdVO> retrieveProdList(String lprod_id);
	
	public List<ProdVO> oneProdList(String prod_name);
}
