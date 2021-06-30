package kr.or.waterpark.emp.team.snack.service;



import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.waterpark.emp.team.snack.dao.IProdDAO;
import kr.or.waterpark.emp.team.snack.vo.ProdVO;

@Service
public class ProdServiceImpl implements IProdSerivce{
	
	private static final Logger logger = LoggerFactory.getLogger(ProdServiceImpl.class);
	
	@Inject
	private IProdDAO prodDAO;

	public void setprodDao(IProdDAO dao) {
		this.prodDAO = prodDAO;
		logger.info("주입된 iprodDAO : {}", prodDAO.getClass().getName());
	}
	
	@Override
	public List<ProdVO> retrieveProdList() {
		return prodDAO.selectProdList();
		
	}

	@Override
	public List<ProdVO> retrieveProdList(String lprod_id) {
		// TODO Auto-generated method stub
		return prodDAO.selectProdList(lprod_id);
	}

	@Override
	public List<ProdVO> oneProdList(String prod_name) {
		// TODO Auto-generated method stub
		return prodDAO.oneProdList(prod_name);
	}
	
	
	
}
