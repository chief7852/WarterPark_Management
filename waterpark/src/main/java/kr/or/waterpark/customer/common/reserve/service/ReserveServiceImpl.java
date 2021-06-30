package kr.or.waterpark.customer.common.reserve.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.waterpark.Constants;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.customer.common.join.vo.UserVO;
import kr.or.waterpark.customer.common.reserve.dao.IMembershipDAO;
import kr.or.waterpark.customer.common.reserve.dao.IReserveDAO;
import kr.or.waterpark.customer.common.reserve.vo.MembershipVO;
import kr.or.waterpark.customer.common.reserve.vo.ResInfoVO;
import kr.or.waterpark.customer.common.reserve.vo.ReserveVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketListForResVO;
import kr.or.waterpark.customer.common.reserve.vo.TicketsForResVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import kr.or.waterpark.emp.team.snack.dao.ICoinDAO;
import kr.or.waterpark.emp.team.snack.vo.PagingVO;
import kr.or.waterpark.emp.team.ticketoffice.dao.IPosDAO;
import kr.or.waterpark.emp.team.ticketoffice.dao.IReadyMoneyDAO;
import kr.or.waterpark.emp.team.ticketoffice.dao.ITOSalesDAO;
import kr.or.waterpark.emp.team.ticketoffice.service.IPosService;
import kr.or.waterpark.emp.team.ticketoffice.vo.CoinVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.PosVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.ReadyMoneyVO;
import kr.or.waterpark.emp.team.ticketoffice.vo.TOSalesVO;

@Service
public class ReserveServiceImpl implements IReserveService {
	
	@Inject
	private IReserveDAO dao;
	
	@Inject
	private IMembershipDAO membershipDao;
	
	@Inject
	private ITicketService ticketService;
	
	@Inject
	private ITOSalesDAO tosaleDao;
	
	@Inject
	private ICoinDAO coinDao;
	
	@Inject
	private IPosService posService;
	
	@Inject
	private IReadyMoneyDAO RMDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveServiceImpl.class);
	

	@Override
	@Transactional
	public ServiceResult createReserve(TicketListForResVO ticketList, ServiceResult checkRequest) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = dao.insertReserve(ticketList);
		if(cnt > 0) {
			cnt += dao.insertPay(ticketList);
			if(cnt > 1) {
				for(TicketsForResVO idCnt : ticketList.getTicketListForRes()) {
					Map<String, Object> paramMap = new HashMap<>();
					paramMap.put("ticket_id", idCnt.getTicket_id());
					paramMap.put("res_code", ticketList.getRes_code());
					for(int i = 0; i < idCnt.getTicket_cnt(); i++) {
						cnt += dao.insertResInfo(paramMap);
					}
					if(cnt > 2 ) {
						result = ServiceResult.OK;
					}
					if(ServiceResult.YEARTICKET.equals(checkRequest)) {
						MembershipVO exMembership = membershipDao.selectMembershipCheck(ticketList.getUser_id());
						MembershipVO membershipForInsert = new MembershipVO();
						if(exMembership != null && "OK".equals(exMembership.getExtend_available())) {
							membershipForInsert.setMembership_parent(exMembership.getRes_info_code()); // 이전 예매번호를 새로 insert할 멤버십의 부모예매번호로 세팅
						}
						membershipForInsert.setRes_info_code(paramMap.get("res_info_code").toString());
						membershipForInsert.setUser_id(ticketList.getUser_id());
						
						int memCnt = membershipDao.insertMemberShip(membershipForInsert);
						if(memCnt > 0) {
							logger.info("membership insert 성공" + membershipForInsert.getRes_info_code());
						}else {
							result = ServiceResult.FAIL;
						}
					}
				}
			}
		}
		return result;
	}

	@Override
	public ServiceResult createUserForNonUser(UserVO user) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = dao.insertUserForNonUser(user);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<ReserveVO> retrieveReserveList(PagingVO<ReserveVO> paging) {
		return dao.selectReserveList(paging);
	}

	@Override
	public int retrieveReserveCount(PagingVO<ReserveVO> paging) {
		return dao.selectReserveCount(paging);
	}

	@Override
	public ServiceResult removeReserve(String res_code) {
		ServiceResult result = ServiceResult.FAIL;
		if(dao.selectReserveInfoView(res_code) == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			int cnt = dao.deleteReserve(res_code);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}

	@Override
	public ReserveVO retrieveReserveInfoView(String res_code) {
		return dao.selectReserveInfoView(res_code);
	}

	
	
	
	/**
	 * ticket office 업무
	 */
	
	@Override
	@Transactional
	public ServiceResult createReserveAtTO(TicketListForResVO ticketList, TOSalesVO tosale) {
		ServiceResult result = ServiceResult.FAIL;
		PosVO pos = posService.retirevePos(tosale);
//		logger.info("tosale : {}", tosale);
//		logger.info("pos select해서 가져온거 : {}", pos);
		if(pos == null) {
			pos = new PosVO();
			pos.setEmp_id(tosale.getEmp_id());
			pos.setFc_id(tosale.getFc_id());
			result = posService.createPos(pos);
			if(ServiceResult.FAIL.equals(result)) {
				return result;
			}
		}
		ServiceResult authResult = ticketService.retrieveTicketGrpList(ticketList);
		
		switch (authResult) {
		case DAYTICKET:
		case YEARTICKET:
			result = processCreateReserveAtTO(ticketList, authResult, tosale);
			break;

		default:
			result = authResult;
			break;
		}
		logger.info("result : {}", result);
		return result;
	}

	private ServiceResult processCreateReserveAtTO(TicketListForResVO ticketList, ServiceResult authResult, TOSalesVO tosale) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt= dao.insertReserve(ticketList);
		if(cnt > 0) {
			cnt +=  dao.insertPay(ticketList);
			if(cnt > 1) {
				// 매표소 매출 테이블에 넣어야함 그런데 직원이 깜박하고 업무 개시를 안했다면?
				// pos 업무 개시를 하고 나서 해야함
				// 그러려면 pos를 조회해봐야함 여기가 아니라 결제 시작하기 전에 넣어야겠다! ->createReserveAtTO에서!
				tosale.setRes_code(ticketList.getRes_code());
				cnt += tosaleDao.insertToSales(tosale);
				
				if("cash".equals(ticketList.getPay_method())) {
					for(ReadyMoneyVO rm : ticketList.getRMList()) {
						rm.setEmp_id(tosale.getEmp_id());
						rm.setPos_no(tosale.getPos_no());
						rm.setFc_id(tosale.getFc_id());
					}
					cnt += RMDao.insertReadyMoneyAtCharge(ticketList);
				}
				
				if(cnt > 2) {
					for(TicketsForResVO idCnt : ticketList.getTicketListForRes()) {
						Map<String, Object> paramMap = new HashMap<>();
						paramMap.put("ticket_id", idCnt.getTicket_id());
						paramMap.put("res_code", ticketList.getRes_code());
						for(int i = 0; i < idCnt.getTicket_cnt(); i++) {
							cnt += dao.insertResInfo(paramMap);
						}
						if(cnt > 3 ) {
							result = ServiceResult.OK;
						}
					}
				}
			}
		}
		return result;
	}

	@Override
	public ServiceResult createCoinCode(ReserveVO reserve) {
		ServiceResult result = ServiceResult.FAIL;
		ReserveVO savedReserve = dao.selectResInfoCodeList(reserve.getRes_code());
		logger.info("savedReserve : {}", savedReserve);
		if(savedReserve == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			if(StringUtils.isNotBlank(savedReserve.getRes_cancel())) {
				result = ServiceResult.CANCELED;
			}else {
				int cnt = 0;
				
				for(int i=0; i<savedReserve.getResInfoList().size(); i++) {
					ResInfoVO resInfo = savedReserve.getResInfoList().get(i);
					logger.info("for문 도는 중이야? : {}", resInfo);
					cnt += coinDao.insertCoinCode(resInfo);
					logger.info("resInfo 안에 뭐 들었지 : {}번째 {}",i, resInfo);
				}
				reserve.setResInfoList(savedReserve.getResInfoList());
//				encodeCoinCode(reserve);
				logger.info("reserve 안에 resinfolist : {}", reserve.getResInfoList());
				
				if(cnt > 0) {
					result = ServiceResult.OK;
				}
			}
		}
		return result;
	}

	private void encodeCoinCode(ReserveVO reserve) {
		for(ResInfoVO resInfo : reserve.getResInfoList()) {
			try {
				String encoded = CryptoUtil.encryptAES256(resInfo.getCoinList().get(0).getCoin_code(), Constants.POCKETKEY);
				resInfo.getCoinList().get(0).setCoin_code(encoded);
			} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException
					| NoSuchPaddingException | InvalidAlgorithmParameterException | IllegalBlockSizeException
					| BadPaddingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public ReserveVO retrieveAllResInfoAtTO(ReserveVO reserve) {
		decodeResCode(reserve);
		
		logger.info("service QR : {} ", reserve); 
		
		return dao.selectAllResInfoAtTO(reserve);
	}

	
	private void decodeResCode(ReserveVO reserve) {
		String res_code_encode = (String) reserve.getRes_code();
		if(res_code_encode != null) {
			try {
				String res_code = CryptoUtil.decryptAES256(res_code_encode, Constants.ENCODEKEYFORRESCODE);
				reserve.setRes_code(res_code);
			} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException
					| NoSuchPaddingException | InvalidAlgorithmParameterException | IllegalBlockSizeException
					| BadPaddingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public ServiceResult retrieveCoin(String coin_code) {
		ServiceResult result = ServiceResult.FAIL;
		ReserveVO reserve = dao.selectCoin(coin_code);
		if(reserve == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			List<CoinVO> coinList = reserve.getResInfoList().get(0).getCoinList();
			String selectedCode = coinList.get(0).getCoin_code();
			String selectedCancel = reserve.getRes_cancel();
			String selectedCodeEnd = coinList.get(0).getCoin_end();
			if(StringUtils.isBlank(selectedCode)) {
				result = ServiceResult.NOTEXIST;
			}else if(StringUtils.isNotBlank(selectedCancel)) {
				result = ServiceResult.CANCELED;
			}else if(StringUtils.isNotBlank(selectedCodeEnd)) {
				result = ServiceResult.EXPIRED;
			}else {
				result = ServiceResult.OK;
			}
		}
		return result;
	}
}
