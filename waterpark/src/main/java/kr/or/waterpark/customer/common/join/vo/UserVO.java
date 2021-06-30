package kr.or.waterpark.customer.common.join.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 문선준
 * @since 2021. 5. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.   문선준               최초작성
 * 2021. 5. 27.   문선준               validator 적용
 * 2021. 6. 08.	  김도윤 			   멤버십 정보 가져오기
 * Copyright (c) 2021 by DDIT All right reserved
 *      </pre>
 */
@Data
@ToString(exclude = { "user_pass", "user_reg1", "user_reg2", "user_reg" })
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "user_id")
public class UserVO implements Serializable {

	public UserVO(String user_name, String user_hp) {
		super();
		this.user_name = user_name;
		this.user_hp = user_hp;
	}
	
	public UserVO(String user_name, String user_hp, String user_id) {
		super();
		this.user_name = user_name;
		this.user_hp = user_hp;
		this.user_id = user_id;
	}
	boolean idRemember = false;
	
	@NotBlank(message = "아이디를 입력해주세요")
	@Size(max = 12, message = "아이디의 길이는 12자 이하로 작성해 주세요")
	private String user_id;
	@NotBlank(message = "비밀번호를 입력해주세요")
	@Pattern(regexp = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$", message = "비밀번호에는 영소문자, 숫자 그리고 특수문자로 이루어져야 합니다.  ")
	private String user_pass;
	@NotBlank(message = "이름을 입력해 주세요")
	@Size(min = 1, max = 20, message = "이름은 1~20자를 입력해야 합니다.")
	private String user_name;
	private String user_reg;
	@NotBlank(message = "주민등록 번호 누락")
	@Size(min = 6, max = 6, message = "주민등록번호 앞자리 6자를 입력해 주세요")
	@Pattern(regexp = "^[0-9]*$", message = "숫자만 입력하세요")
	private String user_reg1;
	@NotBlank(message = "주민등록 번호 누락")
	@Size(min = 7, max = 7, message = "주만등록번호 뒷자리 7자를 입력해 주세요")
	@Pattern(regexp = "^[0-9]*$", message = "숫자만 입력하세요")
	private String user_reg2;
	@Email(message = "이메일 형식을 확인해주세요")
	private String user_mail;
	@NotBlank(message = "전화번호를 입력해 주세요")
	@Pattern(regexp = "^[0-9]*$", message = "숫자만 입력하세요")
	@Size(min = 10, max = 11, message = "전화번호는 하이폰을 제외한 숫자 10~11을 입력해주세요")
	private String user_hp;
	private String user_protect;
	private String user_del;
	private String user_auth;
	@NotBlank(message = "동의 여부를 체크해 주세요")
	private String user_agree;
	private String user_date;
	private List<ClauseVO> agreementList;
	private Integer rnum;
	private String ticket_type;
	private String com_code_name;
	private String agreement_check;
	private String membership_date;
	private String membership_end;
	private Integer membership_year;		// 현재 적용된 멤버십의 년수
	private String pay_date;
	private String pay_method;
	private String pay_amount;

}
