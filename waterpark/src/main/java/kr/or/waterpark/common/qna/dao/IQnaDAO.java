package kr.or.waterpark.common.qna.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.common.vo.QnaVO;

@Repository
public interface IQnaDAO {
	
	public List<QnaVO> AllQnaList();

	public int insertQna(QnaVO qnaVO);

	public int deleteQna(int qna_no);
}
