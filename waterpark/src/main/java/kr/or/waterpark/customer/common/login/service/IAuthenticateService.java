package kr.or.waterpark.customer.common.login.service;

import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.customer.common.join.vo.UserVO;

public interface IAuthenticateService {
	public ServiceResult authenticate(UserVO user);
}
