package kr.or.waterpark.emp.team.snack.controller;

import static org.junit.Assert.assertEquals;

import javax.inject.Inject;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;

import kr.or.waterpark.emp.team.snack.dao.ICoinDAO;
import kr.or.waterpark.emp.team.snack.service.ICoinService;

public class PaymentControllerTest {
	
	@Inject
	private ICoinDAO dao;
	@Inject
	private WebApplicationContext container;
	@Test
	public void testCoinRead() {
		String coin_id = "CO2105170001";
		int result = dao.balanceCoin(coin_id);
		assertEquals(0, result);
	}

}
