package org.zrquan.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zrquan.sms.entity.Teacher;
import org.zrquan.sms.entity.User;
import org.zrquan.sms.service.ManagerServiceImpl;
import org.zrquan.sms.service.TeacherServiceImpl;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("teacher")
public class TeacherController {
	@Autowired
	TeacherServiceImpl teacherService;
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
	 * 教师教学课程查看
	 */
	@RequestMapping(value = {"course", "main"})
	public String getTeacherCourse(Model model,
								   HttpSession session) {
		User user = (User) session.getAttribute("user");
		String number = user.getAccountNumber();
		String courseInfo = teacherService.getCourseInfo(number);

		model.addAttribute("course", courseInfo);

		return "teacher/teacherCourse";
	}

	/**
	 * 成绩添加页面
	 */
	@RequestMapping("score")
	public String getTeacherScore(Model model,
								  @RequestParam int cid) {
		String score = teacherService.getCourseScore(cid);
		String tempScore = teacherService.getCourseTempScore(cid);

		if (!score.equals("")) {
			model.addAttribute("isCheck", true);
			model.addAttribute("scores", score);
		} else {
			model.addAttribute("isCheck", false);
			model.addAttribute("scores", tempScore);
		}

		return "teacher/teacherScore";
	}

	/**
	 * 教师个人信息（主页）
	 */
	@RequestMapping("profile")
	public String getTeacherProfile(Model model,
									HttpSession session) {
		User user = (User) session.getAttribute("user");
		String number = user.getAccountNumber();
		Teacher teacher = teacherService.getTeacherInfo(number);

		model.addAttribute("teach", teacher);

		return "teacher/teacherProfile";
	}

	@RequestMapping("feedback")
	public String sendFeedback() {
		return "teacher/teacherFeedback";
	}

	@RequestMapping(value = {"submitScore"}, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String submitScore(@RequestParam String scores) {
		boolean success = teacherService.submitScore(scores);

		if (success)
			return "成绩提交成功！";
		else
			return "提交失败！";
	}

	@RequestMapping("contact")
	public String getContact(Model model) {
		String userJson = managerService.getUserInfo();
		model.addAttribute("users", userJson);

		return "teacher/teacherContact";
	}
}
