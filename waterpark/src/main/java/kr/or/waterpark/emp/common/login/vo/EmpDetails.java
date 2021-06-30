package kr.or.waterpark.emp.common.login.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class EmpDetails extends User {
	
	private EmpVO emp;
	
	public EmpDetails(EmpVO adaptee) {
		super(adaptee.getEmp_id(), adaptee.getEmp_pass(), AuthorityUtils.createAuthorityList(adaptee.getUser_auth()));
	}
	
}
