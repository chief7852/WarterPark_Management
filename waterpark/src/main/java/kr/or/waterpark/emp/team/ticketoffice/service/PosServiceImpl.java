package kr.or.waterpark.emp.team.ticketoffice.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.emp.team.ticketoffice.dao.IPosDAO;
import kr.or.waterpark.emp.team.ticketoffice.dao.IReadyMoneyDAO;
import kr.or.waterpark.emp.team.ticketoffice.vo.PosVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.TOSalesVO;

/**
 * @author 김도윤
 * @since 2021. 6. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 16.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class PosServiceImpl implements IPosService {
	
	@Inject
	private IPosDAO dao;
	
	@Inject
	private IReadyMoneyDAO RMDao;

	@Override
	public ServiceResult createPos(PosVO pos) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = dao.insertPos(pos);
		if(cnt > 0) {
			cnt += RMDao.insertReadyMoneyAtStart(pos);
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public PosVO retirevePos(TOSalesVO tosale) {
		return dao.selectPos(tosale);
	}

	
	
}
