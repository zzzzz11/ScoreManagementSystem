package org.zrquan.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zrquan.sms.entity.Teacher;
import org.zrquan.sms.entity.User;
import org.zrquan.sms.service.TeacherServiceImpl;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("teacher")
public class TeacherController {
	@Autowired
	TeacherServiceImpl teacherService;

	/**
	 * 设置用户基本信息
	 */
	@ModelAttribute
	public void setUserInfo(Model model,
							HttpSession session) {

		User user = (User) session.getAttribute("user");

		model.addAttribute("name", user.getUserName());
		model.addAttribute("number", user.getAccountNumber());
	}

	/**
	 * 教师个人信息
	 */
	@RequestMapping(value = {"profile", "main"})
	public String getTeacherProfile(Model model,
									HttpSession session) {
		User user = (User) session.getAttribute("user");
		String number = user.getAccountNumber();
		Teacher teacher = teacherService.getTeacherInfo(number);

		model.addAttribute("teach", teacher);

		return "teacher/teacherProfile";
	}
}
