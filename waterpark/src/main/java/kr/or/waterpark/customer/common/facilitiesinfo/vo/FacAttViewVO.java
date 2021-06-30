package kr.or.waterpark.customer.common.facilitiesinfo.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 김도윤
 * @since 2021. 5. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 22.      김도윤       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode
@NoArgsConstructor
@ToString(exclude="att_desc")
public class FacAttViewVO implements Serializable {
	private String fc_id;
	private String fc_name;
	private String lfc_code;
	private String att_available;
	private String att_desc;
	private Integer att_wait;
	private Integer file_no;
	private String att_sdesc;
	private String file_path;
	private String file_origin;
	private String file_save;
	private String file_type;
	private String fc_photo;
}
