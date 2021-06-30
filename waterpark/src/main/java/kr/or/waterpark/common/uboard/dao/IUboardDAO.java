package kr.or.waterpark.common.uboard.dao;

import java.util.List;


import org.springframework.stereotype.Repository;


import kr.or.waterpark.common.vo.UboardVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

@Repository
public interface IUboardDAO {

	public List<UboardVO> faqList(String luboardCode);

	public List<UboardVO> lostList(String luboardCode);

	public List<UboardVO> noticeList(String luboardCode);
	
	public UboardVO noticeDetail(int uboard_no);

	public int noticeInsert(UboardVO uboardVO);

	public int noticeDelete(int uboard_no);

	public int faqInsert(UboardVO uboardVO);

	public int faqDelete(int uboard_no);

	public int lostInsert(UboardVO uboardVO);

	public List<UboardVO> selectLostList(PagingVO<UboardVO> pagingVO);

	public int selectLostCount(PagingVO<UboardVO> pagingVO);

	public int lostDelete(int uboard_no);

	public int noticeForm(UboardVO uboardVO);
	
	
}
