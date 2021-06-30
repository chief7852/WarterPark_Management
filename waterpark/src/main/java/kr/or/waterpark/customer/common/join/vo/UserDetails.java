package kr.or.waterpark.customer.common.join.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class UserDetails extends User{
	
	private static final long serialVersionUID = 1L;
	
	private UserVO user;
	
	public UserDetails(UserVO adaptee) {
		super(adaptee.getUser_id(), adaptee.getUser_pass(), AuthorityUtils.createAuthorityList(adaptee.getUser_auth()));
	}
	
	
	
}
