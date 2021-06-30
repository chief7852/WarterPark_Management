package kr.or.waterpark.emp.team.manage.emp.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface IBudgetDAO {
	
	//금일이용권 수익
	public String tickettingMoney() ;
	
	//금일 방문 예정이용객
	public String reservevisitorToday();
	
	//금일 상품 수익
	public String prodToday();
	
	//금일 총 이용객수
	public String usevisitorToday();
	
	//월별 온라인 이용객 데이터
	public String visitorMonthOP(int month);
	
	//월별 현장 이용객 데이터
	public String visitorMonthTO(int month);
	
	//금일 상품만 판매 수익
	public String todayMoneyPR();
	
	//금일 음식만 판매 수익
	public String todayMoneyfood();
}
