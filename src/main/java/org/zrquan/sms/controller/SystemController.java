package org.zrquan.sms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zrquan.sms.entity.User;

import javax.servlet.http.HttpSession;

@Controller
public class SystemController {

	@RequestMapping("welcome")
	public String welcome(HttpSession session) {

		User user = (User) session.getAttribute("user");

		if (user != null)
			return String.format("redirect:%s/main", user.getUserType());

		return "loginPage";
	}
}
