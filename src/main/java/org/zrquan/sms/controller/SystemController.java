package org.zrquan.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zrquan.sms.entity.User;
import org.zrquan.sms.service.CommonServiceImpl;

import javax.servlet.http.HttpSession;

@Controller
public class SystemController {
	@Autowired
	CommonServiceImpl commonService;

	@RequestMapping("welcome")
	public String welcome(HttpSession session) {

		User user = (User) session.getAttribute("user");

		if (user != null)
			return String.format("redirect:%s/main", user.getUserType());

		return "loginPage";
	}

	@RequestMapping(value = "feedback", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String feedback(HttpSession session,
						   @RequestParam String content) {
		User user = (User) session.getAttribute("user");
		boolean success = commonService.feedback(user.getAccountNumber(), content);

		if (success)
			return "上传成功";
		else
			return "上传失败";
	}
}
