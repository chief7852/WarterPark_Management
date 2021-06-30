package kr.or.waterpark.common.qna.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.waterpark.common.qna.dao.IQnaDAO;
import kr.or.waterpark.common.vo.QnaVO;



@Service
public class QnaServiceImpl implements IQnaService {
	private static final Logger logger =
			LoggerFactory.getLogger(QnaServiceImpl.class);
	
	private IQnaDAO qnaDAO;
	
	@Inject
	public void setQnaDAO(IQnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
		logger.info("주입된 qnaDAO : {}", qnaDAO.getClass().getName());
	}
	

	@Override
	public List<QnaVO> AllQnaList() {
		
		return qnaDAO.AllQnaList();
	}

	@Override
	public int insertQna(QnaVO qnaVO) {
		
		return qnaDAO.insertQna(qnaVO);
	}


	@Override
	public int deleteQna(int qna_no) {
		
		return qnaDAO.deleteQna(qna_no);
	}
	
}
