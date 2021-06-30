package kr.or.waterpark.common.uboard.service;

import java.util.List;


import kr.or.waterpark.common.vo.UboardVO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;

public interface IUboardService {

	List<UboardVO> faqList(String luboardCode);

	List<UboardVO> lostList(String luboardCode);

	List<UboardVO> noticeList(String luboardCode);

	public UboardVO noticeDetail(int uboard_no);

	public int noticeInsert(UboardVO uboardVO);

	public int noticeDelete(int uboard_no);

	public int faqInsert(UboardVO uboardVO);

	public int faqDelete(int uboard_no);

	public int lostInsert(UboardVO uboardVO);

	public List<UboardVO> retrieveLostList(PagingVO<UboardVO> pagingVO);
	
	public int retrieveLostCount(PagingVO<UboardVO> pagingVO);

	public int lostDelete(int uboard_no);

	public int noticeForm(UboardVO uboardVO);

	

}
