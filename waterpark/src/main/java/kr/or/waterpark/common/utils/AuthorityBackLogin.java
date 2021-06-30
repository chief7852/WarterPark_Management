package kr.or.waterpark.common.utils;

import org.springframework.ui.Model;

public class AuthorityBackLogin {
	
	
	public void autorityBackLogin(Model model,String sessionTeam_code,String team_code) {
		
		if(!sessionTeam_code.equals(team_code)) {
			model.addAttribute("authority","접근권한이 없습니다");
			
		}
	}
	
}
