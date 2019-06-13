package org.zrquan.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zrquan.sms.entity.User;
import org.zrquan.sms.service.ManagerServiceImpl;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("manager")
public class ManagerController {
	@Autowired
	ManagerServiceImpl managerService;

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
	 * 个人信息页面
	 */
	@RequestMapping(value = {"profile"})
	public String getManagerProfile(Model model) {

		return "manager/managerProfile";
	}

	/**
	 * 成绩审核页面
	 */
	@RequestMapping(value = {"page"})
	public String auditScore(Model model) {

		return "manager/managerScore";
	}

	@RequestMapping(value = {"detail"})
	public String getManagerDetail(Model model) {

		return "manager/managerDetail";
	}

	/**
	 * 课程管理页
	 */
	@RequestMapping(value = {"course", "main"})
	public String manageCourseInfo(Model model) {
		String courseJson = managerService.getCourseInfo();
		model.addAttribute("courses", courseJson);

		return "manager/managerCourse";
	}

	/**
	 * 用户管理页
	 */
	@RequestMapping("user")
	public String manageUserInfo(Model model) {
		String userJson = managerService.getCourseInfo();
		model.addAttribute("users", userJson);

		return "manager/managerUser";
	}
}
