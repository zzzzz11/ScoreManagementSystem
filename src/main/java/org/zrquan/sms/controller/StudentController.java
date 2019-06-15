package org.zrquan.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zrquan.sms.entity.Student;
import org.zrquan.sms.entity.User;
import org.zrquan.sms.service.StudentServiceImpl;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("student")
public class StudentController {
	@Autowired
	StudentServiceImpl studentService;

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
	 * 成绩展示页面（主页）
	 */
	@RequestMapping(value = {"score", "main"})
	public String getStudentScore(Model model,
								  HttpSession session) {
		User user = (User) session.getAttribute("user");
		String number = user.getAccountNumber();
		String scoreInfo = studentService.getScoreInfo(number);
		model.addAttribute("score", scoreInfo);

		return "student/studentScore";
	}

	/**
	 * 个人信息页面
	 */
	@RequestMapping("profile")
	public String getStudentProfile(Model model,
									HttpSession session) {
		User user = (User) session.getAttribute("user");
		String number = user.getAccountNumber();
		Student student = studentService.getStudentInfo(number);

		model.addAttribute("stu", student);

		return "student/studentProfile";
	}

	/**
	 * 没什么用的页面
	 */
	@RequestMapping("temp")
	public String showTempPage(Model model) {

		return "student/studentTemp";
	}
}
