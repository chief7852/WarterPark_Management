package kr.or.waterpark.testchat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.waterpark.emp.common.login.vo.EmpVO;

@Controller
public class ControllerView {
	Logger logger = LoggerFactory.getLogger(ControllerView.class);
	// 채팅방 입장
	@RequestMapping(value = "/chzXat", method = RequestMethod.GET)
	public String view_chat(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		logger.info("입장");
		return "view_chat";
	}
}