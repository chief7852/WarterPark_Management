package kr.or.waterpark.common.uboard.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.waterpark.common.uboard.dao.IUboardDAO;

import kr.or.waterpark.common.vo.UboardVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

@Service
public class UboardServiceImpl implements IUboardService {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(UboardServiceImpl.class);
	
	private IUboardDAO uboardDAO;
	
	@Inject
	public void setUboardDAO(IUboardDAO uboardDAO) {
		this.uboardDAO = uboardDAO;
		logger.info("주입된 uboardDAO : {}", uboardDAO.getClass().getName());
	}
	
	@Override
	public List<UboardVO> faqList(String luboardCode) {
		
		return uboardDAO.faqList(luboardCode);
	}

	@Override
	public List<UboardVO> lostList(String luboardCode) {
		
		return uboardDAO.lostList(luboardCode);
	}

	@Override
	public List<UboardVO> noticeList(String luboardCode) {
		
		return uboardDAO.noticeList(luboardCode);
	}

	@Override
	public UboardVO noticeDetail(int uboard_no) {
		
		return uboardDAO.noticeDetail(uboard_no);
	}

	@Override
	public int noticeInsert(UboardVO uboardVO) {
		
		return uboardDAO.noticeInsert(uboardVO);
		
	}

	@Override
	public int noticeDelete(int uboard_no) {
		
		return uboardDAO.noticeDelete(uboard_no);
	}

	@Override
	public int faqInsert(UboardVO uboardVO) {
		
		return uboardDAO.faqInsert(uboardVO);
	}

	@Override
	public int faqDelete(int uboard_no) {
		
		return uboardDAO.faqDelete(uboard_no);
	}

	@Override
	public int lostInsert(UboardVO uboardVO) {

		return uboardDAO.lostInsert(uboardVO);
	}

	@Override
	public List<UboardVO> retrieveLostList(PagingVO<UboardVO> pagingVO) {
		
		return uboardDAO.selectLostList(pagingVO);
	}

	@Override
	public int retrieveLostCount(PagingVO<UboardVO> pagingVO) {
		
		return uboardDAO.selectLostCount(pagingVO);
	}

	@Override
	public int lostDelete(int uboard_no) {
		
		return uboardDAO.lostDelete(uboard_no);
	}

	@Override
	public int noticeForm(UboardVO uboardVO) {

		return uboardDAO.noticeForm(uboardVO);
	}


	

}
