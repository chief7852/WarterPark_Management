package kr.or.waterpark.customer.common.reserve.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="res_info_code")
@ToString
@NoArgsConstructor
public class MembershipVO implements Serializable{
	private String res_info_code;
	private String membership_end;
	private String membership_parent;
	private String user_id;
	
	private String extend_available;
}
