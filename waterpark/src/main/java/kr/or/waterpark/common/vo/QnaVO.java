package kr.or.waterpark.common.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 작성자명
 * @since 2021. 5. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.      작성자명       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="qna_no")
@NoArgsConstructor
@ToString(exclude="qna_cont")
public class QnaVO implements Serializable{
	
	private String qna_date;
	private Integer qna_no;
	private String user_id;
	private String qna_title;
	private String qna_cont;
	private String lqna_code;
	private String qna_answer;
	
	
	
}
