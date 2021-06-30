package kr.or.waterpark.customer.common.reserve.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.waterpark.common.dao.IComCodeDAO;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.customer.common.reserve.dao.ITicketDAO;
import kr.or.waterpark.customer.common.reserve.vo.TicketListForResVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketVO;

@Service
public class TicketServiceImpl implements ITicketService {
	
	@Inject
	private ITicketDAO dao;
	

	@Override
	public List<TicketVO> retrieveSimpleTicketList(TicketVO ticket) {
		return dao.selectSimpleTicketList(ticket);
	}


	@Override
	public ServiceResult retrieveTicketGrpList(TicketListForResVO ticketRequest) {
		ServiceResult result = ServiceResult.DAYTICKET;
		List<String> grpList =	dao.selectTicketGrpList(ticketRequest);
		
		if(ticketRequest.getTicketListForRes().size() != grpList.size()) {
			result = ServiceResult.NOTEXIST;
		}else {
			if(grpList.size() == 1) {
				int ticket_cnt = ticketRequest.getTicketListForRes().get(0).getTicket_cnt();
				String firstGrp = grpList.get(0);
				if("YR".equals(firstGrp) && ticket_cnt == 1) {	// 연간 이용권을 한 종류, 한 장만 요청한 경우
					result = ServiceResult.YEARTICKET;
				}else if("YR".equals(firstGrp) && ticket_cnt > 1) {	//  연간 이용권의 종류는 하나이나, 여러 장 요청한 경우
					result = ServiceResult.NEEDONLYONE;
				}
			}else {
				for(String grp : grpList) {
					boolean isYear = false;
					if(isYear == false && "YR".equals(grp)) {		// 연간 이용권과 일일 이용권이 섞인 경우
						isYear = true;
						result = ServiceResult.MIXEDTICKET;
					}else if (isYear == true && "YR".equals(grp)) {	// 연간 이용권을 여러 종류 요청한 경우
						result = ServiceResult.NEEDONLYONE;
					}
				}
				
			}
			
		}
		return result;
	}


	@Override
	public List<TicketVO> retrieveTicketListForTO(String ticket_grp) {
		return dao.selectTicketListForTO(ticket_grp);
	}



}
