package kr.or.waterpark.emp.team.ticketoffice.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.waterpark.customer.common.reserve.dao.ISaleDAO;
import kr.or.waterpark.customer.common.reserve.vo.SaleVO;

@Controller
@RequestMapping("/ticketoffice")
public class SupplyOrderController {

	Logger logger = LoggerFactory.getLogger(SupplyOrderController.class);
	@Inject
	private ISaleDAO saleDao;
	
	
	@PostMapping("/getsales")
	@ResponseBody
	public List<SaleVO> getSaleList(){
		logger.info("sales접근");
		List<SaleVO> saleList = saleDao.selectSaleList("TO");
		return saleList;
	}
	
}
