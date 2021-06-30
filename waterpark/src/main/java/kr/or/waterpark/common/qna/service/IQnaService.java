package kr.or.waterpark.common.qna.service;

import java.util.List;

import kr.or.waterpark.common.vo.QnaVO;



public interface IQnaService {
	
	
	public List<QnaVO> AllQnaList();


	public int insertQna(QnaVO qnaVO);


	public int deleteQna(int qna_no);
}
