package kr.or.waterpark.common.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="uboard_no")
@NoArgsConstructor
@ToString(exclude="uboard_cont")
public class UboardVO implements Serializable{

	private String uboard_date;
	private Integer uboard_no;
	private String uboard_title;
	private String uboard_cont;
	private String uboard_del;
	private String luboard_code;
	private String llost_code;
	private Integer file_no;
	private Integer uboard_hit;
}
