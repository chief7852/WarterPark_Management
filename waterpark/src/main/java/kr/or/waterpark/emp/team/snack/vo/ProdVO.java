package kr.or.waterpark.emp.team.snack.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(of="prod_code")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProdVO implements Serializable{
	
	
	 private String fc_id;
	 
	 private String lprod_code;
	
	 private String lprod_id;
	 
	 private String prod_code;
	
	 private String prod_name;
	
	 private String prod_price;
	 
	 private String prod_del;
	 
	 private String coin_code;
	 
	 private String life_prod_date;
	 
	 private String fc_name;
	 
	 private String inc_date;
	 
	 private String prod_photo;
	 
	 private int qty;
	

}
