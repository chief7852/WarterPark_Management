package kr.or.waterpark.emp.team.manage.emp.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.waterpark.emp.team.manage.emp.dao.IBudgetDAO;

@Service
public class BudgetService implements IBudgetService{

	private Logger logger = LoggerFactory.getLogger(BudgetService.class);
	@Inject
	private IBudgetDAO dao;
	//금일 이용권 수익
	@Override
	public String tickettingMoney() {

		return dao.tickettingMoney();
	}
	
	// 금일 방문예정이용객
	@Override
	public String reservevisitorToday() {
		// TODO Auto-generated method stub
		return dao.reservevisitorToday();
	}

	//금일 상품 수익
	@Override
	public String prodToday() {
		// TODO Auto-generated method stub
		return dao.prodToday();
	}
	
	//금일 총 이용객수
	@Override
	public String usevisitorToday() {
		// TODO Auto-generated method stub
		return dao.usevisitorToday();
	}

	//월별 이용객 데이터
	@Override
	public Map<String, Object> visitorMonth() {
		Map<String, Object> visitorMonth = new HashMap<>();
		for(int i = 1; i<=12 ;i++) {
			String visitorsTO = dao.visitorMonthTO(i);
			String visitorsOP = dao.visitorMonthOP(i);
			visitorMonth.put("tm"+i, visitorsTO);
			visitorMonth.put("om"+i, visitorsOP);
		}
		logger.info("visitorMonth : {}",visitorMonth);
		return visitorMonth;
	}

	//금일 상품만 판매 수익
	@Override
	public String todayMoneyPR() {
		// TODO Auto-generated method stub
		return dao.todayMoneyPR();
	}

	//금일 음식만 판매 수익
	@Override
	public String todayMoneyfood() {
		// TODO Auto-generated method stub
		return dao.todayMoneyfood();
	}
	
	
}
