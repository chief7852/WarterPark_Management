package kr.or.waterpark.emp.team.snack.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.waterpark.emp.team.snack.vo.ProdVO;

@Repository
public interface IProdDAO {
	
	public List<ProdVO> selectProdList();
	
	public List<ProdVO> selectProdList(String lprod_id);
	
	public List<ProdVO> oneProdList(String prod_name);
}
